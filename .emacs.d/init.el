; Add path
(add-to-list 'load-path "~/.emacs.d/lisp")

; Qiita markdown
(require 'ox-qmd)
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defun cleanup-org-tables ()
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "-+-" nil t) (replace-match "-|-"))))
(add-hook 'markdown-mode-hook 'orgtbl-mode)
(add-hook 'markdown-mode-hook
          #'(lambda()
          (add-hook 'after-save-hook 'cleanup-org-tables  nil 'make-it-local)))


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Japanese input using Mozc
;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)

;; Change IME ON/OFF key
(bind-key* "C-i"
    (lambda()
        (interactive)
	(if current-input-method (inactivate-input-method))
	    (toggle-input-method)))
(bind-key* (kbd "C-u")
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

;; Package.el

(require 'package)

;; MELPA
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; MELPA-stable
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; Marmalade
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Org
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)


; Set UTF-8 to default
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)



