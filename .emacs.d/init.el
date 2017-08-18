(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(require 'cc-mode)
(require 'cl-lib)

;;Emacs General Config
(setq delete-old-versions t
      kept-new-versions 3
      kept-old-versions 2
      version-control t)
(setq tab-always-indent 'complete)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq global-linum-mode 1)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode nil)
(setq split-width-threshold 9999)

(global-linum-mode 1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(add-to-list 'completion-styles 'initials t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;;Setup auto downloading for packages
(defvar my-packages
  '(ack-and-a-half powerline ggtags function-args sr-speedbar company magit)
  "List of packages to install.")

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
	   when (not (package-installed-p p)) do (cl-return nil)
	   finally (cl-return )))

(unless (my-packages-installed-p)
  ;;Check for new packages
  (package-refresh-contents)
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))


;;GGTags Configuration
(require 'ggtags)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
	      (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;;Company Mode Configuration
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)

;;Speedbar configuration
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-max-width 40)
(setq sr-speedbar-buffer-name "Dir Browser")

;;Emacs Powerline
(add-to-list 'load-path "~/.emacs.d/emacs-powerline")
(require 'powerline)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (feature-mode powerline sr-speedbar gtags ggtags function-args company ack-and-a-half))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(if (not (file-exists-p "~/.saves"))
    (make-directory "~/.saves" t))
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
