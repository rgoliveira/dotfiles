;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto install packages on initialization.
;; Code stolen from http://stackoverflow.com/a/10093312

; list the packages you want
(setq package-list '(helm
     evil
     evil-org
     evil-leader
     powerline))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(require 'helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)

(require 'evil)
(require 'evil-org)
(require 'evil-leader)

(global-evil-leader-mode)
(evil-mode t)

(require 'powerline)
(powerline-default-theme)

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized-master")
(set-frame-parameter nil 'background-mode 'light)
(load-theme 'solarized t)
