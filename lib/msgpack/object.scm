;;;
;;; msgpack
;;;

(define-module msgpack.object
  (extend msgpack)
  (export-all))

(select-module msgpack.object)

;; Loads extension
(dynamic-load "gauche--msgpack" :init-function "Scm_Init_msgpack")

;;
;; Put your Scheme definitions here
;;

;; Epilogue
(provide "msgpack.object")

