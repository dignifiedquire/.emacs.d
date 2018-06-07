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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#080808" "#d70000" "#67b11d" "#875f00" "#268bd2" "#af00df" "#00ffff" "#b2b2b2"])
 '(coffee-tab-width 2)
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d9129a8d924c4254607b5ded46350d68cc00b6e38c39fc137c3cfb7506702c12" "2837fa235c6a750ad719d9aaca292e000ff0e74a0de898b31c1140a6a6b150cd" "3b502f3ed0b63931c526795969d2653b59d8323f9e18f68683bfea0ddf47f378" default)))
 '(fci-rule-color "#343d46")
 '(flycheck-javascript-flow-args nil)
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(hl-sexp-background-color "#efebe9")
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(json-reformat:indent-width 2)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#bf616a")
     (40 . "#DCA432")
     (60 . "#ebcb8b")
     (80 . "#B4EB89")
     (100 . "#89EBCA")
     (120 . "#89AAEB")
     (140 . "#C189EB")
     (160 . "#bf616a")
     (180 . "#DCA432")
     (200 . "#ebcb8b")
     (220 . "#B4EB89")
     (240 . "#89EBCA")
     (260 . "#89AAEB")
     (280 . "#C189EB")
     (300 . "#bf616a")
     (320 . "#DCA432")
     (340 . "#ebcb8b")
     (360 . "#B4EB89"))))
 '(vc-annotate-very-old-color nil))
