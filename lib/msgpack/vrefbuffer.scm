;;;
;;; msgpack
;;;

(define-module msgpack.vrefbuffer
  (extend msgpack)
  (export-all))

(select-module msgpack.vrefbuffer)

;; Loads extension
(dynamic-load "gauche--msgpack" :init-function "Scm_Init_msgpack")


;;
;; Put your Scheme definitions here
;;

;; Epilogue
(provide "msgpack.vrefbuffer")



