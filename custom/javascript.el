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


;; Tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(add-hook 'web-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(add-hook 'web-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; fixup for tern
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

(require 'flycheck)
;; Linting
(add-hook 'js2-mode-hook
          (lambda () (flycheck-mode t)))

(add-hook 'web-mode-hook
          (lambda () (flycheck-mode t)))

;; Run grunt commands
(global-set-key (kbd "M-RET") 'grunt)
(setq grunt-cmd "grunt")

(defun grunt ()
  "Run grunt"
  (interactive)
  (shell-command grunt-cmd))


;; ES6

;; Use eslint instead of jshint
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers '(javascript-jshint))
;; enable flychecking for js-mode
(add-hook 'js-mode-hook (lambda () (flycheck-mode t)))
;; enable flychecking for js2-mode
(add-hook 'js2-mode-hook (lambda () (flycheck-mode t)))
;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)

;; Let flycheck handle parse errors
(setq-default js2-show-parse-errors nil)
(setq-default js2-strict-missing-semi-warning nil)

;; jshint does not warn about this now for some reason
(setq-default js2-strict-trailing-comma-warning t)
