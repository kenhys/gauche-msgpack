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

/* Epilogue */
SCM_DECL_END

#endif  /* GAUCHE_MSGPACK_H */
