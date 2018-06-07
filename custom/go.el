;; From http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))


(setenv "GOPATH" "/Users/dignifiedquire/.go")

(setq exec-path (cons "/usr/local/go/bin" exec-path))
(setenv "PATH" (concat "/usr/local/go/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/Users/dignifiedquire/.go/bin")

(defun my-go-mode-hook ()
  (setq tab-width 2 indent-tabs-mode 1)
  ; eldoc shows the signature of the function at point in the status bar.
  (go-eldoc-setup)
  (local-set-key (kbd "M-.") #'godef-jump)
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  ; extra keybindings from https://github.com/bbatsov/prelude/blob/master/modules/prelude-go.el
  (let ((map go-mode-map))
    (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
    (define-key map (kbd "C-c m") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test)
    (define-key map (kbd "C-c b") 'go-run)))
(add-hook 'go-mode-hook 'my-go-mode-hook)

; gotest defines a better set of error regexps for go tests, but it only
; enables them when using its own functions. Add them globally for use in
(require 'compile)
(require 'gotest)
(dolist (elt go-test-compilation-error-regexp-alist-alist)
  (add-to-list 'compilation-error-regexp-alist-alist elt))
(defun prepend-go-compilation-regexps ()
  (dolist (elt (reverse go-test-compilation-error-regexp-alist))
    (add-to-list 'compilation-error-regexp-alist elt t)))
(add-hook 'go-mode-hook 'prepend-go-compilation-regexps)
