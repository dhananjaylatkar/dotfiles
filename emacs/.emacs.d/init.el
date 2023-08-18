;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; UI options
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq visible-bell t)
(add-hook 'text-mode-hook 'visual-line-mode)

;; Line numbers
(column-number-mode)
(global-display-line-numbers-mode t)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
	        treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Disable tmp files
(setq create-lockfiles nil)
(setq auto-save-default nil)
(setq make-backup-files nil)

;;;;;;;;;;;;;;;;;;;;;;;; Packages ;;;;;;;;;;;;;;;;;;;;;;;; 

;; diminish (keep mode-line clean)
(use-package diminish)

;; which-key
(use-package which-key
  :diminish
  :init
  (setq which-key-idle-delay 0.1)
  (which-key-mode))

(use-package general
  :config
  (general-create-definer djay/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Make ESC quit prompts

;; undo-tree
(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode))

;; evil
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-undo-system 'undo-tree)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; org-mode
(defun djay/org-mode-setup ()
  (org-indent-mode)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . djay/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-log-done t)
  (setq org-agenda-files (list "~/code/org/tasks.org")))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(djay/leader-keys
  "o"  '(:which-key "org")
  "ol" '(org-store-link :which-key "store link")
  "oa" '(org-agenda :which-key "agenda")
  "oo" '((lambda () (interactive) (find-file "~/code/org/tasks.org")) :which-key "open"))

;; counsel
(use-package counsel
  :diminish
  :bind 
  (("M-x" . counsel-M-x)
   ("C-x b" . counsel-ibuffer)
   ("C-x C-f" . counsel-find-file))
  :config
  (counsel-mode 1))

(djay/leader-keys
  "f"  '(:which-key "find")
  "fb" '(counsel-ibuffer :which-key "buffers")
  "ff" '(counsel-find-file :which-key "files"))

;; ivy (completion framework)
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
