(setq user-full-name "James Liu"
      user-mail-address "james@jamesliu.io")

(setq-default line-spacing 3)
(setq doom-font (font-spec :family "Hack Nerd Font" :size 15))
(setq doom-themes-treemacs-enable-variable-pitch nil) ;; use doom-font for treemacs

(setq doom-theme 'modus-vivendi)
(setq doom-themes-treemacs-theme "doom-atom")

(setq display-line-numbers-type t)

(setq-default word-wrap t)
(global-visual-line-mode t) ;; navigate lines visually, not logically

(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq projectile-project-search-path '("~/projects/"))

;; Auth keys.
(setq auth-sources '("~/.authinfo"))

(with-eval-after-load 'magit
  (require 'forge)
  (require 'github-review)

  (setq github-review-fetch-top-level-and-review-comments t))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;; parinfer-rust-mode doesn't automatically install correctly on Apple M1.
;; To address this issue, the library was compiled separately and copied
;; to ~/.emacs.d/parinfer-rust/libparinfer_rust.so (notice the extension
;; was renamed).
(setq parinfer-rust-library "~/.emacs.d/parinfer-rust/libparinfer_rust.so")

(setq lsp-rust-server 'rust-analyzer)
(setq rustic-lsp-server 'rust-analyzer)

(setq org-directory "~/Dropbox/zettel/")
(setq org-agenda-files (directory-files-recursively "~/Dropbox/zettel/" "\.org$"))
(setq org-default-notes-file "~/Dropbox/zettel/inbox.org")

;; Provides <s shortcut to insert source blocks.
(require 'org-tempo)

(setq org-src-tab-acts-natively t
      org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)

;; Go-specific config
(require 'ob-go)

;; Clojure-specific config
(setq org-babel-clojure-backend 'cider)
(require 'cider)

;; Register other languages for Org Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ruby . t)
   (python . t)
   (rust . t)
   (js . t)
   (shell . t)
   (go .t)
   (clojure .t)
   (C .t)))

;; Drag-and-drop images to an Org buffer.
(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

;; Display images inline.
(setq org-startup-with-inline-images t)
(setq org-image-actual-width (/ (display-pixel-width) 3))

(require 'org-projectile)
(setq org-projectile-projects-file
      "~/Dropbox/org/projects/inbox.org")
(push (org-projectile-project-todo-entry) org-capture-templates)
(setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))

(setq deft-directory org-directory)
;; Enable keybinds.
(zetteldeft-set-classic-keybindings)

(require 'atomic-chrome)
(atomic-chrome-start-server)
