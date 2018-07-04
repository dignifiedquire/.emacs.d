;; Rust racer

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src") ;; Rust source code PATH

(setq rust-format-on-save t)
(add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode)
;; (add-hook 'racer-mode-hook #'company-mode)

;; lsp-ui
(require 'lsp-mode)
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(add-hook 'rust-mode-hook #'lsp-rust-enable)
(add-hook 'rust-mode-hook #'flycheck-mode)

(with-eval-after-load 'lsp-mode
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  (require 'lsp-rust))

(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
