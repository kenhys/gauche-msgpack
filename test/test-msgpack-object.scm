;;;
;;; Test msgpack
;;;

(use gauche.test)
(use msgpack)


(test-record-file "test.record")
(test-module 'msgpack)

(test-start "msgpack-object")


;; The following is a dummy test code.
;; Replace it for your tests.
;;(test* "test-msgpack" "msgpack is working"
;;       (test-msgpack))

;; epilogue
(test-end)





