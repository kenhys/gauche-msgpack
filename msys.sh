#!/bin/bash
# -*- coding: utf-8-unix -*-

GDIST_DIR=/c/gauche
GOSH=gosh

GDIST_INCDIR=$GDIST_DIR/lib/gauche-0.9/0.9.1_pre1/include
GDIST_LIBDIR=$GDIST_DIR/bin
GAUCHE_CONFIG=$GDIST_DIR/bin/gauche-config
GENSTUB=$GDIST_DIR/share/gauche/0.9.1_pre1/lib/genstub
export PATH=$GDIST_DIR:$PATH

CB_BUILD=0
CB_CLEAN=0
CB_TEST=0
CB_TEST_SCM=""
CB_LIBTEST=0

MSGPACK_INC=""
MSGPACK_LIB="-lmsgpack -lmsgpackc"

CFLAGS="-DHAVE_BOOL "


function cb_build ()
{
    mkdir -p log
    $GAUCHE_CONFIG --fixup-extension msgpacklib msgpack
    $GOSH $GENSTUB msgpacklib.stub
    if [ $? -ne 0 ]; then
        exit
    fi
    com="gcc -c msgpacklib_head.c -I$GDIST_INCDIR"
    echo $com
    eval $com
    if [ $? -ne 0 ]; then
        exit
    fi
    com="gcc -c msgpacklib_tail.c -I$GDIST_INCDIR"
    echo $com
    eval $com
    if [ $? -ne 0 ]; then
        exit
    fi
    com="LANG=C gcc -c msgpacklib.c -I$GDIST_INCDIR $CFLAGS 2>&1 | tee log/msgpacklib.c.log"
    echo $com
    eval $com
    if [ $? -ne 0 ]; then
        exit
    fi
    com="LANG=C gcc -c msgpack.c -I$GDIST_INCDIR $CFLAGS 2>&1 | tee log/msgpack.c.log"
    echo $com
    eval $com
    if [ $? -ne 0 ]; then
        exit
    fi
    com="LANG=C gcc -lmingw32 `gauche-config --dylib-ldflags` msgpack.dll *.o  -L. $MSGPACK_LIB -L$GDIST_LIBDIR -lgauche-0.9"
    echo $com
    eval $com
    if [ $? -ne 0 ]; then
        exit
    fi
}

function cb_clean ()
{

    rm -f *.o
    rm -f msgpacklib.c
    rm -f config.status
    rm -f configure
    rm -f *.exe
    rm -f msgpack.dll
    rm -f *.log
    rm -fr autom4te.*
    rm -f *_head.*
    rm -f *_tail.*

}

function cb_test ()
{
        #$GOSH -I. test/test-demon.scm
    #$GOSH -I. test/test-nqueen.scm
    if [ ! -z "$CB_TEST_SCM" ]; then
        $GOSH -I. $CB_TEST_SCM
    else
        $GOSH -I. test/test-in.scm
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
            ;;
        -b|build)
            CB_BUILD=1
            shift
            ;;
        *)
            shift
            ;;
    esac
done


if [ $CB_BUILD -eq 1 ]; then
    cb_build
fi
if [ $CB_CLEAN -eq 1 ]; then
    cb_clean
fi
if [ $CB_TEST -eq 1 ]; then
    cb_test
fi
if [ $CB_LIBTEST -eq 1 ]; then
    cb_libtest
fi
