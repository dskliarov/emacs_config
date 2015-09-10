(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)
(global-semantic-highlight-func-mode 1)
(global-semantic-decoration-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-idle-completions-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-stickyfunc-mode 1)

;;(require 'semantic/bovine/gcc)

(semantic-mode 1)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

(defun my-c-mode-cedet-hook ()
  (add-to-list 'ac-sources 'ac-source-gtags)
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode t)

(provide 'setup-cedet)
