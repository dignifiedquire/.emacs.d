(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
; (add-to-list 'company-backends 'company-tern)
(setq company-tooltip-align-annotations t)
(setq company-minimum-prefix-length 2)


;(add-to-list 'company-backends 'company-flow)
(add-to-list 'company-backends 'company-robe)
; (add-to-list 'company-backends 'company-racer)
