;; Load Dependencies

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor")

(load-file "~/.emacs.d/custom/space.el")
(load-file "~/.emacs.d/custom/common.el")
(load-file "~/.emacs.d/custom/helm.el")
(load-file "~/.emacs.d/custom/projectile.el")
(load-file "~/.emacs.d/custom/rust.el")
(load-file "~/.emacs.d/custom/company.el")
(load-file "~/.emacs.d/custom/ruby.el")
(load-file "~/.emacs.d/custom/web-mode.el")
(load-file "~/.emacs.d/custom/typescript.el")
(load-file "~/.emacs.d/custom/javascript.el")
(load-file "~/.emacs.d/custom/scala.el")
(load-file "~/.emacs.d/custom/tex.el")
(load-file "~/.emacs.d/custom/haskell.el")
(load-file "~/.emacs.d/custom/diminish.el")
(load-file "~/.emacs.d/custom/go.el")
(load-file "~/.emacs.d/custom/org.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t :slant italic))))
 '(font-lock-constant-face ((t (:weight normal))))
 '(js2-function-call ((t (:inherit default :foreground "magenta"))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d9129a8d924c4254607b5ded46350d68cc00b6e38c39fc137c3cfb7506702c12" "2837fa235c6a750ad719d9aaca292e000ff0e74a0de898b31c1140a6a6b150cd" "3b502f3ed0b63931c526795969d2653b59d8323f9e18f68683bfea0ddf47f378" default)))
 '(flycheck-javascript-flow-args nil)
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(json-reformat:indent-width 2))
