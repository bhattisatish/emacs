
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'color-theme)
(require 'color-theme-twilight)
(color-theme-twilight)

(setq mac-allow-anti-aliasing t)

(provide 'theme)
