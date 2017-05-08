(require 'package)
(global-linum-mode 1)
(set 'linum-format "%3d ▍")

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(set 'package-enable-at-startup nil)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

; Save all backups in one directory
(set 'backup-directory-alist '(("." . "~/.emacs.d/backups")))

(use-package yaml-mode
  :ensure t
  :config
  (add-hook 'yaml-mode-hook
	    (lambda ()
	      (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

;; Require Evil Mode
(set 'evil-want-C-u-scroll t) ;Use <C-U> to scroll up

(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox :no-confirm t))

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (set 'helm-buffers-fuzzy-matching t))

(use-package helm-ls-git
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-p") 'helm-browse-project))

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(define-key evil-insert-state-map "jj" 'evil-force-normal-state)

;; Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
;; Also in visual mode
(define-key evil-visual-state-map "j" 'evil-next-visual-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)

(define-key evil-insert-state-map "\C-h" 'evil-backward-char)
(define-key evil-insert-state-map "\C-l" 'evil-forward-char)
(define-key evil-insert-state-map "\C-k" 'evil-previous-line)
(define-key evil-insert-state-map "\C-j" 'evil-next-line)

(electric-pair-mode 1) ;; Enable auto closing matching characters

(menu-bar-mode -1) ;; Remove menubar on top

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

(set-display-table-slot standard-display-table 'wrap ? )

;; Add _ to word motion
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w"))) ;; For Python
(add-hook 'ruby-mode-hook   #'(lambda () (modify-syntax-entry ?_ "w")))   ;; For ruby
(add-hook 'js2-mode-hook    #'(lambda () (modify-syntax-entry ?_ "w")))    ;; For Javascript


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d29231b2550e0d30b7d0d7fc54a7fb2aa7f47d1b110ee625c1a56b30fea3be0f" default)))
 '(package-selected-packages (quote (yaml-mode use-package evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
