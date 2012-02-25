;;;
;;; msgpack
;;;

(define-module msgpack.unpack
  (extend msgpack)
  (export-all))

(select-module msgpack.unpack)

;; Loads extension
(dynamic-load "gauche--msgpack" :init-function "Scm_Init_msgpack")

;;
;; Put your Scheme definitions here
;;

;; Epilogue
(provide "msgpack.unpack")



