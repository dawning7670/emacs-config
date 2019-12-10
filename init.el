(add-to-list 'default-frame-alist
                       '(font . "Cascadia Code-16"))
(setq url-proxy-services
   '(("http" . "127.0.0.1:9090")
     ("https" . "127.0.0.1:9090")))
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


;install package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

; then define packages you use
(use-package slime)
(use-package racket-mode)
(use-package smartparens :config (show-smartparens-mode t))
(use-package company)
(use-package idea-darkula-theme)
(use-package slime-company)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-all-caps t)
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (idea-darkula)))
 '(custom-safe-themes
   (quote
    ("947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" "420689cc31d01fe04b8e3adef87b8838ff52faa169e69ca4e863143ae9f3a9f9" default)))
 '(package-selected-packages
   (quote
    (company ## idea-darkula-theme dracula-theme smartparens use-package racket-mode slime macrostep))))
;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(setq racket-program "/Applications/Racket v7.4/bin/racket")
(require 'smartparens-config)
(setq tab-always-indent 'complete)
(add-hook 'after-init-hook 'global-company-mode)
(defun my-racket-mode-hook ()
	(set (make-local-variable 'company-backends)
	     '((company-capf company-dabbrev-code)))
(company-quickhelp-mode 0))
(add-hook 'racket-mode-hook 'my-racket-mode-hook)
(add-hook 'racket-mode-hook 'company-mode)
(add-hook 'racket-repl-mode-hook 'my-racket-mode-hook)
(add-hook 'racket-repl-mode-hook 'company-mode)
(require 'slime)
(slime-setup '(slime-fancy slime-company))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
