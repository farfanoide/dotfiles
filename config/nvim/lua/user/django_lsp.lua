local M = {}

function M.django_root(bufnr)
	local root = vim.fs.root(bufnr, "manage.py")
	if not root then
		return nil
	end
	local manage = table.concat(vim.fn.readfile(root .. "/manage.py"), "\n")
	if manage:find("django.core.management", 1, true) then
		return root
	end
end

function M.python_root(bufnr)
	local name = vim.api.nvim_buf_get_name(bufnr)
	return vim.fs.root(bufnr, vim.lsp.config.pyright.root_markers)
		or (name ~= "" and vim.fs.dirname(name))
		or vim.fn.getcwd()
end

function M.python_interpreter(root)
	local environments = { root .. "/.venv", root .. "/venv", vim.env.VIRTUAL_ENV or "", vim.env.CONDA_PREFIX or "" }
	for _, environment in ipairs(environments) do
		if environment ~= "" then
			local interpreter = environment .. "/bin/python"
			if vim.fn.executable(interpreter) == 1 then
				return interpreter
			end
		end
	end
end

function M.setup(capabilities, zuban)
	vim.api.nvim_create_user_command("DjangoCheck", function()
		local root = M.django_root(0)
		if not root or vim.fn.executable(root .. "/bin/check-types") ~= 1 then
			vim.notify("This project needs an executable bin/check-types command", vim.log.levels.WARN)
			return
		end
		if vim.bo.modified then
			vim.notify("Save this file before running DjangoCheck", vim.log.levels.WARN)
			return
		end
		vim.notify("Checking Django types…")
		vim.system(
			{ root .. "/bin/check-types", vim.api.nvim_buf_get_name(0) },
			{
				cwd = root,
				text = true,
				timeout = 120000,
			},
			vim.schedule_wrap(function(result)
				local items = {}
				for line in (result.stdout or ""):gmatch("[^\n]+") do
					local file, row, col, kind, message = line:match("^(.-):(%d+):(%d+): (%w+): (.*)$")
					if file then
						table.insert(items, {
							filename = file:sub(1, 1) == "/" and file or root .. "/" .. file,
							lnum = tonumber(row),
							col = tonumber(col),
							type = kind == "error" and "E" or "I",
							text = message,
						})
					end
				end
				vim.fn.setqflist({}, " ", { title = "Django type check", items = items })
				if #items > 0 then
					vim.cmd("copen")
				elseif result.code == 0 then
					vim.notify("Django type check passed")
				end
				if result.code ~= 0 and (#items == 0 or result.code ~= 1) then
					vim.notify(
						"Django type check failed: " .. (result.stderr or "") .. (result.stdout or ""),
						vim.log.levels.ERROR
					)
				end
			end)
		)
	end, { desc = "Check the saved Python file with the project's Django-aware mypy configuration" })

	vim.lsp.config("zuban", {
		cmd = function(dispatchers, config)
			return vim.lsp.rpc.start({ zuban, "server" }, dispatchers, {
				cwd = config.root_dir,
			})
		end,
		filetypes = { "python" },
		capabilities = capabilities,
		root_dir = function(bufnr, on_dir)
			if zuban then
				on_dir(M.django_root(bufnr) or M.python_root(bufnr))
			end
		end,
		before_init = function(_, config)
			config.init_options.pythonExecutable = M.python_interpreter(config.root_dir)
		end,
		-- on_init = function(client)
		-- 	-- Zuban can block its request loop while resolving document highlights.
		-- 	client.server_capabilities.documentHighlightProvider = false
		-- end,
		-- on_attach = function(_, bufnr)
		-- 	require("user.python_highlights").attach(bufnr)
		-- end,
		init_options = {
			typeCheckingMode = "default",
			diagnosticMode = "open-files-only",
		},
	})
	vim.lsp.enable("zuban")

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "html",
		group = vim.api.nvim_create_augroup("django-template-filetype", { clear = true }),
		callback = function(event)
			if M.django_root(event.buf) and vim.api.nvim_buf_get_name(event.buf):find("/templates/", 1, true) then
				vim.bo[event.buf].filetype = "htmldjango"
			end
		end,
	})
	vim.lsp.config("djls", {
		cmd = function(dispatchers, config)
			return vim.lsp.rpc.start({ config.root_dir .. "/.venv-editor/bin/djls", "serve" }, dispatchers, {
				cwd = config.root_dir,
			})
		end,
		filetypes = { "htmldjango" },
		capabilities = capabilities,
		root_dir = function(bufnr, on_dir)
			local root = M.django_root(bufnr)
			if root and vim.fn.executable(root .. "/.venv-editor/bin/djls") == 1 then
				on_dir(root)
			end
		end,
	})
	vim.lsp.enable("djls")
end

return M
