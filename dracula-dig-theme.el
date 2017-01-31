(deftheme dracula-dig
  "Created 2016-11-24.")

(custom-theme-set-variables
 'dracula-dig
 '(js2-basic-offset 2)
 '(flycheck-javascript-flow-args nil)
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(js-indent-level 2)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(json-reformat:indent-width 2)
 '(custom-safe-themes (quote ("2837fa235c6a750ad719d9aaca292e000ff0e74a0de898b31c1140a6a6b150cd" "02c4bb38fab313c17ed8283bbacf238db724a566add72c6fd2f2972e30585746" "5b4445b764cc6d5bc92823578347d02fd7c1221ade74d593d6a2aaa8d42c4483" "2ace269b5bb1253fc252a5580cbad1b2f440637f79d577c6a351d8719caf03d4" "eb0a314ac9f75a2bf6ed53563b5d28b563eeba938f8433f6d1db781a47da1366" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "01ce486c3a7c8b37cf13f8c95ca4bb3c11413228b35676025fdf239e77019ea1" "20e359ef1818a838aff271a72f0f689f5551a27704bf1c9469a5c2657b417e6c" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "4ff23437b3166eeb7ca9fa026b2b030bba7c0dfdc1ff94df14dfb1bcaee56c78" "1fa76c8d9baaeb5dc498d2a4baaf71be6d3a8b6412af994d691fbe7a7b167321" default))))

(custom-theme-set-faces
 'dracula-dig
 '(font-lock-comment-face ((t (:foreground "#008787" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#d75fd7" :weight normal))))
 '(js2-function-call ((t (:inherit default :foreground "magenta")))))

(provide-theme 'dracula-dig)
