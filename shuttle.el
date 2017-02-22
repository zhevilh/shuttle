(defun shuttle ()
  (interactive)
  
  (require 'neotree)
  (defun neo-global--select-mru-window (arg)
    "Overrides neotree's behavior when selecting a window to open content in."
    (winum-select-window-by-number 2))
  
  (winum-mode)
  (slime)
  (neotree))
