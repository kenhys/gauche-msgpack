;;;
;;; msgpack
;;;

(define-module messagepack
  (use messagepack.object)
  (use messagepack.pack)
  (use messagepack.sbuffer)
  (use messagepack.unpack)
  (use messagepack.vrebuffer)
  (use messagepack.zone)
  (export test-messagepack ;; dummy
          )
  )
(select-module messagepack)

;; Loads extension
(dynamic-load "messagepack")

;;
;; Put your Scheme definitions here
;;



