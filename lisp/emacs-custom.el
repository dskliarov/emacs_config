(setq default-directory "~/erlang_projects")

(setq user-full-name "Dmitri Skliarov")
(setq user-login-name "dskliarov")
(setq user-mail-address "DmitriSkliarov@QuickenLoans.com")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

 (custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
  '(custom-safe-themes
    (quote
 	("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
  '(ecb-layout-name "left15")
  '(ecb-layout-window-sizes
    (quote
 	(("left15"
 	  (ecb-directories-buffer-name 0.2 . 0.69875)
 	  (ecb-history-buffer-name 0.16 . 0.265625)))))
  '(ecb-options-version "2.40")
  '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
  '(ecb-source-path
    (quote
    ("~/erlang_projects/")))
  '(ecb-tip-of-the-day nil)
  '(ecb-tree-buffer-style (quote image))
  '(ede-project-directories
    (quote
 	("/Users/dskliarov/cpp_projects/cppl/include" "/Users/dskliarov/cpp_projects/cppl/src" "/Users/dskliarov/cpp_projects/cppl")))
  '(edts-man-root "/Users/dskliarov/.emacs.d/edts/doc/17.0"))

(semantic-add-system-include "/usr/local/Cellar/gcc/5.2.0/include/c++/5.2.0/" 'c++-mode)
(semantic-add-system-include "/usr/lib/c++/v1/" 'c++-mode)
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include/" 'c++-mode)
(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include/c++/4.2.1/" 'c++-mode)
;;(setq load-path (cons (expand-file-name "/usr/local/Cellar/cmake/3.1.3/share/cmake/editors/emacs") load-path))

(custom-set-faces (if (not window-system) '(default ((t (:background "nil"))))))
 ;; (custom-set-faces
 ;;  ;; custom-set-faces was added by Custom.
 ;;  ;; If you edit it by hand, you could mess it up, so be careful.
 ;;  ;; Your init file should contain only one such instance.
 ;;  ;; If there is more than one, they won't work right.
 ;;  '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown")))))
