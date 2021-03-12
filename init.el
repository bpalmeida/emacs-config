;;; init.el --- My Emacs configuration

(let ((gc-cons-percentage .6)
      (gc-cons-threshold most-positive-fixnum))

  ;; Set repositories
  (require 'package)

  
  (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")
                ;           ("melpa-stable" . "https://stable.melpa.org/packages/")
                           ("org" . "http://orgmode.org/elpa/")))

  (setq-default
   load-prefer-newer t
   package-enable-at-startup nil)
  (package-initialize)

  ;; (setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
  ;; (when (file-exists-p custom-file)
  ;;   (load custom-file))

  ;; Install dependencies
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package t))
  (setq-default
   use-package-always-defer t
   use-package-always-ensure t)

  ;; Use latest Org
  (use-package org :ensure org-plus-contrib)

 
  
;; (setq-default indent-tabs-mode nil)
;; (setq org-display-inline-images t)
;; (setq org-redisplay-inline-images t)
;; (setq org-startup-with-inline-images "inlineimages")

;; (setq default-frame-alist
;;       (append (list '(width . 72) '(height . 40))))
;; (setq org-confirm-elisp-link-function nil)
      
  (setq byte-compile-warnings '(cl-functions))
  
  ;; Tangle configuration
  (org-babel-load-file (expand-file-name "emacs.org" user-emacs-directory))
  (garbage-collect))
;;; init.el ends here


(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
