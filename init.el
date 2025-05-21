(load "server")
(unless (server-running-p) (server-start))
;; (setq max-lisp-eval-depth 10000)
;; (setq max-specpdl-size 13000)
(setq inhibit-startup-message t)
(setq initial-buffer-choice nil)
(setq remember-notes-initial-major-mode 'org-mode)
(setq hightlight-indentation-mode nil)
(setq python-indent-offset 4)
(setq auto-save-timeout 30)
(setq confirm-kill-emacs 'yes-or-no-p)
(setq init-file-debug t)
(setq visible-bell nil)
(setq backup-inhibited t)
(setq custom-safe-themes t)
(setq default-directory "~")
(setq ring-bell-function 'ignore)
(setq cursor-type 'box)
(setq tab-width 4) 
(setq ielm-noisy nil)
(setq display-time-24hr-format 1)
(setq display-time-format  "%F %H:%M")
(setq display-time-interval 1)
(setq fill-column 70)
(setq doc-view-continuous t)
(setq org-fontify-emphasized-text t)
(setq lexical-binding t)
(setq split-width-threshold 0) ;; Emerging windows should be vertical instead of horizontal
(setq split-height-threshold nil)
;; (setq debug-on-error t)
(setq-default ispell-program-name "/usr/bin/aspell")
(setq ispell-dictionary "en")
(setf dired-kill-when-opening-new-dired-buffer t)
(display-battery-mode)
(tool-bar-mode -1)
(menu-bar-mode -1)
;; (undo-tree-mode -1)
(column-number-mode)
(electric-pair-mode -1)
(global-visual-line-mode 1) ;; Soft wrap of lines

 ;; (if (display-graphic-p)
 ;; 	 (enable-theme 'abyss)
 ;;   (enable-theme 'cyberpunk-2019))

(load-theme 'tango-dark)

;; (defun frame-pick-color-theme (frame)
;;   (select-frame frame)
;;   (if (window-system frame)
;;         (load-theme 'tango))
;;     (progn
;;       (load-theme 'tango-dark)))

;; (add-hook 'after-make-frame-functions 'frame-pick-color-theme)


(display-time-mode)
(set-cursor-color "Green")

(set-face-attribute 'default nil :height 160 :family "Monospace"
		    :font "Fira Code Retina") 
(require 'package)
(require 'cl-lib)
(require 'ielm)
(require 'epa-file)

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

(defun package-require (&rest packs)
  "Install and load a package. If the package is not available
   installs it automatically."
  (mapc (lambda (package)
		  (unless (package-installed-p package)
			(package-install package)
			))
		packs))

(package-require
  'ahk-mode
  'paredit
 'rainbow-delimiters
 'company)

;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; (setq package-check-signature nil)
;; (setq desktop-auto-save-timeout 5)
;; (linum-mode) ; DEPRECATED starting from version 30.0
;; (global-display-line-numbers-mode)
;; (setq initial-buffer-choice "remember-notes")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(display-theme base16-theme evil-tex chronos rainbow-delimiters rainbow-delimeters paredit paraedit
		   (ahk-mode)
		   (ahk-mode . abs-mode)
		   (ahk-mode abs-mode)
		   ahk-mode pandoc pandoc-mode latex-preview-pane lush-theme abyss-theme acme-theme adwaita-dark-theme amber-glow-theme ample-theme magit undo-tree evil markdown-mode lorem-ipsum jazz-theme iceberg-theme gotham-theme cyberpunk-theme cyberpunk-2019-theme browse-kill-ring atom-one-dark-theme atom-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun my-personal-makefile ()
  (display-line-numbers-mode 1)
  (local-set-key (kbd "C-c m") 'compile))

(add-hook 'make-mode #'my-personal-makefile)

(defun my-personal-pascal ()
  (display-line-numbers-mode 1)
  (undo-tree-mode 1)
  (local-set-key (kbd "C-c m") 'compile))

(add-hook 'pascal-mode-hook #'my-personal-pascal)

(defun my-personal-latex()
  (display-line-numbers-mode 1)
  (latex-electric-env-pair-mode 1))


(add-hook 'latex-mode-hook #'my-personal-latex)


(defun my-personal-c-lang ()
  (display-line-numbers-mode 1))

(add-hook 'c-mode-hook #'my-personal-c-lang)

(defun insert-current-date-time ()
  "Insert the current date and time into current buffer."
  (interactive) ;; "Interactive: Can be invoked using M-x"
  (insert (format-time-string "%Y-%m-%d %H:%M:%S") . (" Mexico Central Time"))
  )

(defun insert-end-of-entry ()
  "Insert a continuous line to delimit an note entry."
  (interactive)
  (insert "==================================")
  )

;; (define-advice delete-frame (:around (oldfun &rest args) confirm-frame-deletion)
;;   "Confirm deleting the frame."
;;   (interactive)
;;   (when (y-or-n-p "Delete frame? ")
;;     (apply oldfun args)))

(global-set-key (kbd "C-c q") 'quick-calc)
(global-set-key (kbd "C-c e") 'insert-end-of-entry)
(global-set-key (kbd "C-c d") 'insert-current-date-time)
(global-set-key (kbd "C-c n") 'remember-notes)
(global-set-key (kbd "C-x v") 'evil-mode)
(global-set-key (kbd "C-c p") 'latex-preview-pane-mode)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; (add-hook 'kill-buffer-hook (lambda () (kill-buffer (current-buffer))))

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (paredit-mode t)
            (rainbow-delimiters-mode t)
            (show-paren-mode 1)
            (undo-tree-mode 1)
	    ))

(add-hook 'lisp-interaction-mode
          (lambda ()
            (paredit-mode t)
            (rainbow-delimiters-mode t)
            (show-paren-mode 1)
	    (undo-tree-mode 1)))



(defun ielm/clear-repl ()
  1  "Clear current REPL buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (ielm-send-input)))



(define-key inferior-emacs-lisp-mode-map
  (kbd "M-RET")
  #'ielm-return)

(define-key inferior-emacs-lisp-mode-map
  (kbd "C-j")
  #'ielm-return)

(define-key inferior-emacs-lisp-mode-map
  (kbd "RET")
  #'electric-newline-and-maybe-indent)

(define-key inferior-emacs-lisp-mode-map
  (kbd "<up>")
  #'previous-line)

(define-key inferior-emacs-lisp-mode-map
  (kbd "<down>")
  #'next-line)

(define-key inferior-emacs-lisp-mode-map
  (kbd "C-c C-q")
  #'ielm/clear-repl)

;; Orgmode Options
(setq org-startup-folded t)
(setq org-catch-invisible-edits 1)
(org-babel-do-load-languages 'org-babel-load-languages '((python . t)))
(setq org-babel-python-command "python3")

;; Ispell can change languages

(let ((langs '("english" "spanish")))
  (defvar lang-ring (make-ring (length langs))
    "List of Ispell dictionaries you can switch to using ‘cycle-ispell-languages’.")
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()
  "Switch to the next Ispell dictionary in ‘lang-ring’."
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))

;; Cycle ispell-mode languages
;; (global-set-key [f10] #'cycle-ispell-languages)

(defun my-org-mode-hook ()
       (auto-fill-mode t)
       (set-fill-column 70))

(add-hook 'org-mode-hook 'my-org-mode-hook)

;; LocalWords:  setq emacs Monospace

