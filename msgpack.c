/*
 * msgpack.c
 */

#include "msgpacklib.h"

/*
 * The following function is a dummy one; replace it for
 * your C function definitions.
 */

ScmClass *MsgPackObjectArrayClass;
ScmClass *MsgPackObjectClass;
ScmClass *MsgPackPackerClass;
ScmClass *MsgPackUnPackerClass;
ScmClass *MsgPackSbufferClass;
ScmClass *MsgPackVRefBufferClass;
ScmClass *MsgPackZoneClass;

ScmClass *ScmInt64Class;
ScmClass *ScmUInt64Class;
ScmClass *ScmLongLongClass;
ScmClass *ScmULongLongClass;
ScmClass *ScmSizeTClass;

/*
 * Module initialization function.
 */
extern void Scm_Init_msgpacklib(ScmModule*);
extern void Scm_Init_msgpack_object(ScmModule*);
extern void Scm_Init_msgpack_pack(ScmModule*);
extern void Scm_Init_msgpack_sbuffer(ScmModule*);
extern void Scm_Init_msgpack_unpack(ScmModule*);
extern void Scm_Init_msgpack_vrefbuffer(ScmModule*);
extern void Scm_Init_msgpack_zone(ScmModule*);

void Scm_Init_msgpack(void)
{
    ScmModule *mod;

    /* Register this DSO to Gauche */
    SCM_INIT_EXTENSION(msgpack);

    /* Create the module if it doesn't exist yet. */
    mod = SCM_MODULE(SCM_FIND_MODULE("messagepack", TRUE));

    MsgPackSbufferClass =
        Scm_MakeForeignPointerClass(mod, "<msgpack-sbuffer>",
                                    NULL,
                                    NULL,
                                    SCM_FOREIGN_POINTER_KEEP_IDENTITY|SCM_FOREIGN_POINTER_MAP_NULL);

    
    /* Register stub-generated procedures */
    Scm_Init_msgpacklib(mod);

    Scm_Init_msgpack_object(mod);

    Scm_Init_msgpack_pack(mod);

    Scm_Init_msgpack_sbuffer(mod);

    Scm_Init_msgpack_unpack(mod);

    Scm_Init_msgpack_vrefbuffer(mod);

    Scm_Init_msgpack_zone(mod);
}
