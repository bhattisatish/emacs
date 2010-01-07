(require 'package)
(package-initialize)

(defvar packages (list
		  'full-ack
		  'inf-ruby
		  'js2-mode
		  'magit
		  'nav
		  'nxml-mode
		  'rinari
		  'ruby-mode)
  "Libraries that should be installed by default.")

(defun elpa-install ()
  "Install all starter-kit packages that aren't installed."
  (interactive)
  (package-refresh-contents)
  (dolist (package packages)
    (unless (or (member package package-activated-list)
		(functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

(provide 'elpa)
