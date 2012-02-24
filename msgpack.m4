dnl
dnl Configure msgpack
dnl This file is included by the toplevel configure.ac
dnl

dnl
dnl process with-msgpack
dnl

AC_ARG_WITH(libdir,
  [AS_HELP_STRING([--with-libdir=PATH],[look for libraries in .../NAME rather than .../lib])
  ],
  [LIBDIR=$with_libdir],
  [LIBDIR=lib]
)


dnl --with-zlib
AC_ARG_WITH(zlib,
  [AS_HELP_STRING([--with-zlib=PATH],[specify zlib install prefix])
  ],
  [ ],
  [with_zlib=yes]
)

if test "x$with_zlib" = "xno"; then
  AC_DEFINE([HAVE_NOZLIB], [], [zlib is not available])
else
  AC_MSG_CHECKING([zlib install prefix])

  if test "x$with_zlib" = "xyes"; then
    for i in `echo "$STANDARD_PREFIXES"`; do
      if test -f "$i/include/zlib.h"; then
        ZLIB_DIR="$i"
        break;
      fi
    done
  else
    if test -f "$with_zlib/include/zlib.h"; then
      ZLIB_DIR="$with_zlib"
      break;
    else
      AC_MSG_ERROR([Can't find zlib headers under $with_zlib directory]);
    fi
  fi

  if test "x$ZLIB_DIR" = "x"; then
    AC_MSG_ERROR([Unable to locate zlib headers, please use --with-zlib=<DIR>]);
  fi

  AC_MSG_RESULT([$ZLIB_DIR])
  LDFLAGS="$LDFLAGS -L$ZLIB_DIR/$LIBDIR"
  CFLAGS="$CFLAGS -I$ZLIB_DIR/include"
  LIBS="$LIBS -lz"

  AC_CHECK_LIB([z], [deflate], [], [
    AC_MSG_ERROR([deflate() is missing, check config.log for more details])
  ])

  HAVE_ZLIB=yes
fi
dnl 


dnl Use msgpack unless explicitly specified otherwise
ac_cv_use_msgpack=yes
MSGPACK_CPPFLAGS=
MSGPACK_LDFLAGS=

AC_ARG_WITH(msgpack,
  AC_HELP_STRING([--with-msgpack=PATH],
                 [Use msgpack library installed under PATH.
The msgpack module uses msgpack if it is available.  If your system has msgpack
library in non-trivial location, specify this option.
The include file is looked for in PATH/include,
and the library file is looked for in PATH/lib.
If you don't want to use msgpack for some reason, say --without-msgpack. ]),
  [
  case $with_msgpack in
    no)  ac_cv_use_msgpack=no;;
    yes) ;;
    *)   MSGPACK_CPPFLAGS="-I$with_msgpack/include";
         MSGPACK_LDFLAGS="-L$with_msgpack/lib";
	 MSGPACK_DIR=$with_msgpack;;

  esac
 ])

dnl
dnl Check msgpack.h
dnl
if test "$ac_cv_use_msgpack" != no; then
  save_cppflags=$CPPFLAGS
  CPPFLAGS="$CPPFLAGS $MSGPACK_CPPFLAGS"
  AC_CHECK_HEADER([msgpack.h],
     AC_DEFINE(HAVE_MSGPACK_H,1,[Define if you have msgpack.h and want to use it]),
     [AC_MSG_WARN("Can't find msgpack.h so I turned off using msgpack; you may want to use --with-msgpack=PATH.")
      ac_cv_use_msgpack=no])
  CPPFLAGS=$save_cppflags
fi
AC_SUBST(MSGPACK_DIR)

dnl
dnl Check libmsgpack.
dnl

if test "$ac_cv_use_msgpack" = yes; then
  save_cflags="$CFLAGS"
  save_ldflags="$LDFLAGS"
  save_libs="$LIBS"
  CFLAGS="$CFLAGS $MSGPACK_CPPFLAGS"
  LDFLAGS="$LDFLAGS $MSGPACK_LDFLAGS"
  LIBS="$LIBS -lmsgpack -lz"
  AC_LINK_IFELSE(
    [AC_LANG_PROGRAM([#include <msgpack.h>],
                     [[MSGPACK_GetVersion();]])],
    [MSGPACK_LIBS="$MSGPACK_LDFLAGS -lmsgpackc"],
    [AC_MSG_WARN("Can't find libmsgpackc so I turned off using msgpack; you may want to use --with-msgpack=PATH")
      ac_cv_use_msgpack=no])
  CFLAGS="$save_cflags"
  LDFLAGS="$save_ldflags"
  LIBS="$save_libs"
fi

if test "$ac_cv_use_msgpack" = yes; then
  AC_DEFINE(USE_MSGPACK)
  MSGPACK_ARCHFILES=msgpack.$SHLIB_SO_SUFFIX
  AC_SUBST(MSGPACK_ARCHFILES)
  MSGPACK_SCMFILES=msgpack.scm
  AC_SUBST(MSGPACK_SCMFILES)
fi
AC_SUBST(MSGPACK_CPPFLAGS)
AC_SUBST(MSGPACK_LDFLAGS)
AC_SUBST(MSGPACK_LIBS)




dnl Local variables:
dnl mode: autoconf
dnl end:
