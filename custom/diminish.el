(require 'diminish)

(diminish 'abbrev-mode "Abv")
(diminish 'helm-mode "h")
(diminish 'yas-minor-mode "y")
(diminish 'projectile-mode "P")
(with-eval-after-load 'flycheck
  '(progn
     (diminish 'flycheck-mode "f")))
(with-eval-after-load 'tern
  '(progn
     (diminish 'tern-mode "t")))

(with-eval-after-load 'company
  '(progn
     (diminish 'company-mode "c")))
