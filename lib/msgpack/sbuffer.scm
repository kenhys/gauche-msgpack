;;;
;;; msgpack
;;;

(define-module msgpack.sbuffer
  (extend msgpack)
  (export-all))

(select-module msgpack.sbuffer)

;; Loads extension
(dynamic-load "gauche--msgpack" :init-function "Scm_Init_msgpack")

;;
;; Put your Scheme definitions here
;;
(define-method sbuffer-new ()
  (msgpack-sbuffer-new))

;; Epilogue
(provide "msgpack.sbuffer")


