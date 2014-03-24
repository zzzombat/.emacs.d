(require 'package)
;; Add ELPA package archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add MELPA package archive
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Add MARMALADE package archive
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;; Add GNU package archive
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))

(add-to-list 'package-archives
             '("sc" . "http://joseito.republika.pl/sunrise-commander/"))

(package-initialize)

;; font configuration
;; (set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 100)

;; set font for all windows
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10"))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(toggle-scroll-bar nil)


;; line and column numbers
(setq column-number-mode t)
(setq line-number-mode t)

;; initiate workspace
(defun init-workspace ()
  (global-linum-mode 1)
;;   (toggle-fullscreen)
  (delete-other-windows)
  (menu-bar-mode 0)
  (split-window-horizontally))

(init-workspace)

;; indent with spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;Whitespace mode
(require 'whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)
(setq whitespace-style
  '(face trailing tabs empty indentation space-after-tab space-before-tab))
(global-whitespace-mode)

;; miscelaneous tweaks
(set-default 'truncate-lines t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


(add-to-list 'load-path "/home/zombat/.emacs.d/emacs-for-python/")
(load-file "/home/zombat/.emacs.d/emacs-for-python/epy-init.el")

(require 'epy-setup)
(require 'epy-python)
(require 'epy-completion)
(require 'epy-editing)
(require 'epy-bindings)
(epy-setup-checker "pyflakes %f")

;; (global-hl-line-mode t) ;; To enable
;;(set-face-background 'hl-line "black")

(load-theme 'solarized-dark t)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist '(("django"    . "\\.html?\\'")))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'magit)

;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (setq-default flycheck-flake8-maximum-line-length 120)
;; (setq-default flycheck-flake8-maximum-complexity 10)
;; (setq-default flycheck-highlighting-mode 'lines)
