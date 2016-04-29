; Add path
(add-to-list 'load-path "~/.emacs.d")

; Qiita markdown
(require 'ox-qmd)


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Japanese input using Mozc
;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)

;; Change C-j -> C-]
(global-set-key (kbd "C-j")
    (lambda()
        (interactive)
	(if current-input-method (inactivate-input-method))
	    (toggle-input-method)))
(global-set-key (kbd "M-j")
    (lambda()
        (interactive)
	(inactivate-input-method)))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; File
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Do not create backup file
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Do not show welcome message
(setq inhibit-startup-message t)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Edit
;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq kill-whole-line t)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key settings
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Change C-h -> BackSpace
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
(global-set-key "\C-ch" 'help-command)


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; View settings
;;;;;;;;;;;;;;;;;;;;;;;;;;
(line-number-mode 1)

;; Hilight () 
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "grey")
(set-face-foreground 'show-paren-match-face "black")


