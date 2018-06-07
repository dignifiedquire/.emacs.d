;; Rust racer

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src") ;; Rust source code PATH

(setq rust-format-on-save t)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
