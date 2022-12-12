;; init.el :: Custom Emacs configuration
;; Author: Juan Gomez <juanrafaelgomez@gmail.com>
;; Last modification date: November 11, 2022.

(setq inhibit-startup-message t
      init-file-debug t
      cursor-type 'box
      column-number-mode 1
      default-directory "C:/Users/I506687/Documents"
      org-directory "C:/Users/I506687/Documents/Org"
      initial-buffer-choice nil                                     ; Always start with the *scratch* buffer
      initial-scratch-message nil                                           ; No scratch message
      custom-safe-themes t
      backup-inhibited t
      visible-bell nil
      confirm-kill-emacs 'yes-or-no-p                             ; Confirm exit
      desktop-auto-save-timeout 5
	  python-indent-offset 4                                      ; Python default indent value
	  hightlight-indentation-mode nil
)

;; For global tab width
(setq-default tab-width 4) 

;; Experimental (do not add to main configuration until understood!) 
;; (setq fringe-mode '(50. 10))
;; (setq fringe-styles "minimal")
;;(setq fringe-bitmaps "left-arrow")

 
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(desktop-save-mode 1)                                         ; Enable desktop save mode by default.
(auto-save-visited-mode 1)                                    ; Save the buffer every time it is visited.
(global-display-line-numbers-mode 1)                         ; display in al buffers the line numbers
(repeat-mode 1)                                               ; Some commands can be repeated. Look at info command page for more info.
(global-hl-line-mode 1)                                       ; Highlights the current line globally.
(display-time-mode -1)                                         ; Show current time in the mode line.
(electric-pair-mode -1)                                         ; Autocompletes parenthesis
(electric-indent-mode 1)                                       ; Autocompletes tabs 


;; Load theme
(load-theme 'spacemacs-dark)

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

;; Autosave always
(auto-save-mode 1)

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
(evil-mode)
(setq evil-undo-system 'undo-redo)

;; Ivy-mode
(use-package ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t
	  ivy-count-format "(%d/%d) ")

;; Entry need for CL development
(setq inferior-lisp-program "sbcl")

;; Org-mode keybindings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


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
 '(elpy-syntax-check-command "flake8")
 '(package-selected-packages
   '(powerline powerline-evil forest-blue-theme subatomic256-theme xml+ xml-format magit pyvenv highlight-indentation s elpl jedi jedi-core jedi-direx zones auto-yasnippet pyenv-mode highlight-indent-guides company-ebdb elpy immaterial-theme material-theme git markdown-mode zuul yasnippet web-beautify use-package underwater-theme tron-legacy-theme spacemacs-theme slime rainbow-delimiters queue perl-doc org-babel-eval-in-repl org multiple-cursors mode-icons mmt gotham-theme flycheck f ewal evil display-wttr darktooth-theme darkroom darkokai-theme darkmine-theme darkburn-theme dark-mint-theme dark-krystal-theme darcula-theme danneskjold-theme dakrone-theme dakrone-light-theme cyberpunk-theme cyberpunk-2019-theme counsel company chronos boron-theme borland-blue-theme better-defaults anzu ahk-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Using elpy instead of default python-mode for extended features:
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(load "elpy")
(load "elpy-rpc")
(load "elpy-shell")
(load "elpy-profile")
(load "elpy-refactor")
(load "elpy-django")

(setq python-shell-interpreter "python"   ;; TODO replace with iPython
      python-shell-interpreter-args "-i")

(require 'powerline)
(powerline-evil-vim-theme)

