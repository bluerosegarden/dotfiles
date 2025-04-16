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

;;homestuck brainrot

(defface dya-text '((t (:foreground "#88d6a4" :inherit text :weight extra-bold) )) "Dyadhi's Text" :group 'org-mode )
(defvar dya-text 'dya-text)


(defface fan-text '((t (:foreground "#078446" :inherit text :weight extra-bold) )) "Fanrhi's Text" :group 'org-mode )
(defvar fan-text 'fan-text)
(defun add-troll-keywords()
  "adds custom keywords for highlighting text in org-mode."
  (font-lock-add-keywords nil
                          '(("^da: .*$" . 'dya-text))
                          '(("::da:: .*$" . 'dya-text))
                          )
  (font-lock-add-keywords nil
                          '(("^fa: .*$" . 'fan-text))
                          '(("::fa:: .*$" . 'fan-text))
                          )
  )

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

(defun display-troll-quirks()
  (use-package! ov)
  ;;celestialGoetism - Dyadhi's screen name
  (ov-set (ov-regexp "^da:") 'display "CG:")
  (ov-set (ov-match"-:da:-") 'display "celestialGoetism")
  ;;gallantChampion - Fan's screen name
  (ov-set (ov-regexp "^fa:") 'display "GC:")
  (ov-set (ov-match "-:fa:-") 'display "gallantChampion")
  )
(add-hook 'org-mode-hook 'display-persona-names)
(add-hook 'org-mode-hook 'display-troll-quirks)
(add-hook 'org-mode-hook 'add-alter-keywords)
(add-hook 'org-mode-hook 'add-troll-keywords)
(add-hook 'after-save-hook 'display-persona-names)
(add-hook 'after-save-hook 'display-troll-quirks)
