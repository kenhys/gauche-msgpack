;;;
;;; Test msgpack
;;;

(use gauche.test)

(test-start "messagepack")
(use messagepack)
(test-module 'messagepack)

;; The following is a dummy test code.
;; Replace it for your tests.
(test* "test-msgpack" "msgpack is working"
       (test-msgpack))

;; epilogue
(test-end)





