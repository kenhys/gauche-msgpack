;;;
;;; msgpack
;;;

(define-module msgpack
  (export-all)
  )
(select-module msgpack)

;; Loads extension
(dynamic-load "gauche--msgpack" :init-function "Scm_Init_msgpack")

;;
;; Put your Scheme definitions here
;;



