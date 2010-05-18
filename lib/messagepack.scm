;;;
;;; msgpack
;;;

(define-module messagepack
  (use messagepack.object)
  (use messagepack.pack)
  (use messagepack.sbuffer)
  (use messagepack.unpack)
  (use messagepack.vrefbuffer)
  (use messagepack.zone)
  (export-all)
  )
(select-module messagepack)

;; Loads extension
(dynamic-load "msgpack")

;;
;; Put your Scheme definitions here
;;



