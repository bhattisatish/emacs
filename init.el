;; load paths
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(require 'cl)
(require 'elpa)
(require 'global)
(require 'defuns)
(require 'bindings)
(require 'buffers)
(require 'modes)
(require 'theme)
(require 'magit)

(regen-autoloads)
(load custom-file 'noerror)

;; system specific config
(setq system-specific-config
      (concat dotfiles-dir (car (split-string system-name "\\.")) ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

(provide 'init)
