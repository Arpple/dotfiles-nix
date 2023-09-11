;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "arpple"
      user-mail-address "apple0239@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-molokai
      display-line-numbers-type 'relative
      doom-font (font-spec :family "Source Code Pro for Powerline" :size 17 :weight 'bold)
      doom-modeline-indent-info t
      tab-width 2)

(custom-set-faces!
  '(hl-line :background "#353535")
  '(hl-fill-column-face :background "#ee7600"))
  

(setq-default tab-width 2
              indent-tabs-mode t
              fill-column 100)

(add-to-list 'default-frame-alist '(alpha . 98))

;; key
(map! :g "C-`" nil
      :g "M-q" #'evil-force-normal-state
      :n "M-h" #'centaur-tabs-backward
      :n "M-l" #'centaur-tabs-forward)

;; spacemacs style double space execute command
(map! :leader
      :desc "execute command"
      "SPC" #'execute-extended-command)

;; treemacs
(setq treemacs-width 30)

(defface custom-line-highlight '((t (:background "#353535" :extend t))) "")
(add-hook
 'treemacs-mode-hook
 (defun channge-hl-line-mode ()
   (setq-local hl-line-face 'custom-line-highlight)
   (overlay-put hl-line-overlay 'face hl-line-face)
   (treemacs--setup-icon-background-colors)))

(after! treemacs
  (treemacs-follow-mode))

;; centaur-tabs
(setq centaur-tabs-excluded-prefixes (list "*" "Treemacs Update"))


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.  ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elixir-atom-face ((t (:inherit font-lock-constant-face :foreground "#BD63C5"))))
 '(font-lock-comment-face ((t (:foreground "yellow" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#BD63C5"))))
 '(font-lock-function-name-face ((t (:foreground "#A6FF2E"))))
 '(font-lock-variable-name-face ((t (:foreground "#3BDAAF"))))
 '(hl-fill-column-face ((t (:background "#ee7600"))))
 '(hl-line ((t (:background "#353535"))))
 '(treemacs-git-ignored-face ((t (:foreground "gray45"))))
 '(treemacs-git-untracked-face ((t (:inherit (variable-pitch font-lock-doc-face) :foreground "chartreuse1")))))
