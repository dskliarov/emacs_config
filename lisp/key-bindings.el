;; ================================================
;; Key Configurations
;; ================================================

(define-key isearch-mode-map (kbd "M-f") 'isearch-repeat-forward)

(global-set-key (kbd "C-w") 'kill-this-buffer)

(global-set-key (kbd "C-<") 'text-scale-decrease)
(global-set-key (kbd "C->") 'text-scale-increase)

(global-set-key (kbd "C-x C-f") 'find-file-save-default-directory)

(global-set-key (kbd "C-c C-c") 'comment-region)

(global-set-key (kbd "C-c C-u") 'uncomment-region)
(global-set-key (kbd "C-c C-a") 'helm-mini)
(global-set-key (kbd "M-'") 'highlight-symbol-at-point)
(global-set-key (kbd "M-;") 'highlight-regexp)


(global-set-key (kbd "C-x C-g") 'find-grep-dired)
(global-set-key (kbd "C-x /") 'ecb-activate)
(global-set-key (kbd "C-x '") 'ecb-deactivate)
(global-set-key (kbd "C-c d") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c h") 'ecb-goto-window-history)
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)
;;(define-key c-mode-base-map (kbd "RET") 'new line-and-indent)

;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;; (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

;; (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(global-set-key [(f8)]        'cycle-buffer-backward)
(global-set-key [(f9)]       'cycle-buffer)
(global-set-key [(shift f8)]  'cycle-buffer-backward-permissive)
(global-set-key [(shift f9)] 'cycle-buffer-permissive)
;; ================================================
;; terminal-only settings
;; ================================================
(unless window-system
  ;; enable mouse support
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
							   (interactive)
							   (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
							   (interactive)
							   (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)

  ;; input decode map
  (define-key input-decode-map "\e[1;0A" [M-S-up])
  (define-key input-decode-map "\e[1;0B" [M-S-down])
  (define-key input-decode-map "\e[1;0C" [M-S-right])
  (define-key input-decode-map "\e[1;0D" [M-S-left])
  (define-key input-decode-map "\e[1;2A" [S-up])
  (define-key input-decode-map "\e[1;2B" [S-down])
  (define-key input-decode-map "\e[1;2C" [S-right])
  (define-key input-decode-map "\e[1;2D" [S-left])
  (define-key input-decode-map "\e[1;3A" [M-up])
  (define-key input-decode-map "\e[1;3B" [M-down])
  (define-key input-decode-map "\e[1;3C" [M-right])
  (define-key input-decode-map "\e[1;3D" [M-left])
  (define-key input-decode-map "\e[1;5A" [C-up])
  (define-key input-decode-map "\e[1;5B" [C-down])
  (define-key input-decode-map "\e[1;5C" [C-right])
  (define-key input-decode-map "\e[1;5D" [C-left])
  (define-key input-decode-map "\e[1;6A" [C-S-up])
  (define-key input-decode-map "\e[1;6B" [C-S-down])
  (define-key input-decode-map "\e[1;6C" [C-S-right])
  (define-key input-decode-map "\e[1;6D" [C-S-left]))

;; ================================================
;; rest client
;; ================================================
(global-set-key (kbd "C-c M-c") 'restclient-http-send-current)
(global-set-key (kbd "C-c M-r") 'restclient-http-send-current-raw)
(global-set-key (kbd "C-c M-v") 'restclient-http-send-current-stay-in-window)
(global-set-key (kbd "C-c M-n") 'restclient-jump-next)
(global-set-key (kbd "C-c M-p") 'restclient-jump-prev)
(global-set-key (kbd "C-c M-.") 'restclient-mark-current)
(global-set-key (kbd "C-c C-u") 'restclient-copy-curl-command)
(provide 'key-bindings)
