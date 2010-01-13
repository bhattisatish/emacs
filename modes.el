;; C
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "k&r")
             (setq c-basic-offset 8)
             (setq tab-width 8)
             (setq indent-tabs-mode t)
             (add-hook 'before-save-hook 'tabify-buffer)))

;; CSS
(autoload 'css-mode "css-mode" "Mode for editing CSS file" t)
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

(add-hook 'css-mode-hook
          '(lambda ()
             (setq css-indent-offset 2)
             (add-hook 'before-save-hook 'untabify-buffer)))

;; Diff
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(setq-default fill-column 72)
(add-hook 'diff-mode-hook 'turn-on-auto-fill)

(add-hook 'diff-mode-hook '(lambda () (flyspell-mode 1)))

;; HAML
(require 'haml-mode)

;; SASS
(require 'sass-mode)

;; HTML
(add-hook 'html-mode-hook
          '(lambda()
             (setq tab-width 2)
             (add-hook 'before-save-hook 'untabify-buffer)))

;; js2
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
          '(lambda ()
             (require 'espresso)
             (setq espresso-indent-level 4)
             (set (make-local-variable 'indent-line-function)
                  'espresso-indent-line)
             (define-key js2-mode-map (kbd "RET") 'newline-and-indent)
             (add-hook 'before-save-hook 'delete-trailing-whitespace)
             (setq js2-use-font-lock-faces t)))

;; Ruby
(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; Markdown
(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command "markdown | smartypants"))
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; Ignore Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

(font-lock-add-keywords
 'ruby-mode
 '(("\\<\\(attr_accessor\\|attr_reader\\|attr_writer\\|extend\\|include\\|require\\)\\>" 1 font-lock-keyword-face)))

;; shell
(eval-after-load 'shell
  '(progn
     (define-key shell-mode-map [up] 'comint-previous-input)
     (define-key shell-mode-map [down] 'comint-next-input)
     (define-key shell-mode-map "\C-p" 'comint-previous-input)
     (define-key shell-mode-map "\C-n" 'comint-next-input)))

;; text
(add-hook 'text-mode-hook '(lambda () (flyspell-mode 1)))

(provide 'modes)
