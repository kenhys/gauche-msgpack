;;;
;;; msgpack
;;;

(define-module msgpack.sbuffer
  (extend msgpack)
  (export-all))

(select-module msgpack.sbuffer)

;; Loads extension
;;(dynamic-load "msgpack-sbuffer")

;;
;; Put your Scheme definitions here
;;
(define-method sbuffer-new ()
  (msgpack-sbuffer-new))

;; Epilogue
(provide "msgpack.sbuffer")


