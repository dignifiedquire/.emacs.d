;; Cargo & toml

(use-package exec-path-from-shell)

(use-package rust-mode
  :config
  (setq rust-indent-method-chain t)

  ;; (defun my-rust-mode-hook ()
  ;;   (set (make-local-variable 'company-backends)
  ;;        '((company-lsp company-files :with company-yasnippet)
  ;;          (company-dabbrev-code company-dabbrev))))

  ;; format rust buffers using rustfmt(if it is installed)
  (add-hook 'rust-mode-hook
            (lambda ()
              (add-hook 'before-save-hook
                        (lambda () (when (eq 'rust-mode major-mode)
                                     (lsp-format-buffer)))))
  )
  :hook((rust-mode . yas-minor-mode))
)

;; cargo-mode: execute cargo commands easily
;; https://github.com/kwrooijen/cargo.el
(use-package cargo
  :after rust-mode
  :hook ((rust-mode . cargo-minor-mode)))

; (use-package rust-analyzer)

(use-package lsp-mode
  :hook (
         (rust-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         )
  :commands lsp lsp-deferred lsp-mode lsp-workspace-folders-add
  :config
  (setq lsp-auto-guess-root nil
        lsp-keep-workspace-alive nil
        lsp-enable-file-watchers nil
        lsp-rust-server 'rust-analyzer
        gc-cons-threshold 100000000
        read-process-output-max (* 1024 1024)
        lsp-idle-delay 0.500
        )
)

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq
   lsp-ui-sideline-show-code-actions nil
   lsp-ui-doc-enable t
   )
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  )

;; (use-package helm-lsp
;;   :commands helm-lsp-workspace-symbol
;;   :config
;;   (define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
;;   )

(use-package company-lsp
  :commands company-lsp)

(use-package which-key
  :config (which-key-mode))



;; (eval-after-load "cargo" '(diminish 'cargo-minor-mode))
;; (add-hook 'rust-mode #'cargo-minor-mode)

;; (add-hook 'rust-mode-hook 'cargo-minor-mode)

