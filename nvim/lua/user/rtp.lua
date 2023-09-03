vim.cmd([[
set path+='/Users/farfanoide/.pyenv/versions/neovim3/lib/python3.10/site-packages'
if !empty($VIRTUAL_ENV)
    " auto add virtualenv path and tags if enabled
    " Fugitive .git/tags support removed in favor of
    set tags^=./.git/tags;
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python3.11/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python3.11/site-packages/*/tags')
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python3.10/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python3.10/site-packages/*/tags')
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python3.9/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python3.9/site-packages/*/tags')
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python3.8/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python3.8/site-packages/*/tags')
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python3.7/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python3.7/site-packages/*/tags')
    execute('set path+=' . $VIRTUAL_ENV . '/lib/python2.7/site-packages')
    execute('set tags+=' . $VIRTUAL_ENV . '/lib/python2.7/site-packages/*/tags')
    set path+=**/templates/,**/static/
endif
]])
