(require 'package)
(package-initialize)
;; Add MELPA package archive
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; fetch the list of packages available
(package-refresh-contents)

;; font configuration
(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 100)

;; line and column numbers
(setq column-number-mode t)
(setq line-number-mode t)


;; unused lines
(setq indicate-empty-lines t)

;; setup window if running with x
(defun setup-x-window-frame ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (tool-bar-mode -1)
    (menu-bar-mode -1)
    (scroll-bar-mode -1)
    (toggle-scroll-bar nil)

    (if (> (x-display-pixel-width) 1280)
       (add-to-list 'default-frame-alist (cons 'width 190))
       (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist
     (cons 'height (/ (- (x-display-pixel-height) 50)
                 (frame-char-height)))))))

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
             (if (equal 'fullboth current-value)
                 (if (boundp 'old-fullscreen) old-fullscreen nil)
               (progn (setq old-fullscreen current-value)
                  'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)
;; Make new frames fullscreen by default. Note: this hook doesn't do
;; anything to the initial frame if it's in your .emacs, since that file is
;; read _after_ the initial frame is created.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)

;; initiate workspace
(defun init-workspace ()
  (global-linum-mode 1)
  (toggle-fullscreen)
  (delete-other-windows)
  (menu-bar-mode 0)
  (split-window-horizontally))


(setup-x-window-frame)
(init-workspace)

;; fill column
(setq fill-column 79)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'solarized-dark)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
