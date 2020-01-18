;;; init.el -*- lexical-binding: t; -*-
;; Copy me to ~/.doom.d/init.el or ~/.config/doom/init.el, then edit me!

(doom! 
       :completion
       (company          ; the ultimate code completion backend
        +auto
        +childframe)
       (ivy
        +fuzzy
        ;; +childframe
        +icons)

       :ui
       deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       modeline     ; a snazzy Atom-inspired mode-line
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       nav-flash         ; blink the current line after jumping
	     hl-todo
	     hydra
	     indent-guides
       treemacs
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       unicode           ; extended unicode support for various languages
       pretty-code
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
        (evil +everywhere); come to the dark side, we have cookies
        file-templates    ; auto-snippets for empty files
        snippets          ; my elves. They type so I don't have to
        (format +onsave)  ; automated prettiness
        multiple-cursors  ; editing in many places at once
        rotate-text       ; cycle region at point between text candidates
        fold
        word-wrap

       :emacs
       (dired +icons)             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       vc
       ibuffer

       :tools
       make              ; run make tasks from Emacs
       magit             ; a git porcelain for Emacs
       pdf               ; pdf enhancements
       rgb               ; creating color strings
       flycheck
       (lookup           ; helps you navigate your code and documentation
         +docsets)        ; ...or in Dash docsets locally
       lsp
       ein
       eval

       :term
       eshell

       :lang
	    ;;  cc
       (java +lsp)
       emacs-lisp        ; drown in parentheses
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       markdown          ; writing docs for people to ignore
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
		+dragndrop
		+ipython
        +present)        ; Emacs for presentations
       plantuml          ; diagrams for confusing people more
       (python +lsp +pyvenv)   ; beautiful is better than ugly
       rest              ; Emacs as a REST client
       web        ; the tubes

       :config
       (default +bindings +smartparens))
