/*
 * msgpack.c
 */

#include "msgpack.h"

/*
 * The following function is a dummy one; replace it for
 * your C function definitions.
 */

ScmObj test_msgpack(void)
{
    return SCM_MAKE_STR("msgpack is working");
}

/*
 * Module initialization function.
 */
extern void Scm_Init_msgpacklib(ScmModule*);

void Scm_Init_msgpack(void)
{
    ScmModule *mod;

    /* Register this DSO to Gauche */
    SCM_INIT_EXTENSION(msgpack);

    /* Create the module if it doesn't exist yet. */
    mod = SCM_MODULE(SCM_FIND_MODULE("msgpack", TRUE));

    /* Register stub-generated procedures */
    Scm_Init_msgpacklib(mod);
}
