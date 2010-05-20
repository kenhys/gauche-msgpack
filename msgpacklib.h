/*
 * msgpack.h
 */

/* Prologue */
#ifndef GAUCHE_MSGPACK_H
#define GAUCHE_MSGPACK_H

#include <gauche.h>
#include <gauche/extend.h>

SCM_DECL_BEGIN

#include "<msgpack.h>"
/*
 * The following entry is a dummy one.
 * Replace it for your declarations.
 */

extern ScmObj test_msgpack(void);

extern ScmClass *MsgPackObjectArrayClass;
extern ScmClass *MsgPackObjectClass;

#define MSGPACK_OBJECT_ARRAY_P(obj)      SCM_XTYPEP(obj, MsgPackObjectArrayClass)
#define MSGPACK_OBJECT_ARRAY_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(MsgPackObjectArrayClass*, obj)
#define MSGPACK_OBJECT_ARRAY_BOX(ptr)    Scm_MakeForeignPointer(MsgPackObjectArrayClass, ptr)

#define MSGPACK_OBJECT_P(obj)      SCM_XTYPEP(obj, MsgPackObjectClass)
#define MSGPACK_OBJECT_UNBOX(obj)  SCM_FOREIGN_POINTER_REF(MsgPackObjectClass*, obj)
#define MSGPACK_OBJECT_BOX(ptr)    Scm_MakeForeignPointer(MsgPackObjectClass, ptr)

/* Epilogue */
SCM_DECL_END

#endif  /* GAUCHE_MSGPACK_H */
