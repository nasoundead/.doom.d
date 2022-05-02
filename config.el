;;; config.el -*- lexical-binding: t; -*-

;;
;; Plugins
;;



;;
;; Config
;;

;; Emacs 29 bug
(general-auto-unbind-keys :off)
(remove-hook 'doom-after-init-modules-hook #'general-auto-unbind-keys)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'auto-mode-alist '("\\.repl\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.ect\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.xtend\\'" . java-mode))
(add-hook 'html-mode-hook #'turn-off-auto-fill)
(add-hook 'markdown-mode-hook #'turn-off-auto-fill)

(setq-default evil-kill-on-visual-paste nil)

(setq
 history-length 300
 confirm-kill-emacs nil
 mode-line-default-help-echo nil
 show-help-function nil
 evil-multiedit-smart-match-boundaries nil
 compilation-scroll-output 'first-error

 read-process-output-max (* 1024 1024)

 ;; projectile-project-search-path '("~/dev/")
 projectile-enable-caching nil

 evil-split-window-below t
 evil-vsplit-window-right t

 doom-unicode-font (font-spec :size 18)
 doom-big-font-increment 2

 doom-themes-treemacs-theme "all-the-icons"
 doom-localleader-key ","

 +format-on-save-enabled-modes '(dart-mode)

 evil-collection-setup-minibuffer t
 org-directory "~/google-drive/Notes"
 doom-theme 'doom-moonlight
 doom-font (font-spec :family "JetBrains Mono" :size 16)
;;  doom-variable-pitch-font (font-spec :family "Fira Sans")
;;  doom-unicode-font (font-spec :family "DejaVu Sans Mono")
;;  doom-big-font (font-spec :family "Fira Mono" :size 19)
 )

;; (custom-set-faces
;;   '(org-table ((t (:family "Ubuntu Mono"))))
;;   )


;; (add-hook 'org-mode-hook (lambda ()
;;   "Beautify Org Checkbox Symbol"
;;   (push '("[ ]" . "?") prettify-symbols-alist)
;;   (push '("[X]" . "?" ) prettify-symbols-alist)
;;   (push '("[-]" . "?" ) prettify-symbols-alist)
;;   (prettify-symbols-mode)
;;   (after! ob-java
;;     (setq org-babel-java-compiler "javac -encoding utf-8"))
;;   (org-bullets-mode)))

;; (defface org-checkbox-done-text
;;   '((t (:foreground "#71696A" :strike-through t)))
;;   "Face for the text part of a checked org-mode checkbox.")

;; (font-lock-add-keywords
;;  'org-mode
;;  `(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
;;     1 'org-checkbox-done-text prepend))
;;  'append)

 ;; (setq system-time-locale "C")
;; =================================================================================================================================
;; (use-package! lsp-mode
;;   :commands lsp
;;   :config

;;   ;; Core
;;   (setq lsp-headerline-breadcrumb-enable nil
;;         lsp-signature-render-documentation nil
;;         lsp-signature-function 'lsp-signature-posframe
;;         lsp-semantic-tokens-enable t
;;         lsp-idle-delay 0.3
;;         lsp-use-plists nil)
;;   (add-hook 'lsp-after-apply-edits-hook (lambda (&rest _) (save-buffer)))
;;   (add-hook 'lsp-mode-hook (lambda () (setq-local company-format-margin-function #'company-vscode-dark-icons-margin)))

;;   ;; Rust
;;   (setq lsp-rust-analyzer-server-display-inlay-hints t
;;         lsp-rust-analyzer-display-parameter-hints t
;;         lsp-rust-analyzer-display-chaining-hints t))

;; (use-package! lsp-treemacs
;;   :config
;;   (setq lsp-treemacs-error-list-current-project-only t))

;; (use-package! lsp-ui
;;   :after lsp-mode
;;   :commands lsp-ui-mode
;;   :config
;;   (setq lsp-ui-doc-enable nil
;;         lsp-ui-peek-enable nil))

;; (use-package! rustic
;;   :hook ((rustic-mode . rustic-setup-lsp))
;;   :init
;;   (setq rustic-lsp-client
;;           (if (featurep! :tools lsp +eglot)
;;               'eglot
;;             'lsp-mode)))

(use-package! org-tree-slide
  :after org-mode
  :config
  (setq +org-present-text-scale 2
        org-tree-slide-skip-outline-level 2
        org-tree-slide-modeline-display 'outside
        org-tree-slide-fold-subtrees-skipped nil)
  (add-hook! 'org-tree-slide-play-hook
             #'org-display-inline-images
             #'doom-disable-line-numbers-h
             #'spell-fu-mode-disable
             #'hl-line-unload-function
             #'org-mode-hide-all-stars)
  (add-hook! 'org-tree-slide-stop-hook
             #'spell-fu-mode-enable
             #'hl-line-mode)
  )

(use-package! paredit
  :hook ((clojure-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode)))

(use-package! treemacs-all-the-icons
  :after treemacs)

;; (after! projectile
;;   (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
;;   (add-to-list 'projectile-project-root-files-bottom-up "BUILD")
;;   (add-to-list 'projectile-project-root-files-bottom-up "project.clj"))


;; (put 'narrow-to-region 'disabled nil)


(load! "+bindings")
(load! "+functions")
