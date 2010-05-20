;;;
;;; Test msgpack
;;;

(use gauche.test)

(test-start "msgpack")
(use msgpack)
(test-module 'msgpack)

;; The following is a dummy test code.
;; Replace it for your tests.
(test* "test-msgpack" "msgpack is working"
       (test-msgpack))

;; epilogue
(test-end)





