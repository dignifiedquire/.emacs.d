(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-robe)
(add-to-list 'company-backends 'company-racer)
