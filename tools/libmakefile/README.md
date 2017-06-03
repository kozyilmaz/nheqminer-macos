makefile.lib
============

makefile helper library for basic management of source/target files

Overview
--------

you can have more than one target, just add targets as you wish. you can
share files among targets, files will be compiled for each target with
approtiate flags.

in addition targets may depend each other, so if your target depends on
target.so just add target.so to target's depend list with;

    target_depends-y = target.so

targets may also depend to the subdirectories, so target commands will
not be executed until subdirs commands get executed.

some usefull files are created in make process, for debugging and for speedup
 
    .target/*.dep              : includes depend information for the file
    .target/*.dep.cmd          : the command used for generating .dep file
    .target/*.o                : object for the file
    .target/*.o.cmd            : the command used for creating the object
    .target/target[a,so,o]     : the target
    .target/target[a,so,o].cmd : the command used for creating the target
    target                     : the target

Available Targets
-----------------

    target-[y,n, ]    : a binary target.
                        target will be created with $(CC) -o
    target.o-[y,n, ]  : an object target.
                        target.o will be created with $(LD) -r -o
    target.a-[y,n, ]  : a static library target.
                        target.a will be created with $(AR)
    target.so-[y,n, ] : a shared library target.
                        target.so will be created with $(CC) -o -shared

    target.host-[y,n, ]    : a binary target.
                             target will be created with $(HOSTCC) -o
    target.o.host-[y,n, ]  : an object target.
                             target.o will be created with $(HOSTLD) -r -o
    target.a.host-[y,n, ]  : a static library target.
                             target.a will be created with $(HOSTAR)
    target.so.host-[y,n, ] : a shared library target.
                             target.so will be created with $(HOSTCC) -o -shared

    subdir-[y,n, ] : subdirectory targets are executed with
                     $(subdir-y)_makeflags-y $(MAKE) -C $(subdir-y)

Available Target Flags
----------------------

    $(target)_makeflags-[y,n, ]        : makeflags for target  will be passed to make
                                         command only for corresponding target.
    $(target)_files-[y,n, ]            : files must match *.[cho] pattern. *.[ch] files
                                         will be exemined with $(CC) -M command to
                                         generate dependency files (*.dep) files. *.[o]
                                         files will be used only in linking stage. all
                                         files generated with make command will be
                                         removed with $(RM) command.
    $(target)_cflags-[y,n, ]           : cflags will be added to global $(CFLAGS) for
                                         corresponding target only.
    $(target)_cppflags-[y,n, ]         : cppflags will be added to global $(CPPFLAGS)
                                         for corresponding target only.
    $(target)_${file}_cflags-[y,n, ]   : cflags will be added to global $(CFLAGS) for
                                         corresponding target file only.
    $(target)_${file}_cppflags-[y,n, ] : cppflags will be added to global $(CPPFLAGS)
                                         for corresponding target file only.
    $(target)_includes-[y,n, ]         : a '-I' will be added to all words in includes
                                         flag, and will be used only for corresponding
                                         target.
    $(target)_libraries-[y,n, ]        : a '-L' will be added to all words in libraries
                                         flag, and will be used only for corresponding
                                         target.
    $(target)_ldflags-[y,n, ]          : ldflags will be added to gloabal $(LDFLAGS) for
                                         corresponding target only.
    $(target)_depends-[y,n, ]          : all words in depends flag will be added to
                                         prerequisite's list.

Usage
-----

you can check projects using libmakefile, for detailed information:

  - <a href="https://github.com/anhanguera/libhthread">libhthread</a>, <a href="http://alperakcan.net/projects/libhthread">libhthread</a> 
  - <a href="https://github.com/anhanguera/libhmemory">libhmemory</a>, <a href="http://alperakcan.net/projects/libhmemory">libhmemory</a> 
  - <a href="http://sf.net/projects/xynth">xynth</a>, <a href="http://alperakcan.net/projects/xynth">xynth</a>

Makefile Example using Makefile.lib

    target-y  = target1
    target-y += target2

    target1_files-y = \
        target_file_shared.c \
        target1_file_2.c \
        target1_file_3.c

    target1_includes-y = \
        ./ \
        /opt/include

    target1_libraries-y = \
        ./ \
        /opt/lib

    target1_cflags-y = \
        -DUSER_DEFINED \
        -O2

    target1_ldflags-y = \
        -luserdefined

    target2_files-y = \
        target_file_shared.c \
        target2_file_2.c \
        target2_file_3.c

    target2_includes-y = \
        ./ \
        /opt/include

    target2_libraries-y = \
        ./ \
        /opt/lib

    target2_cflags-y = \
        -DUSER_DEFINED \
        -O2

    target2_target2_file_2.c_cflags-y = \
        -DUSER_DEFINED_ONLY_FOR_TARGET2_FILE_2_C

    target2_ldflags-y = \
        -luserdefined

    include Makefile.lib
