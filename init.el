;; init.el :: Custom Emacs configuration
;; Author: Juan Gomez <juanrafaelgomez@gmail.com>
;; Last modification date: February 10, 2022.

(setq inhibit-startup-message t
	  initial-buffer-choice nil                                     ; Always start with the *scratch* buffer
	  initial-scratch-message ";; Scratchpad"
	  init-file-debug t
	  column-number-mode 1
	  default-directory "C:/Users/I506687/Documents"
	  org-directory "C:/Users/I506687/Documents/Org"
	  custom-safe-themes t
	  backup-inhibited t
	  visible-bell nil
	  confirm-kill-emacs 'yes-or-no-p                             ; Confirm exit
	  desktop-auto-save-timeout 5
	  auto-save-timeout 30
	  python-indent-offset 4                                      ; Python default indent value
	  hightlight-indentation-mode nil
	  )


(setq-default cursor-type 'box)
(setq-default tab-width 4) 
(setq-default set-cursor-color 'red)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
;; (desktop-save-mode 1)                                         ; Enable desktop save mode by default.
(auto-save-visited-mode 1)                                    ; Save the buffer every time it is visited.
(global-display-line-numbers-mode 1)                         ; display in al buffers the line numbers
(repeat-mode 1)                                               ; Some commands can be repeated. Look at info command page for more info.
(global-hl-line-mode 1)                                       ; Highlights the current line globally.
(display-time-mode -1)                                         ; Show current time in the mode line.
(electric-pair-mode -1)                                         ; Autocompletes parenthesis
(electric-indent-mode 1)                                       ; Autocompletes tabs 
;; (persistent-scratch-setup-default)                             ; Enable persistency in the *scratch* buffer.
;; (with-current-buffer "*scratch*" (emacs-lock-mode 'kill))      ; Avoids *scratch* buffer to be killed.
(load-theme 'base16-harmonic16-dark)                                   ; Loads theme

(add-hook 'doc-view-mode (lambda () (blink-cursor-mode 1)))    ; Disables blinking in PDF view

(use-package all-the-icons
  :if (display-graphic-p))

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; Font family and size
(set-face-attribute 'default nil
					:family "Monospace"
					:font "Fira Code Retina"
					:height 130
					:width 'ultra-expanded
					:weight 'normal
					:slant 'normal
					:underline nil
					)

;; Change theme line highlight color
 (set-face-background 'hl-line "#10446a")

	
;; Autosave always
(auto-save-mode 1)


(setenv "PATH" (concat (getenv "PATH") "c:/Users/I506687/AppData/Local/Programs/Python/Python311/Scripts/"))
(setenv "PATH" (concat (getenv "PATH") "C:/Users/I506687/AppData/Roaming/Python/Python311/site-packages/"))
(setq exec-path (append exec-path '("c:/Users/I506687/AppData/Local/Programs/Python/Python311/Scripts/")))


;; Remote repositories setup
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "http://orgmode.org/elpa/")
						 ("gnu" . "http://elpa.gnu.org/packages/")
						 ))

(package-initialize)

(defun packages-require (&rest packs)
  "Install and load a package. If the package is not available
	installs it automaticaly."
  (mapc  (lambda (package)
		   (unless (package-installed-p package)
			 (package-install package)
			 ;;#'package-require
			 ))
		 packs))

(packages-require
 'rainbow-delimiters
 'company
 'evil
 'slime
 'cl-lib
 'ivy
 'use-package
 )


;; Some performance improvements
;; Garbage collection frequency reduction from default
(setq gc-cons-threshold (* 50 1000 1000))

;; A hook (automated process) that provide us with information about the garbage collector
(add-hook 'emacs-startup-hook
		  (lambda ()
			(message "*** Emacs loaded in %s with %d garbage collections."
					 (format "%.2f seconds"
							 (float-time
							  (time-subtract after-init-time before-init-time)))
					 gcs-done)))

;; Emoji support added
(progn
  ;;set font for emoji (if before emacs 28, should come after setting symbols. emacs 28 now has 'emoji . before, emoji is part of 'symbol)
  (set-fontset-font
   t
   (if (version< emacs-version "28.1")
	   '(#x1f300 . #x1fad0)
	 'emoji
	 )
   (cond
	((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji")
	((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
	((member "Noto Emoji" (font-family-list)) "Noto Emoji")
	((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
	((member "Symbola" (font-family-list)) "Symbola"))))

;; Evil mode
(use-package evil)
(require 'evil)
(evil-mode 1) 
(setq evil-undo-system 'undo-redo)

;; Ivy-mode
(use-package ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t
	  ivy-count-format "(%d/%d) ")

;; Entry need for CL development
(setq inferior-lisp-program "sbcl")



;; Perl setup
(fset 'perl-mode 'cperl-mode)  ; use cperl-mode instead of perl-mode for PERL.
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(setq cperl-electric-keywords t) ;; expands for keywords such as foreach, while, etc...

	
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-formatter 'autopep8)
 '(elpy-syntax-check-command "flake8")
 '(package-selected-packages
   '(base16-theme clang-format org-roam flymake-flycheck vimrc-mode flycheck-pyflakes python-black all-the-icons-dired all-the-icons-gnus all-the-icons-ibuffer all-the-icons-ivy all-the-icons-ivy-rich all-the-icons-completion page-break-lines projectile-rails all-the-icons dashboard unkillable-scratch solarized-theme monokai-theme clues-theme smart-mode-line-atom-one-dark-theme powerline-evil atom-dark-theme persistent-scratch flymake-python-pyflakes evil-extra-operator projectile sxhkdrc-mode pylint lorem-ipsum py-autopep8 smart-mode-line-powerline-theme company-plsense ivy-yasnippet yasnippet-snippets eglot powershell forest-blue-theme subatomic256-theme xml+ xml-format magit pyvenv highlight-indentation s elpl jedi jedi-core jedi-direx zones auto-yasnippet pyenv-mode highlight-indent-guides company-ebdb elpy immaterial-theme material-theme git markdown-mode zuul yasnippet web-beautify use-package underwater-theme tron-legacy-theme spacemacs-theme slime rainbow-delimiters queue perl-doc org-babel-eval-in-repl org multiple-cursors mode-icons mmt gotham-theme flycheck f ewal evil display-wttr darktooth-theme darkroom darkokai-theme darkmine-theme darkburn-theme dark-mint-theme dark-krystal-theme darcula-theme danneskjold-theme dakrone-theme dakrone-light-theme cyberpunk-theme cyberpunk-2019-theme counsel company chronos boron-theme borland-blue-theme better-defaults anzu ahk-mode)))
	
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Smart mode line 
(sml/setup)
(setq sml/theme 'atom-one-dark)

; Elpy 
(use-package elpy
  :ensure t
  :init
  ;; (setq elpy-rpc-virtualenv-path 'current)
  (elpy-enable))

;; Enable Flycheck
;; (when (require 'flycheck nil t)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;; (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Format before save using black
(add-hook 'elpy-mode-hook (lambda () (add-hook 'before-save-hook 'elpy-black-fix-code nil t)))

;; Org-mode settings and keybindings
(add-to-list 'load-path "c:/Users/I506687/Documents/Org")
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)



;; Dashboard setup
;; (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (dashboard-setup-startup-hook))
;;   :init      ;; tweak dashboard config before loading it
;;   (setq dashboard-set-heading-icons t)
;;   (setq dashboard-set-file-icons t)
;;   (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
;;   ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
;;   (setq dashboard-startup-banner "~/.emacs.d/emacs-dash.png")  ;; use custom image as banner
;;   (setq dashboard-center-content nil) ;; set to 't' for centered content
;;   (setq dashboard-items '((recents . 7)
;;                           ; (agenda . 5 )
;;                           ; (bookmarks . 3)
;;                           ; (projects . 3)
;; 						  ;(registers . 3)
;; 						  ))
;;   :config
;;   (dashboard-setup-startup-hook)
;;   (dashboard-modify-heading-icons '((recents . "file-text")))


(use-package org-roam
  :ensure t)
