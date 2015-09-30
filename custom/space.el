(require 'diminish)
(require 'anzu)
(require 'org)
(require 'org-pomodoro)
(require 'spaceline-config)

(spaceline-emacs-theme)

(load-theme 'spacemacs-dark t)
(setq powerline-default-separator 'wave)
(setq spaceline-window-numbers-unicode t)


(diminish 'abbrev-mode "Abv")
(diminish 'helm-mode "h")
(diminish 'yas-minor-mode "y")
(diminish 'projectile-mode "P")
(diminish 'tern-mode "t")
(diminish 'flycheck-mode "f")
