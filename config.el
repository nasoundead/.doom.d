;;; config.el -*- lexical-binding: t; -*-
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
 doom-big-font-increment 4

 doom-themes-treemacs-theme "all-the-icons"
 doom-localleader-key ","

 +format-on-save-enabled-modes '(dart-mode)

 evil-collection-setup-minibuffer t
 org-directory "~/google-drive/Notes"
 ;; doom-theme 'doom-rouge
 doom-theme 'doom-material-dark
 doom-font (font-spec :family "JetBrains Mono" :size 16)
;;  doom-variable-pitch-font (font-spec :family "Fira Sans")
;;  doom-unicode-font (font-spec :family "DejaVu Sans Mono")
;; doom-big-font (font-spec :family "Fira Mono" :size 19)
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

;; hl-line-mode overrides the color highlighting of rainbow-mode, 
;; limiting the use of that plugin and on-site color changes using kurecolor. 
;; To automatically disable it only when rainbow-mode is active, you can add the following hook:
(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))

;; tabnine
(setq +lsp-company-backend '(company-lsp :with company-tabnine :separate))
(after! company
  (setq company-idle-delay 0
        company-show-numbers t))

(use-package! symbol-overlay
  :diminish
  :custom-face
  (symbol-overlay-default-face ((t (:inherit 'underline))))
  (symbol-overlay-face-1 ((t (:inherit 'highlight))))
  (symbol-overlay-face-2 ((t (:inherit 'font-lock-builtin-face :inverse-video t))))
  (symbol-overlay-face-3 ((t (:inherit 'warning :inverse-video t))))
  (symbol-overlay-face-4 ((t (:inherit 'font-lock-constant-face :inverse-video t))))
  (symbol-overlay-face-5 ((t (:inherit 'error :inverse-video t))))
  (symbol-overlay-face-6 ((t (:inherit 'dired-mark :inverse-video t :bold nil))))
  (symbol-overlay-face-7 ((t (:inherit 'success :inverse-video t))))
  (symbol-overlay-face-8 ((t (:inherit 'dired-symlink :inverse-video t :bold nil))))
  :bind (([C-f3] . symbol-overlay-put)
         ([f3] . symbol-overlay-jump-next)
         ([S-f3] . symbol-overlay-jump-prev)
         ([M-f3] . symbol-overlay-remove-all))
  :hook ((prog-mode . symbol-overlay-mode)
         (iedit-mode . (lambda () (symbol-overlay-mode -1)))
         (iedit-mode-end . symbol-overlay-mode))
  :init (setq symbol-overlay-idle-time 0.01))

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
;;
;; we want dired not not make always a new buffer if visiting a directory
;; but using only one dired buffer for all directories.
(defadvice dired-advertised-find-file (around dired-subst-directory activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
        (filename (dired-get-filename)))
    ad-do-it
    (when (and (file-directory-p filename)
               (not (eq (current-buffer) orig)))
      (kill-buffer orig))))
(eval-after-load "dired"
  ;; don't remove `other-window', the caller expects it to be there
  '(defun dired-up-directory (&optional other-window)
     "Run Dired on parent directory of current directory."
     (interactive "P")
     (let* ((dir (dired-current-directory))
     	    (orig (current-buffer))
     	    (up (file-name-directory (directory-file-name dir))))
       (or (dired-goto-file (directory-file-name dir))
     	   ;; Only try dired-goto-subdir if buffer has more than one dir.
     	   (and (cdr dired-subdir-alist)
     		(dired-goto-subdir up))
     	   (progn
     	     (kill-buffer orig)
     	     (dired up)
     	     (dired-goto-file dir))))))

(load! "+bindings")
(load! "+functions")
