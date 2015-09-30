;; Load Dependencies
(require 'cask "/usr/local/Cellar/cask/0.7.2_1/cask.el")
(cask-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor")

(load-file "~/.emacs.d/custom/space.el")
(load-file "~/.emacs.d/custom/common.el")
(load-file "~/.emacs.d/custom/helm.el")
(load-file "~/.emacs.d/custom/projectile.el")
(load-file "~/.emacs.d/custom/company.el")
(load-file "~/.emacs.d/custom/ruby.el")
(load-file "~/.emacs.d/custom/web-mode.el")
(load-file "~/.emacs.d/custom/javascript.el")
(load-file "~/.emacs.d/custom/typescript.el")
(load-file "~/.emacs.d/custom/scala.el")
(load-file "~/.emacs.d/custom/tex.el")
(load-file "~/.emacs.d/custom/haskell.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-function-call ((t (:inherit default :foreground "magenta")))))
