#!/bin/bash
# -*- coding: utf-8-unix -*-

GOSH=gosh

if [ -z "$VERSION" ]; then
    VERSION=0.9.1_pre1
    #VERSION=0.9
fi

if [ "$VERSION" = "0.9" ]; then
    GDIST_DIR=/c/apps/Gauche-mingw-0.9
    GDIST_INCDIR=$GDIST_DIR/lib/gauche/0.9/include
    GDIST_LIBDIR=$GDIST_DIR/bin
    GAUCHE_CONFIG=$GDIST_DIR/bin/gauche-config
    GENSTUB=$GDIST_DIR/share/gauche/0.9/lib/genstub
    LIBGAUCHE=-lgauche
    export PATH=$GDIST_DIR:$PATH
else
    GDIST_DIR=/c/gauche
    GDIST_INCDIR=$GDIST_DIR/lib/gauche-0.9/0.9.1_pre1/include
    GDIST_LIBDIR=$GDIST_DIR/bin
    GAUCHE_CONFIG=$GDIST_DIR/bin/gauche-config
    GENSTUB=$GDIST_DIR/share/gauche/0.9.1_pre1/lib/genstub
    export GENSTUB=$GENSTUB
    LIBGAUCHE=-lgauche-0.9
    export PATH=$GDIST_DIR:$PATH
fi

CB_BUILD=0
CB_BUILD_STUB=""
CB_CLEAN=0
CB_CLEAN_ALL=0
CB_TEST=0
CB_TEST_SCM=""
CB_LIBTEST=0
CB_PREPROCESS=0
CB_PREPROCESS_FILE=""

MSGPACK_INC="-I/mingw/include"
MSGPACK_LIB="-lmsgpack -lmsgpackc"

#CFLAGS="-DHAVE_BOOL $MSGPACK_INC"
CFLAGS=" $MSGPACK_INC"

function cb_preprocess ()
{
    mod=$1
    if [ -f "$mod" ]; then
        com="gcc -E ${mod} $CFLAGS -I$GDIST_INCDIR > tmp.c"
    echo $com
    eval $com
        com="gcc -c tmp.c $CFLAGS -I$GDIST_INCDIR 2>&1 | tee tmp.log"
    echo $com
    eval $com
    fi
}

function cb_compile ()
{
    mod=$1
    if [ -f "${mod}_head.c" ]; then
        com="gcc -c ${mod}_head.c $CFLAGS -I$GDIST_INCDIR"
        echo $com
        eval $com
        if [ $? -ne 0 ]; then
            exit
        fi
    fi 
    if [ -f "${mod}_tail.c" ]; then
        com="gcc -c ${mod}_tail.c $CFLAGS -I$GDIST_INCDIR"
        echo $com
        eval $com
        if [ $? -ne 0 ]; then
            exit
        fi
    fi 
    if [ -f "${mod}.c" ]; then
        com="LANG=C gcc  $CFLAGS -c ${mod}.c $CFLAGS -I$GDIST_INCDIR 2>&1 | tee log/${mod}.c.log"
        echo $com
        eval $com
        if [ $? -ne 0 ]; then
            exit
        fi
    fi 
    
}

function cb_build ()
{
    mkdir -p log
    $GAUCHE_CONFIG --fixup-extension msgpacklib msgpack
    $GOSH $GENSTUB msgpacklib.stub
    for m in msgpack-object msgpack-zone msgpack-pack msgpack-unpack msgpack-sbuffer msgpack-vrefbuffer; do
        c=0
        if [ ! -z "$CB_BUILD_STUB" ]; then
            if [ "$CB_BUILD_STUB" = "$m.stub" ]; then
                c=1
            fi
        else
            c=1
        fi
        if [ $c -eq 1 ]; then
            f=`echo $m | sed -e 's|-|_|'`
#             printf "\ngenerate fixup for %s\n" $f
#             $GAUCHE_CONFIG --fixup-extension $m $f
            printf "\ngenerate .c from %s.stub\n" $f
            $GOSH $GENSTUB "${m}.stub"
            printf "\ncompile %s.c and related stuff\n" $f
            cb_compile $m 0
        else
            printf "skip $m.stub\n"
        fi
    done
    cb_compile msgpacklib
    com="LANG=C gcc -c msgpack.c -I$GDIST_INCDIR $CFLAGS 2>&1 | tee log/msgpack.c.log"
    echo $com
    eval $com
    if [ $? -ne 0 ]; then
        echo "fail"
        exit
    fi
    #OBJS="msgpack.o msgpacklib.o msgpacklib_head.o msgpacklib_tail.o"
    OBJS="msgpack*.o"
    com="LANG=C gcc -lmingw32 `gauche-config --dylib-ldflags` messagepack.dll $OBJS  -L. $MSGPACK_LIB -L$GDIST_LIBDIR $LIBGAUCHE -lws2_32 -lshlwapi"
    echo $com
    eval $com
    if [ $? -ne 0 ]; then
        exit
    fi
#     com="LANG=C gcc -lmingw32 `gauche-config --dylib-ldflags` msgpack-object.dll msgpack-object*.o  -L. $MSGPACK_LIB -L$GDIST_LIBDIR $LIBGAUCHE"
#     echo $com
#     eval $com
#     com="LANG=C gcc -lmingw32 `gauche-config --dylib-ldflags` msgpack-zone.dll msgpack-zone*.o  -L. $MSGPACK_LIB -L$GDIST_LIBDIR $LIBGAUCHE"
#     echo $com
#     eval $com
#     com="LANG=C gcc -lmingw32 `gauche-config --dylib-ldflags` msgpack-pack.dll msgpack-pack*.o  -L. $MSGPACK_LIB -L$GDIST_LIBDIR $LIBGAUCHE"
#     echo $com
#     eval $com
#     com="LANG=C gcc -lmingw32 `gauche-config --dylib-ldflags` msgpack-unpack.dll msgpack-unpack*.o  -L. $MSGPACK_LIB -L$GDIST_LIBDIR $LIBGAUCHE"
#     echo $com
#     eval $com
#     com="LANG=C gcc -lmingw32 `gauche-config --dylib-ldflags` msgpack-sbuffer.dll msgpack-sbuffer*.o  -L. $MSGPACK_LIB -L$GDIST_LIBDIR $LIBGAUCHE"
#     echo $com
#     eval $com
#     com="LANG=C gcc -lmingw32 `gauche-config --dylib-ldflags` msgpack-vrefbuffer.dll msgpack-vrefbuffer*.o  -L. $MSGPACK_LIB -L$GDIST_LIBDIR $LIBGAUCHE"
#     echo $com
#     eval $com
}

function cb_clean ()
{

    rm -f *.o
    rm -f msgpacklib.c
    rm -f config.status
    rm -f configure
    rm -f *.exe
    rm -f *.log
    rm -fr autom4te.*
    rm -f *_head.*
    rm -f *_tail.*
    rm -f *-*.c

}
function cb_clean_all()
{
    rm -f *.dll
}

function cb_test ()
{
        #$GOSH -I. test/test-demon.scm
    #$GOSH -I. test/test-nqueen.scm
    if [ ! -z "$CB_TEST_SCM" ]; then
        $GOSH -I.-I./lib $CB_TEST_SCM
    else
        for f in test/test*.scm; do
            $GOSH -I. -I.. -I./lib $f
        done
    fi 
}

function cb_libtest ()
{
    LANG=C g++ -o test/iz_gtest.exe test/iz_gtest.cpp -I. -L. -lmsgpack -lgtest
    ./test/iz_gtest.exe
    LANG=C g++ -g -o test/nqueen.exe test/nqueen.cpp -I. -L. -lmsgpack
#./test/nqueen.exe
}

while [ $# -gt 0 ]; do
    case "$1" in
        pgosh)
            shift
            export GDIST_DIR=/c/apps/Gauche-mingw-0.9-pthread
            ;;
        gosh)
            export GDIST_DIR=/c/apps/Gauche-mingw-0.9
            shift
            ;;
        -g|debug)
            shift
            CFLAGS="$CFLAGS -DHAVE_BOOL -DDEBUG"
            ;;
        -gf|debugfunc)
            shift
            CFLAGS="$CFLAGS -DHAVE_BOOL -DDEBUG -DDEBUG_FUNC"
            ;;
        -t|test)
            shift
            CB_TEST=1
            if [ ! -z "$1" ]; then
                if [ -f "$1" ]; then
                    # each
                    CB_TEST_SCM=$1
                    shift
                fi
            fi
            ;;
        -lt|libtest)
            shift
            CB_LIBTEST=1
            ;;
        -c|clean)
            shift
            CB_CLEAN=1
            if [ ! -z "$1" ]; then
                if [ "$1" = "all" ]; then
                    # each
                    CB_CLEAN_ALL=1
                    shift
                fi
            fi
            ;;
        -b|build)
            CB_BUILD=1
            shift
            if [ ! -z "$1" ]; then
                if [ -f "$1" ]; then
                    # stub
                    CB_BUILD_STUB=$1
                    shift
                fi
            fi
            ;;
        -E)
            CB_PREPROCESS=1
            shift
            if [ ! -z "$1" ]; then
                if [ -f "$1" ]; then
                    # each
                    CB_PREPROCESS_FILE=$1
                    shift
                fi
            fi
            ;;
        *)
            shift
            ;;
    esac
done


if [ $CB_PREPROCESS -eq 1 ]; then
    cb_preprocess $CB_PREPROCESS_FILE
fi
if [ $CB_BUILD -eq 1 ]; then
    cb_build
fi
if [ $CB_CLEAN -eq 1 ]; then
    cb_clean
fi
if [ $CB_CLEAN_ALL -eq 1 ]; then
    cb_clean_all
fi
if [ $CB_TEST -eq 1 ]; then
    cb_test
fi
if [ $CB_LIBTEST -eq 1 ]; then
    cb_libtest
fi
