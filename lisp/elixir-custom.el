
(sp-with-modes '(elixir-mode)
  (sp-local-pair "fn" "end"
                 :when '(("SPC" "RET"))
                 :actions '(insert navigate))
  (sp-local-pair "do" "end"
                 :when '(("SPC" "RET"))
                 :post-handlers '(sp-ruby-def-post-handler)
                          :actions '(insert navigate)))

;; (defun my-elixir-do-end-close-action (id action context)
;;   (when (eq action 'insert)
;;     (newline-and-indent)
;;     (forward-line -1)
;;     (indent-according-to-mode)))

;; (sp-with-modes '(elixir-mode)
;;   (sp-local-pair "->" "end"
;;                  :when '(("RET"))
;;                  :post-handlers '(:add my-elixir-do-end-close-action)
;;                  :actions '(insert)))

;; (sp-with-modes '(elixir-mode)
;;   (sp-local-pair "do" "end"
;;                  :when '(("SPC" "RET"))
;;                  :post-handlers '(:add my-elixir-do-end-close-action)
;;                  :actions '(insert)))

(provide 'elixir-custom)
