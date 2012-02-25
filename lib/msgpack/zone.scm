;;;
;;; msgpack.zone
;;;

(define-module msgpack.zone
  (extend msgpack)
  (export-all))

(select-module msgpack.zone)

;; Loads extension
(dynamic-load "gauche--msgpack" :init-function "Scm_Init_msgpack")

;;
;; Put your Scheme definitions here
;;



