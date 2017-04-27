(require 'package)

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
(set 'backup-directory-alist '(("." . "~/.emacs.d/saves")))

;; Require Evil Mode
(set 'evil-want-C-u-scroll t) ;Use <C-U> to scroll up

(use-package evil :ensure t)
(evil-mode t)

(use-package helm :ensure t)
(require 'helm-config)

(use-package evil-surround :ensure t)
(global-evil-surround-mode 1)

(define-key evil-insert-state-map "jj" 'evil-force-normal-state)
(define-key evil-insert-state-map "C-h" 'evil-force-normal-state)
 
(define-key evil-insert-state-map "\C-h" 'evil-backward-char)
(define-key evil-insert-state-map "\C-l" 'evil-forward-char)
(define-key evil-insert-state-map "\C-k" 'evil-previous-line)
(define-key evil-insert-state-map "\C-j" 'evil-next-line)

(electric-pair-mode 1) ; Enable auto closing matching characters

(menu-bar-mode -1) ; Remove menubar on top

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (key-chord helm use-package evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
