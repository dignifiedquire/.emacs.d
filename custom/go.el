;; From http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/

(use-package go-mode
  :ensure t
  :init
  :config
  ;; (use-package go-errcheck
  ;;   :ensure t
  ;;   )
  (setenv "GO111MODULE" "on")
  (setenv "GOROOT" (shell-command-to-string ". /etc/zshrc; echo -n $GOROOT"))
  (setenv "GOPATH" (shell-command-to-string ". /etc/zshrc; echo -n $GOPATH")))

  (defun my-go-mode-hook ()
    ;; golang.org/x/tools/cmd/goimports
    (setq gofmt-command "goimports")
    ;; call gofmt before saving
    (add-hook 'before-save-hook 'gofmt-before-save)
    (add-to-list 'exec-path "~/.go/bin")
    ;; Customize compile command to run go build
    ;(if (not (string-match "go" compile-command))
    ;    (set (make-local-variable 'compile-command)
    ;         "go build -v && go vet"))
    ;; This proved to be too slow in big projects:
    ;; && go test -short -coverprofile cover.out && go tool cover -func cover.out

    ;(local-set-key (kbd "C-c C-c") 'compile)
    ;(local-set-key (kbd "C-c C-g") 'go-goto-imports)
    (local-set-key (kbd "C-c C-k") 'godoc)
    ;; github.com/kisielk/errcheck
    ;(local-set-key (kbd "C-c C-e") 'go-errcheck)
    ;(local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
    ;; Godef jump key binding
    ;; code.google.com/p/rog-go/exp/cmd/godef
    ;(local-set-key (kbd "M-\"") 'godef-jump)
    ;; use company-go in go-mode
    ;(set (make-local-variable 'company-backends) '(company-go))
    ;(company-mode)


  ;; Ensure all linting passes, then use 'go build' to compile, then test/vet
  ;; (defun setup-go-mode-compile ()
  ;;   (if (not (string-match "go" compile-command))
  ;;       (set (make-local-variable 'compile-command)
  ;;            "gometalinter.v1 --deadline 10s && go build -v && go test -v && go vet")))

    ;; set helm-dash documentation
  (defun go-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Go")))

  (add-hook 'go-mode-hook 'company-mode)
  ;(add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'go-mode-hook 'highlight-word-hook)
  ; (add-to-list 'load-path (concat (getenv "GOPATH")
  ;                                 "/src/github.com/golang/lint/misc/emacs"))
  ;(require 'golint)
  ;(add-hook 'go-mode-hook 'my-go-mode-hook)
  (add-hook 'go-mode-hook 'go-doc)
  ;(add-hook 'go-mode-hook 'setup-go-mode-compile)

  ;(require 'go-guru)
  ;(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
  )

;; (eval-after-load 'go-mode
;;   '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

;; ;; Completion integration
;; (use-package company-go
;;   :ensure t
;;   :after go
;;   :config
;;   (setq tab-width 4)

;;   :bind (:map go-mode-map
;;               ("M-." . godef-jump)))

;; ;; ElDoc integration
;; (use-package go-eldoc
;;   :ensure t
;;   :config
;;   (add-hook 'go-mode-hook 'go-eldoc-setup))

;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (replace-regexp-in-string
;;                           "[ \t\n]*$"
;;                           ""
;;                           (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq eshell-path-env path-from-shell) ; for eshell users
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))


;; (setq exec-path (cons "/usr/local/go/bin" exec-path))
;; (setenv "PATH" (concat "/usr/local/go/bin:" (getenv "PATH")))
;; (add-to-list 'exec-path "/Users/dignifiedquire/.go/bin")

;; (defun my-go-mode-hook ()
;;   (setq tab-width 2 indent-tabs-mode 1)
;;   ; eldoc shows the signature of the function at point in the status bar.
;;   (go-eldoc-setup)
;;   (local-set-key (kbd "M-.") #'godef-jump)
;;   ; Call Gofmt before saving
;;   (add-hook 'before-save-hook 'gofmt-before-save)

;;   ; extra keybindings from https://github.com/bbatsov/prelude/blob/master/modules/prelude-go.el
;;   (let ((map go-mode-map))
;;     (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
;;     (define-key map (kbd "C-c m") 'go-test-current-file)
;;     (define-key map (kbd "C-c .") 'go-test-current-test)
;;     (define-key map (kbd "C-c b") 'go-run)))
;; (add-hook 'go-mode-hook 'my-go-mode-hook)

;; ; gotest defines a better set of error regexps for go tests, but it only
;; ; enables them when using its own functions. Add them globally for use in
;; (use-package compile)
;; (use-package gotest)

;; ;; (dolist (elt go-test-compilation-error-regexp-alist-alist)
;; ;;   (add-to-list 'compilation-error-regexp-alist-alist elt))
;; ;; (defun prepend-go-compilation-regexps ()
;; ;;   (dolist (elt (reverse go-test-compilation-error-regexp-alist))
;; ;;     (add-to-list 'compilation-error-regexp-alist elt t)))
;; ;; (add-hook 'go-mode-hook 'prepend-go-compilation-regexps)
