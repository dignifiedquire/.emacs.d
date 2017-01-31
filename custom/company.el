(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
; (add-to-list 'company-backends 'company-tern)
(setq company-tooltip-align-annotations t)
(setq company-minimum-prefix-length 2)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)

(add-to-list 'company-backends 'company-flow)
(add-to-list 'company-backends 'company-robe)
; (add-to-list 'company-backends 'company-racer)
