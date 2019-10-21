; "projectile" recognizes git repos (etc) as "projects" and changes settings
; as you switch between them.
(require 'projectile)

(projectile-global-mode +1)

(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'helm-projectile)

(require 'go-projectile)
(go-projectile-tools-add-path)
(setq gofmt-command (concat "/Users/dignifiedquire/.go/bin/goimports"))

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
