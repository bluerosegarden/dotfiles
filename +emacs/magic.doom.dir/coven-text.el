;;; coven-text.el -*- lexical-binding: t; -*-

;;[[Defining coven texts]]
(defface w-text '((t ( :foreground "#D1A0EA" :inherit text ) )) "Witch's Text" :group 'org-mode)
(defvar w-text 'w-text)

(defface c-text '((t (:foreground "#ec51cd" :inherit text ) )) "Celeste's Text" :group 'org-mode )
(defvar c-text 'c-text)

(defface m-text '((t (:foreground "#5459b6" :inherit text ) )) "Magician's Text" :group 'org-mode )
(defvar m-text 'm-text)

(defface n-text '((t (:foreground "#6a6273" :inherit text ) )) "Nyx's Text" :group 'org-mode )
(defvar n-text 'n-text)

(defface g-text '((t (:foreground "#76e37a" :inherit text ) )) "Gidget's Text" :group 'org-mode )
(defvar g-text 'g-text)


(defface g-text '((t (:foreground "#6a6273" :inherit text :weight extra-bold) )) "Gidgit's Text" :group 'org-mode )
(defvar g-text 'g-text)
  ;;; Add keywords
(defun add-alter-keywords()
  "adds custom keywords for highlighting text in org-mode."
  (font-lock-add-keywords nil
                          '(("^w: .*$" . 'w-text))
                          )
  (font-lock-add-keywords nil
                          '(("^m: .*$" . 'm-text))
                          )
  (font-lock-add-keywords nil
                          '(("^c: .*$" . 'c-text))
                          )
  (font-lock-add-keywords nil
                          '(("^n: .*$" . 'n-text))
                          )
  (font-lock-add-keywords nil
                          '(("^g: .*$" . 'g-text))
                          )
  )

(defun display-persona-names()
  (use-package! ov)
  (ov-set (ov-regexp "^m:") 'display "<magician>")
  (ov-set (ov-regexp "^w:") 'display "<witch>")
  (ov-set (ov-regexp "^c:") 'display "<celeste>")
  (ov-set (ov-regexp "^n:") 'display "<nyx>")
  (ov-set (ov-regexp "^g:") 'display "<gidget>")
  )
(add-hook 'org-mode-hook 'display-persona-names)
(add-hook 'org-mode-hook 'add-alter-keywords)
(add-hook 'after-save-hook 'display-persona-names)
