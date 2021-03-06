;; This gives you a tab of 2 spaces
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("4ff23437b3166eeb7ca9fa026b2b030bba7c0dfdc1ff94df14dfb1bcaee56c78" "1fa76c8d9baaeb5dc498d2a4baaf71be6d3a8b6412af994d691fbe7a7b167321" default)))
 '(js2-basic-offset 2)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(json-reformat:indent-width 2))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

;; https://github.com/magnars/js2-refactor.el
(js2r-add-keybindings-with-prefix "C-c C-m")
;; eg. extract function with `C-c C-m ef`.

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

;; Tern
; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
; (add-hook 'web-mode-hook (lambda () (tern-mode t)))

;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))

;; (add-hook 'web-mode-hook (lambda () (tern-mode t)))
;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))

;; ;; fixup for tern
;; (defun delete-tern-process ()
;;   (interactive)
;;   (delete-process "Tern"))

;; Linting
(add-hook 'js2-mode-hook
          (lambda () (flycheck-mode t)))

(add-hook 'web-mode-hook
          (lambda () (flycheck-mode t)))

;; Use eslint instead of jshint
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers '(javascript-jshint))


(require 'flycheck-flow)
(add-to-list 'flycheck-checkers 'javascript-flow)
(flycheck-add-next-checker 'javascript-flow 'javascript-flow-coverage)
(flycheck-add-next-checker 'javascript-flow-coverage 'javascript-eslint)

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)


;; Let flycheck handle parse errors
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-missing-semi-warning nil)

;; jshint does not warn about this now for some reason
(setq-default js2-strict-trailing-comma-warning t)

;; ;; (add-hook 'js2-mode-hook #'setup-tide-mode)

;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'web-mode-hook #'(lambda ()
;;                              (enable-minor-mode
;;                               '("\\.jsx?\\'" . prettier-js-mode))))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
