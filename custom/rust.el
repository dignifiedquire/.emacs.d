;; Cargo & toml

(use-package rust-mode
  :config
  (setq rust-indent-method-chain t)

  (defun my-rust-mode-hook ()
    (set (make-local-variable 'company-backends)
         '((company-lsp company-files :with company-yasnippet)
           (company-dabbrev-code company-dabbrev))))

  ;; format rust buffers using rustfmt(if it is installed)
  (add-hook 'rust-mode-hook
            (lambda ()
              (add-hook 'before-save-hook
                        (lambda ()
                          (time-stamp)
                          (rust-format-buffer)) nil t)))

  )

;; cargo-mode: execute cargo commands easily
;; https://github.com/kwrooijen/cargo.el
(use-package cargo
  :after rust-mode
  :hook ((rust-mode . cargo-minor-mode)))

(use-package lsp-mode
  :hook (rust-mode . lsp)
  :commands lsp lsp-mode lsp-workspace-folders-add
  :config
  (setq
   lsp-auto-guess-root nil
   lsp-keep-workspace-alive nil
   lsp-enable-file-watchers nil))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package helm-lsp
  :after lsp-mode
  :commands helm-lsp-workspace-symbol)

(use-package company-lsp
  :commands company-lsp)


;; (use-package rustic
;;   :hook ((rust-mode . (lambda ()
;;                         (lsp)
;;                         (lsp-ui-doc-mode)
;;                         (lsp-ui-sideline-mode)
;;                         (eldoc-mode)
;;                         (flycheck-mode)
;;                         (smart-dash-mode)
;;                         (company-mode))))

;; )

; (setq-default flycheck-disabled-checkers '(rustic-clippy))

;; (require 'lsp-mode)
;; (add-hook 'rust-mode-hook #'lsp)
;; (add-hook 'rust-mode-hook #'rustic-mode)

;; (require 'lsp-ui)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; (eval-after-load "cargo" '(diminish 'cargo-minor-mode))
;; (add-hook 'rust-mode #'cargo-minor-mode)

;; (add-hook 'rust-mode-hook 'cargo-minor-mode)

;; ;; Rust racer
;; (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
;; (setq racer-rust-src-path "~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src") ;; Rust source code PATH

;; (setq rust-format-on-save t)
;; (add-hook 'rust-mode-hook #'racer-mode)
;;  (add-hook 'racer-mode-hook #'eldoc-mode)
;;  (add-hook 'racer-mode-hook #'company-mode)

;; ;; lsp-ui
;; (add-hook 'prog-mode #'flycheck-mode)
;; (with-eval-after-load 'rust-mode
;;   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


; (eval-after-load "lsp-mode" '(progn
;    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;;   (require 'lsp-clients)
;;   (setq lsp-print-io t)
;;   (setq lsp-rust-rls-command '("rls"))
;;   (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;   (setq lsp-rust-rls-command '("rustup" "run" "nightly-2018-12-06" "rls"))
;;   (setenv "RUST_BACKTRACE" "full")
;;   (setenv "RUST_LOG" "rls::=debug")

;;  (setq lsp-rust-set-goto-def-racer-fallback t)
;;  (setq lsp-rust-set-cfg-test t)

;;   Fix problem seems to be caused by upgrading lsp-mode package to v3.
;;   (unless (fboundp 'lsp-rust-enable)
;;     (defun diabolo-lsp-rust-window-progress (_workspace params)
;;       "Progress report handling.
;; PARAMS progress report notification data."
;;       ;; Minimal implementation - we could show the progress as well.
;;       (setq id (gethash "id" params))
;;       (setq title (gethash "title" params))
;;       (setq msg (gethash "message" params))
;;       (setq done (gethash "done" params))
;;       (message "RLS: %s%s%s"
;;                title
;;                (if msg (format " \"%s\"" msg) "")
;;                (if done " done" "")))

;;     (defun lsp-rust-enable ()
;;       (require 'lsp-clients)
;;       ;; We don't realy need lsp-rust-rls-command for now, but we will support it
;;       (when (boundp 'lsp-rust-rls-command)
;;         (lsp-register-client
;;          (make-lsp-client :new-connection (lsp-stdio-connection lsp-rust-rls-command)
;;                           :major-modes '(rust-mode)
;;                           :server-id 'rls
;;                           :notification-handlers (lsp-ht ("window/progress" 'diabolo-lsp-rust-window-progress)))))
;;       (lsp)))
;; ))
