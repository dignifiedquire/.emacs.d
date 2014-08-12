;;; sweetjs-mode.el --- Minor mode to edit Sweet.js files in Emacs -*- lexical-binding: t; -*-

;; Copyright (C) 2014 Tim Disney

;; Version: 0.1.0
;; Keywords: Javascript minor mode
;; Author: Tim Disney <tim@disnet.me>
;; URL: http://github.com/disnet/sweetjs-mode
;; Package-Requires: ((emacs "24.1") (cl-lib "0.5"))

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; Minor mode for sweetjs files. Adds some syntax highlighting and
;; commands for compiling sweet.js files.
;;
;; Keybindings:
;;
;;    C-c s r  compile region
;;    C-c s c  compile buffer
;;

;;; Installation:

;; In your emacs config:

;;      (add-to-list 'load-path "/path/to/sweetjs-mode")
;;      (require 'sweetjs-mode)

;; If you want to turn in on for all JavaScript files:

;;      (add-hook 'js-mode 'sweetjs-mode)

;;; Code:

(defgroup sweetjs nil
  "A minor mode for sweet.js"
  :group 'languages)

(defcustom sweetjs-command "sjs"
  "The sweet.js binary used for compiling code. Must be in the path."
  :type 'string
  :group 'sweetjs)

(defcustom sweetjs-compile-buffer "*sweetjs-compile*"
  "The name of the scratch buffer."
  :type 'string
  :group 'sweetjs)

(defvar sweetjs-keywords-regexp (regexp-opt
                                 '("macro" "rule" "operator")
                                 'words))

(defvar sweetjs-font-lock-keywords
  `((,sweetjs-keywords-regexp . font-lock-keyword-face)))

(defun sweetjs-turn-on ()
  "Turn on sweetjs mode."
  (font-lock-add-keywords nil sweetjs-font-lock-keywords))

(defun sweetjs-turn-off ()
  "Turn off sweetjs mode."
  (font-lock-remove-keywords nil sweetjs-font-lock-keywords))

(defun sweetjs-compile-region (start end)
  "Compile the region."
  (interactive "r")
  (message "compiling")

  (let ((buffer (get-buffer sweetjs-compile-buffer)))
    (when buffer
      (kill-buffer buffer)))

  (apply (apply-partially 'call-process-region start end sweetjs-command nil
                          (get-buffer-create sweetjs-compile-buffer)
                          nil)
         (list "-s"))

  (with-current-buffer sweetjs-compile-buffer
    (javascript-mode))

  (display-buffer-other-frame sweetjs-compile-buffer))


(defvar sweetjs-mode-keymap (make-sparse-keymap))
(define-key sweetjs-mode-keymap (kbd "C-c s c") 'sweetjs-compile-buffer)
(define-key sweetjs-mode-keymap (kbd "C-c s r") 'sweetjs-compile-region)

(defun sweetjs-compile-buffer ()
  (interactive)
  (sweetjs-compile-region (point-min) (point-max)))

(define-minor-mode sweetjs-mode
  "Adds some sweetjs convenience functions to emacs"
  nil
  " Sjs"
  sweetjs-mode-keymap
  (if sweetjs-mode (sweetjs-turn-on) (sweetjs-turn-off)))


(provide 'sweetjs-mode)

;;; sweetjs-mode ends here
