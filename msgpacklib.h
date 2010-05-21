/*
 * msgpack.h
 */

/* Prologue */
#ifndef GAUCHE_MSGPACK_H
#define GAUCHE_MSGPACK_H

#include <gauche.h>
#include <gauche/extend.h>

SCM_DECL_BEGIN

#include "msgpack.h"
/*
 * The following entry is a dummy one.
 * Replace it for your declarations.
 */

extern ScmClass *MsgPackObjectArrayClass;
extern ScmClass *MsgPackObjectClass;
extern ScmClass *MsgPackPackerClass;
extern ScmClass *MsgPackUnPackerClass;
extern ScmClass *MsgPackSbufferClass;
extern ScmClass *MsgPackVRefBufferClass;
extern ScmClass *MsgPackZoneClass;

extern ScmClass *ScmLongLongClass;
extern ScmClass *ScmULongLongClass;
extern ScmClass *ScmInt64Class;
extern ScmClass *ScmUInt64Class;
extern ScmClass *ScmSizeTClass;

#define MSGPACK_OBJECT_ARRAY_P(obj)      SCM_XTYPEP(obj, MsgPackObjectArrayClass)
#define MSGPACK_OBJECT_ARRAY_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(msgpack_object_array*, (obj))
#define MSGPACK_OBJECT_ARRAY_BOX(ptr)    Scm_MakeForeignPointer(MsgPackObjectArrayClass, ptr)

#define MSGPACK_OBJECT_P(obj)      SCM_XTYPEP(obj, MsgPackObjectClass)
#define MSGPACK_OBJECT_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(msgpack_object*, (obj))
#define MSGPACK_OBJECT_BOX(ptr)    Scm_MakeForeignPointer(MsgPackObjectClass, ptr)

#define MSGPACK_PACKER_P(obj)      SCM_XTYPEP(obj, MsgPackPackerClass)
#define MSGPACK_PACKER_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(msgpack_packer*, (obj))
#define MSGPACK_PACKER_BOX(ptr)    Scm_MakeForeignPointer(MsgPackPackerClass, ptr)

#define MSGPACK_UNPACKER_P(obj)      SCM_XTYPEP(obj, MsgPackUnPackerClass)
#define MSGPACK_UNPACKER_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(msgpack_unpacker*, (obj))
#define MSGPACK_UNPACKER_BOX(ptr)    Scm_MakeForeignPointer(MsgPackUnPackerClass, ptr)

#define MSGPACK_SBUFFER_P(obj)      SCM_XTYPEP(obj, MsgPackSbufferClass)
#define MSGPACK_SBUFFER_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(msgpack_sbuffer*, (obj))
#define MSGPACK_SBUFFER_BOX(ptr)    Scm_MakeForeignPointer(MsgPackSbufferClass, ptr)

#define MSGPACK_VREFBUFFER_P(obj)      SCM_XTYPEP(obj, MsgPackVRefBufferClass)
#define MSGPACK_VREFBUFFER_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(msgpack_vrefbuffer*, (obj))
#define MSGPACK_VREFBUFFER_BOX(ptr)    Scm_MakeForeignPointer(MsgPackVRefBufferClass, ptr)

#define MSGPACK_ZONE_P(obj)      SCM_XTYPEP(obj, MsgPackZoneClass)
#define MSGPACK_ZONE_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(msgpack_zone*, (obj))
#define MSGPACK_ZONE_BOX(ptr)    Scm_MakeForeignPointer(MsgPackZoneClass, ptr)

#define SCM_LONGLONG_P(obj)      SCM_XTYPEP(obj, ScmLongLongClass)
#define SCM_LONGLONG_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(long long*, (obj))
#define SCM_LONGLONG_BOX_BOX(ptr)    Scm_MakeForeignPointer(ScmLongLongClass, ptr)

#define SCM_ULONGLONG_P(obj)      SCM_XTYPEP(obj, ScmULongLongClass)
#define SCM_ULONGLONG_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(unsigned long long*, (obj))
#define SCM_ULONGLONG_BOX_BOX(ptr)    Scm_MakeForeignPointer(ScmULongLongClass, ptr)

#define SCM_INT64_P(obj)      SCM_XTYPEP(obj, ScmInt64Class)
#define SCM_INT64_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(int64_t*, (obj))
#define SCM_INT64_BOX(ptr)    Scm_MakeForeignPointer(ScmInt64Class, ptr)

#define SCM_UINT64_P(obj)      SCM_XTYPEP(obj, ScmUInt64Class)
#define SCM_UINT64_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(uint64_t*, (obj))
#define SCM_UINT64_BOX(ptr)    Scm_MakeForeignPointer(ScmUInt64Class, ptr)

#define SCM_SIZE_T_P(obj)      SCM_XTYPEP(obj, ScmSizeTClass)
#define SCM_SIZE_T_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(size_t*, (obj))
#define SCM_SIZE_T_BOX(ptr)    Scm_MakeForeignPointer(ScmSizeTClass, ptr)

/* Epilogue */
SCM_DECL_END

#endif  /* GAUCHE_MSGPACK_H */
