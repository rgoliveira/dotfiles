(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
  (package-initialize)

(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")

(require 'evil)
(require 'evil-org)
(require 'evil-leader)

(global-evil-leader-mode)
(evil-mode t)

