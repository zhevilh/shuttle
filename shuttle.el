(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup)))

(use-package slime
  :bind (("C-c M-l" . slime-load-system)))
(use-package ac-slime)
(slime-setup '(slime-fancy slime-asdf))
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-mode-hook 'auto-complete-mode)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes' 'slime-repl-mode))

(add-hook 'lisp-mode-hook 'paredit-mode)
(font-lock-add-keywords 'lisp-mode
'(("(\\(\\(def\\|do-\\|with-\\|using-\\)\\(\\s_\\|\\w\\)*\\)"
   1 font-lock-keyword-face)))

(use-package neotree)

(defun neo-global--select-mru-window (arg)
  "Overrides neotree's behavior when selecting a window to open content in."
  (winum-select-window-by-number 2))

(use-package winum)
(use-package which-key)

(defun shuttle ()
  (interactive)

  (which-key-mode)
  (winum-mode)
  (slime)
  (neotree))
