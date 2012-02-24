;;;
;;; msgpack
;;;

(define-module msgpack
  (extend
   msgpack.object
   msgpack.zone
   msgpack.pack
   msgpack.unpack
   msgpack.sbuffer
   msgpack.vrefbuffer)
  (export-all))

(select-module msgpack)

;; Loads extension
(dynamic-load "gauche--msgpack" :init-function "Scm_Init_msgpack")

;;
;; Put your Scheme definitions here
;;

;; Epilogue
(provide "msgpack")

