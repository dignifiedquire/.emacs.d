(use-package flycheck
  :config (global-flycheck-mode))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; No more temp files
;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)
(setq delete-old-versions t)

;; Save desktop
;;(desktop-save-mode 1)
(setq history-length 500)
;; (add-to-list 'desktop-globals-to-save 'file-name-history)
;; (add-to-list 'desktop-modes-not-to-save 'dired-mode)
;; (add-to-list 'desktop-modes-not-to-save 'Info-mode)
;; (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
;; (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; Coding

;; Tabs
(setq tab-width 2)
(setq default-tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq less-css-indent-level 2)

;; Delete trailing whitespace on save
(remove-hook 'before-save-hook 'delete-trailing-whitespace)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

(use-package smartparens
  :init
  (progn
    (smartparens-global-mode 1)
    (show-smartparens-global-mode 1))
  :config
  (progn
    (setq smartparens-strict-mode t)))

;; (sp-with-modes '(rhtml-mode)
;;                (sp-local-pair "<" ">")
;;                (sp-local-pair "<%" "%>"))


;; Organizational

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Activate copy and paste
(use-package pbcopy
  :init
  (turn-on-pbcopy))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setenv "LANG" "de_DE.UTF-8")

;; dirtree
; (autoload 'dirtree "dirtree" "Add directory to tree view" t)

;; yasnippet
; (use-package yasnippet)
;; should be loaded before auto complete so that they can work together
;(yas-global-mode 1)

;; auto complete mod
; (require 'auto-complete)
;; should be loaded after yasnippet so that they can work together
; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
; (ac-config-default)
;; set the trigger key so that it can work together with yasnippet on tab key,
;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;; activate, otherwise, auto-complete will
; (ac-set-trigger-key "TAB")
; (ac-set-trigger-key "<tab>")

;; Move between windows
;;(define-key global-map (kbd "M-p") 'previous-multiframe-window)
(define-key global-map (kbd "M-n") 'other-window)

;; Unindent
(defun my-indent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N 2))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(defun my-unindent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N -2))
             (setq deactivate-mark nil))
    (self-insert-command N)))

(define-key global-map (kbd "C-c >") 'my-indent-region)
(define-key global-map (kbd "C-c <") 'my-unindent-region)

;; Dash
; (global-set-key "\M-#" 'dash-at-point)
; (global-set-key "\C-ce" 'dash-at-point-with-docset)

;; Fringe
;;(fringe-mode 4)

;; default font
(set-face-attribute 'default nil :family "Operator Mono")

(let ((font "Operator Mono Light 18"))
  (set-frame-font font)
  (add-to-list 'default-frame-alist
               `(font . ,font)))

; (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; (use-package rg
;;   :config
;;   (rg-enable-default-bindings))


(use-package helm-rg)
(use-package deadgreap)

;; smart-dash: underscores without having to press shift modifier for dash key
(use-package smart-dash
  :config (require 'smart-dash)
  :commands smart-dash-mode)


(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package xterm-color)
(use-package magit-delta)

(use-package forge
  :after magit)

;; Emacs command shell
(use-package eshell
  :defines
  (compilation-last-buffer eshell-prompt-function)
  :hook (eshell-mode . (lambda ()
                         (bind-key "C-l" 'eshell/clear eshell-mode-map)
                         (eshell/alias "f" "find-file $1")
                         (eshell/alias "fo" "find-file-other-window $1")
                         (eshell/alias "d" "dired $1")
                         (eshell/alias "ll" "ls -l")
                         (eshell/alias "la" "ls -al")))
  :commands
  (eshell/alias
   eshell-send-input eshell-flatten-list
   eshell-interactive-output-p eshell-parse-command))

;; Fish-like history autosuggestions
(use-package esh-autosuggest
  :defines ivy-display-functions-alist
  :preface
  (defun setup-eshell-ivy-completion ()
    (setq-local ivy-display-functions-alist
                (remq (assoc 'ivy-completion-in-region ivy-display-functions-alist)
                      ivy-display-functions-alist)))
  :bind (:map eshell-mode-map
              ([remap eshell-pcomplete] . completion-at-point))
  :hook ((eshell-mode . esh-autosuggest-mode)
         (eshell-mode . setup-eshell-ivy-completion)))

;; Eldoc support
(use-package esh-help
  :init (setup-esh-help-eldoc))

;; `cd' to frequent directory in eshell
(use-package eshell-z
  :hook (eshell-mode
         .
         (lambda () (require 'eshell-z))))

;; ANSI & XTERM 256 color support
(use-package xterm-color
  :after eshell
  :defines (compilation-environment
            eshell-preoutput-filter-functions
            eshell-output-filter-functions)
  :functions compilation-filter
  :init
  ;; For shell
  (setenv "TERM" "xterm-256color")
  (setq comint-output-filter-functions
        (remove 'ansi-color-process-output comint-output-filter-functions))
  (add-hook 'shell-mode-hook
            (lambda ()
              ;; Disable font-locking in this buffer to improve performance
              (font-lock-mode -1)
              ;; Prevent font-locking from being re-enabled in this buffer
              (make-local-variable 'font-lock-function)
              (setq font-lock-function (lambda (_) nil))
              (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))

  ;; For eshell
  (with-eval-after-load 'eshell
    (add-hook 'eshell-before-prompt-hook
              (lambda ()
                (setq xterm-color-preserve-properties t)))
    (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
    (setq eshell-output-filter-functions
          (remove 'eshell-handle-ansi-color eshell-output-filter-functions)))

  ;; For compilation buffers
  (setq compilation-environment '("TERM=xterm-256color"))
  (add-hook 'compilation-start-hook
            (lambda (proc)
              ;; We need to differentiate between compilation-mode buffers
              ;; and running as part of comint (which at this point we assume
              ;; has been configured separately for xterm-color)
              (when (eq (process-filter proc) 'compilation-filter)
                ;; This is a process associated with a compilation-mode buffer.
                ;; We may call `xterm-color-filter' before its own filter function.
                (set-process-filter
                 proc
                 (lambda (proc string)
                   (funcall 'compilation-filter proc
                            (xterm-color-filter string))))))))

;; (use-package slime
;;   :bind
;;   ("C-c z" . slime-repl)
;;   ;; :init
;;   ;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;;   ;; (setq inferior-lisp-program "/usr/local/bin/sbcl") 
;;   ;; (add-to-list 'slime-contribs 'slime-repl)
;;   )
;;  

(use-package opencl-mode)

(use-package spaceline
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'utf-8)
  (spaceline-spacemacs-theme)
)

