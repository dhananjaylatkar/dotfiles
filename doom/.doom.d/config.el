;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq
  doom-theme 'doom-vibrant
  doom-font (font-spec :family "Iosevka SS09" :size 16 :weight 'regular)
  doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 16)
  display-line-numbers-type 'relative
  user-full-name "Dhananjay"
  projectile-project-search-path '("~/code/")
  projectile-switch-project-action #'projectile-dired
  projectile-enable-caching t
  org-ellipsis " ▾ "
  org-bullets-bullet-list '("·")
  default-directory "~"
  org-directory "~/org/"
  org-roam-directory "~/code/roam"
  org-log-done 'time
  mac-command-modifier 'super
  evil-vsplit-window-right t
  evil-split-window-below t
  +ivy-buffer-preview t ;; Buffer previews
  which-key-idle-delay 0.5
  which-key-allow-multiple-replacements t
  doom-modeline-height 5)

(setq-default
  major-mode 'org-mode) ;; new buffers in org-mode

;; Select buffers when spltiing windows
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-workspace-buffer))

;; Cscope
(cscope-setup)
(setq
 cscope-option-use-inverted-index t
 cscope-use-relative-paths nil
 cscope-index-recursively t
 cscope-option-b t
 cscope-option-k t)
;; Gtags
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;               (ggtags-mode 1))))

;; Open Doom in maximized window
(add-hook 'window-setup-hook #'toggle-frame-maximized)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
        (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Tree sitter
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Company
(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.
(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

;; Whichkey remove `evil-` from cmds
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   ))

;; mixed-pitch fonts
;; (use-package mixed-pitch
;;   :hook
;;   ;; If you want it in all text modes:
;;   (text-mode . mixed-pitch-mode))

(load! "splash-screen")
