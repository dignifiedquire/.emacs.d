;;; Extra config: Development tools

;;; Usage: Append or require this file from init.el for some software
;;; development-focused packages.
;;;
;;; It is **STRONGLY** recommended that you use the base.el config if you want to
;;; use Eglot. Lots of completion things will work better.
;;;
;;; This will try to use tree-sitter modes for many languages. Please run
;;;
;;;   M-x treesit-install-language-grammar
;;;
;;; Before trying to use a treesit mode.

;;; Contents:
;;;
;;;  - Built-in config for developers
;;;  - Version Control
;;;  - Common file types
;;;  - Eglot, the built-in LSP client for Emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Built-in config for developers
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
  :config
  ;; Treesitter config

  ;; Tell Emacs to prefer the treesitter mode
  ;; You'll want to run the command `M-x treesit-install-language-grammar' before editing.
  (setq major-mode-remap-alist
        '((yaml-mode . yaml-ts-mode)
          (bash-mode . bash-ts-mode)
          (rust-mode . rust-ts-mode)
          (js2-mode . js-ts-mode)
	  (toml-mode . toml-ts-mode)
          (typescript-mode . typescript-ts-mode)
          (tsx-mode . tsx-ts-mode)
          (json-mode . json-ts-mode)
          (css-mode . css-ts-mode)
          (dockerfile-mode . dockerfile-ts-mode)
          (python-mode . python-ts-mode)))
  :hook
  ;; Auto parenthesis matching
  ((prog-mode . electric-pair-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Version Control
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Magit: best Git client to ever exist
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Common file types
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package markdown-mode
  :ensure t
  :hook ((markdown-mode . visual-line-mode)))

(use-package yaml-mode
  :ensure t)

(use-package json-mode
  :ensure t)

;; Emacs ships with a lot of popular programming language modes. If it's not
;; built in, you're almost certain to find a mode for the language you're
;; looking for with a quick Internet search.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Eglot, the built-in LSP client for Emacs
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Helpful resources:
;;
;;  - https://www.masteringemacs.org/article/seamlessly-merge-multiple-documentation-sources-eldoc

(use-package eglot
  ;; no :ensure t here because it's built-in

  ;; Configure hooks to automatically turn-on eglot for selected modes
  :hook
  (((python-ts-mode ruby-ts-mode elixir-ts-mode rust-ts-mode typescript-ts-mode js2-ts-mode rust-ts-mode tsx-ts-mode) . eglot-ensure))

  :custom
  (eglot-send-changes-idle-time 0.1)
  (eglot-extend-to-xref t)              ; activate Eglot in referenced non-project files

  :config
  (fset #'jsonrpc--log-event #'ignore)  ; massive perf boost---don't log every event
  ;; Sometimes you need to tell Eglot where to find the language server
  ; (add-to-list 'eglot-server-programs
  ;              '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))
  (add-hook 'before-save-hook 'eglot-format-buffer nil t)
  (setq eglot-autoshutdown t))


(use-package eglot-x
  :vc (:url "https://github.com/nemethf/eglot-x")
  :after eglot
  :config
  (with-eval-after-load 'eglot (require 'eglot-x)))  

;; Tabs
(setq tab-width 2)
(setq default-tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq less-css-indent-level 2)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package smartparens-mode
  :ensure smartparens
  :hook (prog-mode text-mode markdown-mode rust-mode tsx-mode typescript-mode js2-mode)
  :config
  ;; load default config
  (require 'smartparens-config))


(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(add-to-list 'auto-mode-alist '("\\.ts?$" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . tsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))
(add-to-list 'auto-mode-alist '("\\.toml$" . toml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.sh$" . bash-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
