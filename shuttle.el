(defun shuttle ()
  (interactive)

  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
  (global-set-key (kbd "C-c M-l") 'slime-load-system)
  
  (require 'neotree)
  (defun neo-global--select-mru-window (arg)
    "Overrides neotree's behavior when selecting a window to open content in."
    (winum-select-window-by-number 2))
  
  (winum-mode)
  (slime)
  (neotree))
