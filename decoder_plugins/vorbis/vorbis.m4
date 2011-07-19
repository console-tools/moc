dnl vorbis

AC_ARG_WITH(vorbis, AS_HELP_STRING([--without-vorbis],
                                   [Compile without Ogg Vorbis support]))

if test "x$with_vorbis" != "xno"
then
	PKG_CHECK_MODULES(OGG_VORBIS,
			  [ogg >= 1.0 vorbis >= 1.0 vorbisfile >= 1.0],
			  [AC_SUBST(OGG_VORBIS_LIBS)
			  AC_SUBST(OGG_VORBIS_CFLAGS)
			  want_vorbis="yes"
			  DECODER_PLUGINS="$DECODER_PLUGINS vorbis"],
			  [true])
fi

AM_CONDITIONAL([BUILD_vorbis], [test "$want_vorbis"])
AC_CONFIG_FILES([decoder_plugins/vorbis/Makefile])
