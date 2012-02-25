/*
 * msgpack.h
 */

/* Prologue */
#ifndef GAUCHE_MSGPACK_H
#define GAUCHE_MSGPACK_H

#include <gauche.h>
#include <gauche/extend.h>
#include <gauche/class.h>

SCM_DECL_BEGIN


#include "msgpack.h"

/*
 * The following entry is a dummy one.
 * Replace it for your declarations.
 */

typedef struct ScmMsgpackObjectArrayRec {
SCM_HEADER;
msgpack_object_array h;
} ScmMsgpackObjectArray;

SCM_CLASS_DECL(Scm_MsgpackObjectArrayClass);
#define SCM_CLASS_MSGPACK_OBJECT_ARRAY (&Scm_MsgpackObjectArrayClass)
#define SCM_MSGPACK_OBJECT_ARRAY(obj) ((ScmMsgpackObjectArray*)(obj))
#define SCM_MSGPACK_OBJECT_ARRAY_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_OBJECT_ARRAY))


typedef struct ScmMsgpackObjectMapRec {
SCM_HEADER;
msgpack_object_map h;
} ScmMsgpackObjectMap;

SCM_CLASS_DECL(Scm_MsgpackObjectMapClass);
#define SCM_CLASS_MSGPACK_OBJECT_MAP (&Scm_MsgpackObjectMapClass)
#define SCM_MSGPACK_OBJECT_MAP(obj) ((ScmMsgpackObjectMap*)(obj))
#define SCM_MSGPACK_OBJECT_MAP_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_OBJECT_MAP))

typedef struct ScmMsgpackObjectRawRec {
SCM_HEADER;
msgpack_object_raw h;
} ScmMsgpackObjectRaw;

SCM_CLASS_DECL(Scm_MsgpackObjectRawClass);
#define SCM_CLASS_MSGPACK_OBJECT_RAW (&Scm_MsgpackObjectRawClass)
#define SCM_MSGPACK_OBJECT_RAW(obj) ((ScmMsgpackObjectRaw*)(obj))
#define SCM_MSGPACK_OBJECT_RAW_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_OBJECT_RAW))

typedef struct ScmMsgpackObjectUnionRec {
SCM_HEADER;
msgpack_object_union h;
} ScmMsgpackObjectUnion;

SCM_CLASS_DECL(Scm_MsgpackObjectUnionClass);
#define SCM_CLASS_MSGPACK_OBJECT_UNION (&Scm_MsgpackObjectUnionClass)
#define SCM_MSGPACK_OBJECT_UNION(obj) ((ScmMsgpackObjectUnion*)(obj))
#define SCM_MSGPACK_OBJECT_UNION_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_OBJECT_UNION))

typedef struct ScmMsgpackObjectRec {
SCM_HEADER;
msgpack_object h;
} ScmMsgpackObject;

SCM_CLASS_DECL(Scm_MsgpackObjectClass);
#define SCM_CLASS_MSGPACK_OBJECT (&Scm_MsgpackObjectClass)
#define SCM_MSGPACK_OBJECT(obj) ((ScmMsgpackObject*)(obj))
#define SCM_MSGPACK_OBJECT_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_OBJECT))

typedef struct ScmMsgpackObjectKvRec {
SCM_HEADER;
msgpack_object_kv h;
} ScmMsgpackObjectKv;

SCM_CLASS_DECL(Scm_MsgpackObjectKvClass);
#define SCM_CLASS_MSGPACK_OBJECT_KV (&Scm_MsgpackObjectKvClass)
#define SCM_MSGPACK_OBJECT_KV(obj) ((ScmMsgpackObjectKv*)(obj))
#define SCM_MSGPACK_OBJECT_KV_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_OBJECT_KV))


typedef struct ScmMsgpackPackerRec {
SCM_HEADER;
msgpack_packer *h;
} ScmMsgpackPacker;

SCM_CLASS_DECL(Scm_MsgpackPackerClass);
#define SCM_CLASS_MSGPACK_PACKER (&Scm_MsgpackPackerClass)
#define SCM_MSGPACK_PACKER(obj) ((ScmMsgpackPacker*)(obj))
#define SCM_MSGPACK_PACKER_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_PACKER))

typedef struct ScmMsgpackUnPackedRec {
SCM_HEADER;
msgpack_unpacked *h;
} ScmMsgpackUnPacked;

SCM_CLASS_DECL(Scm_MsgpackUnPackedClass);
#define SCM_CLASS_MSGPACK_UNPACKED (&Scm_MsgpackUnPackedClass)
#define SCM_MSGPACK_UNPACKED(obj) ((ScmMsgpackUnPacked*)(obj))
#define SCM_MSGPACK_UNPACKED_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_UNPACKED))

typedef struct ScmMsgpackUnPackerRec {
SCM_HEADER;
msgpack_unpacker *h;
} ScmMsgpackUnPacker;

SCM_CLASS_DECL(Scm_MsgpackUnPackerClass);
#define SCM_CLASS_MSGPACK_UNPACKER (&Scm_MsgpackUnPackerClass)
#define SCM_MSGPACK_UNPACKER(obj) ((ScmMsgpackUnPacker*)(obj))
#define SCM_MSGPACK_UNPACKER_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_UNPACKER))

typedef struct ScmMsgpackZoneRec {
SCM_HEADER;
msgpack_zone h;
} ScmMsgpackZone;

SCM_CLASS_DECL(Scm_MsgpackZoneClass);
#define SCM_CLASS_MSGPACK_ZONE (&Scm_MsgpackZoneClass)
#define SCM_MSGPACK_ZONE(obj) ((ScmMsgpackZone*)(obj))
#define SCM_MSGPACK_ZONE_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_ZONE))


typedef struct ScmMsgpackSbufferRec {
SCM_HEADER;
msgpack_sbuffer *h;
} ScmMsgpackSbuffer;

SCM_CLASS_DECL(Scm_MsgpackSbufferClass);
#define SCM_CLASS_MSGPACK_SBUFFER (&Scm_MsgpackSbufferClass)
#define SCM_MSGPACK_SBUFFER(obj) ((ScmMsgpackSbuffer*)(obj))
#define SCM_MSGPACK_SBUFFER_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_MSGPACK_SBUFFER))


SCM_CLASS_DECL(Scm_LongLongClass);
#define SCM_CLASS_LONGLONG (&Scm_LongLongClass)
#define SCM_LONGLONG(obj) ((long long)(obj))
#define SCM_LONGLONG_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_LONGLONG))

SCM_CLASS_DECL(Scm_ULongLongClass);
#define SCM_CLASS_ULONGLONG (&Scm_ULongLongClass)
#define SCM_ULONGLONG(obj) ((unsigned long long)(obj))
#define SCM_ULONGLONG_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_ULONGLONG))

SCM_CLASS_DECL(Scm_Int64Class);
#define SCM_CLASS_INT64 (&Scm_Int64Class)
#define SCM_INT64(obj) ((int64_t)(obj))
#define SCM_INT64_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_INT64))

SCM_CLASS_DECL(Scm_UInt64Class);
#define SCM_CLASS_UINT64 (&Scm_UInt64Class)
#define SCM_UINT64(obj) ((uint64_t)(obj))
#define SCM_UINT64_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_UINT64))

SCM_CLASS_DECL(Scm_SizeTClass);
#define SCM_CLASS_SIZET (&Scm_SizeTClass)
#define SCM_SIZET(obj) ((size_t)(obj))
#define SCM_SIZET_P(obj) (SCM_XTYPEP(obj, SCM_CLASS_SIZET))

/* Epilogue */
SCM_DECL_END

#endif  /* GAUCHE_MSGPACK_H */
