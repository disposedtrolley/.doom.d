(setq user-full-name "James Liu"
      user-mail-address "james@jamesliu.io")

(setq doom-font (font-spec :family "Hack Nerd Font" :size 15))
(setq doom-theme 'modus-vivendi)
(setq display-line-numbers-type t)

(setq-default line-spacing 2)

(setq doom-themes-treemacs-enable-variable-pitch nil) ;; use doom-font for treemacs
(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
(doom-themes-treemacs-config)

(doom-themes-org-config)

(setq +pretty-code-enabled-modes nil)

(setq-default word-wrap t)
(global-visual-line-mode t)

;; Integrated titlebar on macOS
;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

(setq projectile-project-search-path '("~/projects/"))

(with-eval-after-load 'magit
  (require 'forge)
  (require 'github-review)

  (setq github-review-fetch-top-level-and-review-comments t))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(setq lsp-rust-server 'rust-analyzer)
(setq rustic-lsp-server 'rust-analyzer)

;; parinfer-rust-mode doesn't automatically install correctly on Apple M1.
;; To address this issue, the library was compiled separately and copied
;; to ~/.emacs.d/parinfer-rust/libparinfer_rust.so (notice the extension
;; was renamed).
(setq parinfer-rust-library "~/.emacs.d/parinfer-rust/libparinfer_rust.so")

(setq org-directory "~/Dropbox/zettel/")
(setq org-agenda-files (directory-files-recursively "~/Dropbox/zettel/" "\.org$"))

(setq org-default-notes-file "~/Dropbox/zettel/inbox.org")

(require 'org-tempo)

(setq org-src-tab-acts-natively t)

(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)
(require 'ob-go)

(setq org-babel-clojure-backend 'cider)
(require 'cider)

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

(setq org-capture-templates
  '(
     ("t" "Quick task" entry
     (file "")
     "* TODO %^{Task}\n"
     :immediate-finish t)
    ("T" "Task" entry
     (file "")
     "* TODO %^{Task}\n")
    ("n" "Quick note" entry
     (file "")
     "* :NOTE: %^{Note}\n"
     :immediate-finish t)
    ("N" "Note" entry
     (file "")
     "* :NOTE: %^{Note}\n")))

(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

(setq org-startup-with-inline-images t)
(setq org-image-actual-width (/ (display-pixel-width) 3))

(require 'org-projectile)
(setq org-projectile-projects-file
      "~/Dropbox/org/projects/inbox.org")
(push (org-projectile-project-todo-entry) org-capture-templates)
(setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))

(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Liberation Serif"
                                           :height 1.4))
(add-hook 'nov-mode-hook 'my-nov-font-setup)

(setq nov-text-width 80)
(setq nov-text-width t)
(setq visual-fill-column-center-text t)
(add-hook 'nov-mode-hook 'visual-line-mode)
(add-hook 'nov-mode-hook 'visual-fill-column-mode)

(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

(require 'atomic-chrome)
(atomic-chrome-start-server)

(setq auth-sources '("~/.authinfo"))

(setq deft-directory "~/Dropbox/zettel")
;; Enable keybinds.
(zetteldeft-set-classic-keybindings)
