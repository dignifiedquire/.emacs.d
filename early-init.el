(defvar default-gc-cons-threshold 16777216 ; 16mb
  "my default desired value of `gc-cons-threshold'
during normal emacs operations.")

;; make garbage collector less invasive
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)

;; Prevent the glimpse of un-styled Emacs by disabling these UI elements early.
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Startup speed, annoyance suppression
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

;; Silence stupid startup message
(setq inhibit-startup-echo-area-message (user-login-name))

;; Default frame configuration: full screen, good-looking title bar on macOS
(setq frame-resize-pixelwise t)
(setq default-frame-alist '((fullscreen . maximized)

                            ;; You can turn off scroll bars by uncommenting these lines:
                            ;; (vertical-scroll-bars . nil)
                            ;; (horizontal-scroll-bars . nil)

                            ;; Setting the face in here prevents flashes of
                            ;; color as the theme gets activated
                            (background-color . "#000000")
                            (ns-appearance . dark)
                            (ns-transparent-titlebar . t)))

(setq default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook
 'emacs-startup-hook
 (lambda (&rest _)
   (setq gc-cons-threshold default-gc-cons-threshold)
   (setq gc-cons-percentage 0.1)
   (setq file-name-handler-alist default-file-name-handler-alist)

   ;; delete no longer necessary startup variable
   (makunbound 'default-file-name-handler-alist)))
