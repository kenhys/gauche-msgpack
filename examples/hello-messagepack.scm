;; -*- mode:scheme; coding: utf-8 -*-

(use gauche.interactive)
(use msgpack)


(define (main args)
  (let* ([buffer (sbuffer-new)]
	 [pk (packer-new buffer msgpack-sbuffer-write)])
    
    ;; serialized ["Hello", "MessagePack"]
    (pack-array pk 2)
    (pack-raw pk 5)
    (pack-raw-body pk "Hello" 5)
    (pack-raw pk 11)
    (pack-raw-body pk "MessagePack" 11)

    ;; deserialize it.
    (let* ([msg (make <msgpack-unpacked>)]
	   [obj (make <msgpack-object>)])
      (unpacked-init msg)
      
      (unpack-next msg buffer)
      
      ;; prints
      (set! obj (slot-ref! msg 'data))
      (object-print stdout obj))

    (free buffer)
    (free pk)))
	 