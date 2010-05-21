;;;
;;; msgpack
;;;

(define-module messagepack
  (export-all)
  )
(select-module messagepack)

;; Loads extension
(dynamic-load "messagepack" :init-function "Scm_Init_msgpack")

;;
;; Put your Scheme definitions here
;;



