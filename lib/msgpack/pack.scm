;;;
;;; msgpack
;;;

(define-module messagepack.pack
  (export test-messagepack ;; dummy
          )
  )
(select-module messagepack.pack)

;; Loads extension
;;(dynamic-load "msgpack-pack")

;;
;; Put your Scheme definitions here
;;
;; typedef int (*msgpack_packer_write)(void* data, const char* buf, unsigned int len);

;; typedef struct msgpack_packer {
;; 	void* data;
;; 	msgpack_packer_write callback;
;; } msgpack_packer;

;; static void msgpack_packer_init(msgpack_packer* pk, void* data, msgpack_packer_write callback);

;; static msgpack_packer* msgpack_packer_new(void* data, msgpack_packer_write callback);
;; static void msgpack_packer_free(msgpack_packer* pk);

(define (msgpack_pack_short pk::<msgpack-packer> d::<short>)
  (error ""))
(define (msgpack_pack_int pk::<msgpack-packer> d::<int>)
  (error ""))
(define (msgpack_pack_long pk::<msgpack-packer> d::<long>)
  (error ""))
(define (msgpack_pack_long_long pk::<msgpack-packer> d::<longlong>)
  (error ""))
(define (msgpack_pack_unsigned_short pk::<msgpack-packer> d::<ushort>)
  (error ""))
(define (msgpack_pack_unsigned_int pk::<msgpack-packer> d::<uint>)
  (error ""))
(define (msgpack_pack_unsigned_long pk::<msgpack-packer> d::<ulong>)
  (error ""))
(define (msgpack_pack_unsigned_long_long pk::<msgpack-packer> d::<ulonglong>)
  (error ""))

(define (msgpack_pack_uint8 pk::<msgpack-packer> d::<uint8_t>)
  (error ""))
(define (msgpack_pack_uint16 pk::<msgpack-packer> d::<uint16_t>)
  (error ""))
(define (msgpack_pack_uint32 pk::<msgpack-packer> d::<uint32_t>)
  (error ""))
(define (msgpack_pack_uint64 pk::<msgpack-packer> d::<uint64_t>)
  (error ""))
(define (msgpack_pack_int8 pk::<msgpack-packer> d::<int8_t>)
  (error ""))
(define (msgpack_pack_int16 pk::<msgpack-packer> d::<int16_t>)
  (error ""))
(define (msgpack_pack_int32 pk::<msgpack-packer> d::<int32_t>)
  (error ""))
(define (msgpack_pack_int64 pk::<msgpack-packer> d::<int64_t>)
  (error ""))

;; static int msgpack_pack_float(msgpack_packer* pk, float d);
;; static int msgpack_pack_double(msgpack_packer* pk, double d);

;; static int msgpack_pack_nil(msgpack_packer* pk);
;; static int msgpack_pack_true(msgpack_packer* pk);
;; static int msgpack_pack_false(msgpack_packer* pk);

;; static int msgpack_pack_array(msgpack_packer* pk, unsigned int n);

;; static int msgpack_pack_map(msgpack_packer* pk, unsigned int n);

(define msgpack_pack_raw
  (error ""))

(define msgpack-pack-raw-body
  (error ""))

(define msgpack-pack-object
  (error ""))

(define  (msgpack-pack-inline-func)
  (error ""))

(define (msgpack-pack-inline-func-cint)
  (error ""))

(define (msgpack-pack-user)
  (error ""))

(define (msgpack-pack-append-buffer)
  (error ""))

(define (msgpack-packer-init)
  (error ""))

(define (msgpack-packer-new data callback)
  (error ""))

(define (msgpack-packer-free pk)
  (error ""))
