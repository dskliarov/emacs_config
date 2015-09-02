;; Where is Erlang on this machine?
(if (not (boundp 'erlang-root-dir))
	(setq erlang-root-dir "/usr/local/Cellar/erlang/17.4.1/lib/erlang")) ;; Mac

(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes/solarized")

;; Hook up all the major and minor modes we care about
(require 'emacs-modes)
;; Explorer more popular emacs options here: http://www.emacswiki.org/emacs/PopularOptions

;; Make it look good
(load-theme 'solarized t)

;; Useful?
(require 'dircolors)

;;make sure ansi color character escapes are honored
(ansi-color-for-comint-mode-on)

;;Highlighting the selected line
(defface hl-line '((t (:background "gray10")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default

;;Allow font sizes to scale without distorting window dimensions
(require 'face-remap+)

;; Calms the default jumpy behavior
(require 'smooth-scrolling)

;; Display the current row and column number at the bottom of the window
(line-number-mode 1)
(column-number-mode 1)

;; Hide the hideous Emacs splash screen	 
(setq inhibit-splash-screen t)						

;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)

;; Useful?
(setq read-file-name-completion-ignore-case nil)

(setq make-backup-files nil)            ;; More here http://www.emacswiki.org/emacs/BackupDirectory
(setq use-file-dialog nil)

;; Be a bit more Windows-friendly
(transient-mark-mode t) 		;; highlight text selection
(delete-selection-mode t) 		;; delete seleted text when typing
(cua-mode t) 				;; windows style keybind C-x, C-v, cut paste
(setq cua-auto-tabify-rectangles nil) 	;; Don't tabify after rectangle commands
(setq cua-keep-region-after-copy t) 	;; Selection remains after C-c
(transient-mark-mode 1)             	;; No region when it is not highlighted

;; Visual Studio 
(show-paren-mode t) ; light-up matching parens
(global-font-lock-mode t) ; turn on syntax highlight

;; Setup auto highlight symbol
(require 'auto-highlight-symbol-config)
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ())

;; Set up buffer switching
(autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
(autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
(autoload 'cycle-buffer-permissive "cycle-buffer" "Cycle forward allowing *buffers*." t)
(autoload 'cycle-buffer-backward-permissive "cycle-buffer" "Cycle backward allowing *buffers*." t)
(autoload 'cycle-buffer-toggle-interesting "cycle-buffer" "Toggle if this buffer will be considered." t)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						 ("elpa" . "http://tromey.com/elpa/")
						 ("marmalade" . "https://marmalade-repo.org/packages/")
						 ("melpa-stable" . "http://stable.melpa.org/packages/")
						 ("melpa" . "http://melpa.org/packages/")))
(setq package-user-dir "~/.emacs.d/lisp/submodules/elpa")
(package-initialize)

;; Erlang
(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
    (require 'edts-start))

;; ido provides a very nice auto-complete for finding files (type C-x f)
;; Learn more here: http://www.emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

(setq text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))

;; Get rid of clutter
;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;;(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(defun find-file-save-default-directory ()
  (interactive)
  (setq saved-default-directory default-directory)
  (ido-find-file)
  (setq default-directory saved-default-directory))

(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

(global-linum-mode t)

(setq dired-recursive-deletes 'always)

(defun switch-buffers-between-frames ()
  "switch-buffers-between-frames switches the buffers between the two last frames"
  (interactive)
  (let ((this-frame-buffer nil)
	(other-frame-buffer nil))
    (setq this-frame-buffer (car (frame-parameter nil 'buffer-list)))
    (other-frame 1)
    (setq other-frame-buffer (car (frame-parameter nil 'buffer-list)))
    (switch-to-buffer this-frame-buffer)
    (other-frame 1)
    (switch-to-buffer other-frame-buffer)))

(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e)) 
(setq mouse-sel-mode t)

;; (require 'autopair)
;; (autopair-global-mode 1)
;; (setq autopair-autowrap t)

(add-to-list 'load-path "~/.emacs.d/lisp/cpp-ide")
(require 'cpp-ide)
(setq stack-trace-on-error t)
(require 'ecb)
(require 'key-bindings)
(require 'elixir-mode)
(require 'elixir-yasnippets)
(require 'lacarte)
(require 'restclient)
(alchemist-mode t)
(require 'elixir-custom)
(nyan-mode 1)
(setq load-path (cons (expand-file-name "/usr/local/Cellar/cmake/3.1.3/share/cmake/editors/emacs") load-path))
;; (require 'cmake-mode)
;; (setq auto-mode-alist
;;       (append
;;        '(("CMakeLists\\.txt\\'" . cmake-mode))
;;        '(("\\.cmake\\'" . cmake-mode))
;;        auto-mode-alist))
;; (autoload 'cmake-mode "/usr/local/Cellar/cmake/3.1.3/share/cmake/editors/emacs/cmake-mode.el" t)
(add-to-list 'auto-mode-alist '("[Mm]akefile\\'" . makefile-gmake-mode))
(setq custom-file "./emacs-custom.el")
(load custom-file)
(provide 'my-config)
