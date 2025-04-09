;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Monaspace Neon Frozen" :size 20 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Baskervville" :size 26)
      )
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-ayu-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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
;;
;;

(load! "coven-text.el")


(setq fancy-splash-image (concat doom-private-dir "logo.svg"))
(add-hook 'text-mode-hook
          (lambda ()
            (mixed-pitch-mode 1)
            ;;(variable-pitch-mode 1)
            (setq doom-modeline-enable-word-count t)
            ))
(after! valign

  (setq valign-fancy-bar t)
  (add-hook 'org-mode-hook #'valign-mode)
  )

(defun col-strip (col-str)
  (butlast (split-string (mapconcat (lambda (x) (concat "#" x " "))
                                    (split-string col-str "-")
                                    "") " ")))
(setq org-ellipsis "  ")
(setq color-schemes (list
                     (col-strip "a21d1d-5497de-8e35b7-ffff5b-56cb7d-df5252-707efa") ; red blue purple study
                     (col-strip "2278bf-e15554-3bb273-507c6d-6e5775-598d91-7768ae") ; blue red green okay
                     (col-strip "c7b7ee-2a2b2e-a29190-de8c7d-dcedb9") ; custom
                     ))
(setq pick-color 1)
(setq color-theme (nth pick-color color-schemes))

(defun org-tracktable-write-format ()
  (interactive)
  (org-tracktable-write)
  (valign-table)
  )

(map! :after evil-org
      :localleader
      :map evil-org-mode-map
      :prefix "b"
      :desc "tracktable insert table" "I" #'org-tracktable-insert-table)

(map! :after evil-org
      :localleader
      :map evil-org-mode-map
      :prefix "v"
      :desc "valign table" "S" #'valign-table)

(map! :after evil-org
      :localleader
      :map evil-org-mode-map
      :prefix "b"
      :desc "tracktable status" "S" #'org-tracktable-status)

(map! :after evil-org
      :localleader
      :map evil-org-mode-map
      :prefix "b"
      :desc "tracktable write" "r" #'org-tracktable-write-format)
;;(after! org-tracktable
;;  )

(after! org-faces
  (set-face-attribute 'org-level-1 nil
                      :height 2.0
                      :foreground (nth 0 color-theme)
                      :slant 'normal
                      :weight 'bold)
  (set-face-attribute 'org-level-2 nil
                      :height 1.6
                      :slant 'normal
                      :foreground (nth 1 color-theme))
  (set-face-attribute 'org-level-3 nil
                      :height 1.4
                      :slant 'normal
                      :foreground (nth 2 color-theme))
  (set-face-attribute 'org-level-4 nil
                      :height 1.2
                      :slant 'normal
                      :foreground (nth 3 color-theme))
  (set-face-attribute 'org-level-5 nil
                      :slant 'normal
                      :foreground (nth 4 color-theme))
  (set-face-attribute 'org-level-6 nil
                      :slant 'normal
                      :foreground (nth 5 color-theme))
  )
(add-hook 'org-mode-hook 'global-org-modern-mode)

(after! org-modern
  ;;(add-hook 'org-mode-hook #'org-modern-mode)
  ;;(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
  ;;(with-eval-after-load 'org (global-org-modern-mode))
  (setq
   org-pretty-entities t
   org-insert-heading-respect-content t
   org-modern-star 'replace
   org-modern-replace-stars "✿◉❀❁"
   org-modern-hide-stars nil
   org-modern-table nil
   org-modern-list '((?+ . "▶") (?- . "–") (?* . "•"))
   )
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(setq org-return-follows-link  t)

(setq display-line-numbers-type 'relative)

(custom-set-faces
 '(font-lock-comment-face ((t (:family "Monaspace Radon Frozen"))))
 '(line-number ((t (:family "Monaspace Neon Frozen" :height 120 :foreground "#7f7f7f"))))
 '(line-number-current-line ((t (:family "Monaspace Neon Frozen" :height 120 :foreground "#2a2a2a"))))
 '(font-lock-string-face ((t (:family "Monaspace Argon Frozen" :italic t))))
 '(org-table ((t (:family "Monaspace Krypton Frozen"))))
 '(org-table-row ((t (:family "Monaspace Krypton Frozen"))))
 '(org-table-header ((t (:family "Monaspace Krypton Frozen"))))
 )

(+global-word-wrap-mode +1)

;;Install these later
;;https://github.com/danielsz/Palimpsest
