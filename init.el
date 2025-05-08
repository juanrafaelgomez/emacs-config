(setq inhibit-startup-message t)
(setq initial-buffer-choice nil)
(setq remember-notes-initial-major-mode 'org-mode)
(setq hightlight-indentation-mode nil)
(setq python-indent-offset 4)
(setq auto-save-timeout 30)
(setq confirm-kill-emacs 'yes-or-no-p)
(setq init-file-debug nil)
(setq visible-bell nil)
(setq backup-inhibited t)
(setq custom-safe-themes t)
(setq default-directory "/mnt/c/Users/I506687/OneDrive/Documentos")
(setq ring-bell-function 'ignore)
(setq cursor-type 'box)
(setq tab-width 4) 
(setq set-cursor-color 'red)
(tool-bar-mode -1)
(menu-bar-mode -1)
(undo-tree-mode -1)
(electric-pair-mode -1)
;; (global-visual-line-mode 1) ; Soft wrap of lines
(load-theme 'abyss)


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
   '(pandoc pandoc-mode latex-preview-pane lush-theme abyss-theme acme-theme adwaita-dark-theme amber-glow-theme ample-theme magit undo-tree evil markdown-mode lorem-ipsum jazz-theme iceberg-theme gotham-theme gnu-elpa-keyring-update cyberpunk-theme cyberpunk-2019-theme browse-kill-ring atom-one-dark-theme atom-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(defun my-personal-latex()
  (linum-mode 1)
 (latex-electric-env-pair-mode))


(add-hook 'latex-mode-hook 'my-personal-latex)


(defun my-personal-pascal()
		  (linum-mode 1))

(add-hook 'pascal-mode-hook 'my-personal-pascal)

(defun my-personal-c-lang()
		  (linum-mode 1))

(add-hook 'c-mode-hook 'my-personal-c-lang)


(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-x n") 'remember-notes)
(global-set-key (kbd "C-x v") 'evil-mode)
(global-set-key (kbd "C-x p") 'latex-preview-pane-mode)

