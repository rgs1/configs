(menu-bar-mode 0)

(setq user-full-name "Raul Gutierrez Segales")
(setq user-mail-address "rgs@itevenworks.net")
(setq large-file-warning-threshold nil)  ;; don't whine about large tag files
(setq inhibit-startup-message t)
(setq show-paren-mode t)
(setq-default transient-mark-mode t)
(setq-default column-number-mode t)
(setq-default desktop-save-mode t)
(setq compilation-scroll-output t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))  ;; plugins
(add-to-list 'auto-mode-alist '("\\.pp$" . ruby-mode))         ;; treat Puppet as Ruby

(which-function-mode t)
(eval-after-load "which-func" '(add-to-list 'which-func-modes 'java-mode))
(eval-after-load "which-func" '(add-to-list 'which-func-modes 'c-mode))

(require 'recentf)
(recentf-mode t)

;; nice window switching
(defun select-next-window () (interactive) (select-window (next-window)))
(defun select-previous-window () (interactive) (select-window (previous-window)))
(global-set-key (kbd "M-<right>") 'select-next-window)
(global-set-key (kbd "M-<left>")  'select-previous-window)

;; auto completion
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)
(setq-default ac-sources '(ac-source-abbrev ac-source-words-in-buffer))
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; Rust
(require 'rust-mode)
(add-to-list 'auto-mode-alist '("\\.rs$" . rust-mode))
(add-hook 'rust-mode-hook (lambda () (setq compile-command "cargo build")))

;; Python Hook
(add-hook 'python-mode-hook (lambda () (setq indent-tabs-mode nil tab-width 4)))

;; Java
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4
                                  tab-width 4
                                  indent-tabs-mode nil
                                  show-paren-mode t)))

;; C
(add-hook 'c-mode-hook (lambda () (c-set-style "user")))
