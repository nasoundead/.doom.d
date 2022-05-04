;; -*- no-byte-compile: t; -*-
;;; packages.el

(package! tiny)
;; (package! clojure-mode)
(package! scss-mode)
(package! treemacs-all-the-icons)
(package! paredit)
(package! posframe)
(package! yaml-mode)
(package! company-quickhelp)
(package! symbol-overlay)
(when (featurep! :completion company)
  (package! company-tabnine))

;; (unpin! hover)
;; (unpin! treemacs)
;; (unpin! lsp-trseemacs)
;; (unpin! lsp-mode)
;; (unpin! lsp-ui)
;; (unpin! lsp-dart)

;; Temporary
(package! map :pin "bb50dba")
(unpin! iedit)
(unpin! evil-multiedit)
(unpin! evil)
