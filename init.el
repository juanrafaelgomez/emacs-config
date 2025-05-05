(setq inhibit-startup-message t)
(setq initial-buffer-choice '*scratch*)
(setq remember-notes-initial-major-mode 'org-mode)
(setq hightlight-indentation-mode nil)
(setq python-indent-offset 4)
(setq auto-save-timeout 30)
(setq confirm-kill-emacs 'yes-or-no-p)
(setq visible-bell nil)
(setq backup-inhibited t)
(setq custom-safe-themes t)
(setq default-directory "/mnt/c/Users/I506687/OneDrive/Documentos")
(setq init-file-debug nil)
(setq ring-bell-function 'ignore)
(setq-default cursor-type 'box)
(setq-default tab-width 4) 
(setq-default set-cursor-color 'red)
(tool-bar-mode -1)
(menu-bar-mode -1)
(undo-tree-mode -1)
(electric-pair-mode 1)
(global-visual-line-mode 1) ; Soft wrap of lines
(load-theme 'tango-dark)


(set-face-attribute 'default nil :height 140 :family "Monospace"
					:font "Fira Code Retina") 
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")
						 ("gnu" . "http://elpa.gnu.org/packages/")
						 ))
(package-initialize)

(defun package-require (&rest packs)
  (mapc (lambda (package)
		  (unless (package-installed-p package)
			(package-install package)
			))
		packs))

(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-x n") 'remember-notes)
(put 'upcase-region 'disabled nil)
(put 'lowercase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; (Setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; (setq package-check-signature nil)
;; (setq desktop-auto-save-timeout 5)
; (linum-mode)
; (global-display-line-numbers-mode)
; (setq initial-buffer-choice "remember-notes")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit undo-tree evil markdown-mode lorem-ipsum jazz-theme iceberg-theme gotham-theme gnu-elpa-keyring-update cyberpunk-theme cyberpunk-2019-theme browse-kill-ring atom-one-dark-theme atom-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
