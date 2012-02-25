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

(define-method unpack-next ((self <msgpack-unpacked>)
			    (buffer <msgpack-sbuffer>))
  (msgpack-unpack-next self buffer))

(define-method unpacked-init ((self <msgpack-unpacked>))
  (msgpack-unpacked-init self))

;; Epilogue
(provide "msgpack.unpack")



