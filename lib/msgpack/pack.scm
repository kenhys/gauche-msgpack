;;;
;;; msgpack
;;;

(define-module msgpack.pack
  (extend msgpack)
  (export-all))

(select-module msgpack.pack)

;; Loads extension
(dynamic-load "gauche--msgpack" :init-function "Scm_Init_msgpack")

;;
;; Put your Scheme definitions here
;;


(define-method packer-new 
  (data :optional callback)
  (msgpack-packer-new data callback))

;; typedef int (*msgpack_packer_write)(void* data, const char* buf, unsigned int len);

;; typedef struct msgpack_packer {
;; 	void* data;
;; 	msgpack_packer_write callback;
;; } msgpack_packer;

;; static void msgpack_packer_init(msgpack_packer* pk, void* data, msgpack_packer_write callback);

;; static msgpack_packer* msgpack_packer_new(void* data, msgpack_packer_write callback);
;; static void msgpack_packer_free(msgpack_packer* pk);

;; (define (msgpack_pack_short pk::<msgpack-packer> d::<short>)
;;   (error ""))
;; (define (msgpack_pack_int pk::<msgpack-packer> d::<int>)
;;   (error ""))
;; (define (msgpack_pack_long pk::<msgpack-packer> d::<long>)
;;   (error ""))
;; (define (msgpack_pack_long_long pk::<msgpack-packer> d::<longlong>)
;;   (error ""))
;; (define (msgpack_pack_unsigned_short pk::<msgpack-packer> d::<ushort>)
;;   (error ""))
;; (define (msgpack_pack_unsigned_int pk::<msgpack-packer> d::<uint>)
;;   (error ""))
;; (define (msgpack_pack_unsigned_long pk::<msgpack-packer> d::<ulong>)
;;   (error ""))
;; (define (msgpack_pack_unsigned_long_long pk::<msgpack-packer> d::<ulonglong>)
;;   (error ""))

;; (define (msgpack_pack_uint8 pk::<msgpack-packer> d::<uint8_t>)
;;   (error ""))
;; (define (msgpack_pack_uint16 pk::<msgpack-packer> d::<uint16_t>)
;;   (error ""))
;; (define (msgpack_pack_uint32 pk::<msgpack-packer> d::<uint32_t>)
;;   (error ""))
;; (define (msgpack_pack_uint64 pk::<msgpack-packer> d::<uint64_t>)
;;   (error ""))
;; (define (msgpack_pack_int8 pk::<msgpack-packer> d::<int8_t>)
;;   (error ""))
;; (define (msgpack_pack_int16 pk::<msgpack-packer> d::<int16_t>)
;;   (error ""))
;; (define (msgpack_pack_int32 pk::<msgpack-packer> d::<int32_t>)
;;   (error ""))
;; (define (msgpack_pack_int64 pk::<msgpack-packer> d::<int64_t>)
;;   (error ""))

;; ;; static int msgpack_pack_float(msgpack_packer* pk, float d);
;; ;; static int msgpack_pack_double(msgpack_packer* pk, double d);

;; ;; static int msgpack_pack_nil(msgpack_packer* pk);
;; ;; static int msgpack_pack_true(msgpack_packer* pk);
;; ;; static int msgpack_pack_false(msgpack_packer* pk);

;; ;; static int msgpack_pack_array(msgpack_packer* pk, unsigned int n);
(define-method pack-array ((self <msgpack-packer>) n)
  (msgpack-pack-array self n))

;; ;; static int msgpack_pack_map(msgpack_packer* pk, unsigned int n);

(define-method pack-raw ((self <msgpack-packer>) n)
  (msgpack-pack-raw self n))

(define-method pack-raw-body ((self <msgpack-packer>) obj n)
  (msgpack-pack-raw-body self obj n))

;; (define-method msgpack-pack-object
;;   (error ""))

;; (define-method  (msgpack-pack-inline-func)
;;   (error ""))

;; (define-method (msgpack-pack-inline-func-cint)
;;   (error ""))

;; (define-method (msgpack-pack-user)
;;   (error ""))

;; (define-method (msgpack-pack-append-buffer)
;;   (error ""))

;; (define-method (msgpack-packer-init)
;;   (error ""))

;; (define-method (msgpack-packer-new data callback)
;;   (error ""))

;; (define-method (msgpack-packer-free pk)
;;   (error ""))


;; Epilogue
(provide "msgpack.pack")

