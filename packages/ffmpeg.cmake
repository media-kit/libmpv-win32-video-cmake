ExternalProject_Add(ffmpeg
    DEPENDS
        amf-headers
        ${nvcodec_headers}
        bzip2
        lcms2
        openssl
        libssh
        libsrt
        libass
        libmodplug
        libpng
        ${ffmpeg_soxr_dependency}
        libbs2b
        libwebp
        libzimg
        libmysofa
        fontconfig
        harfbuzz
        opus
        speex
        vorbis
        libxml2
        libvpl
        libjxl
        dav1d
        openal-soft
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !tests/ref/fate"
    UPDATE_COMMAND ""
    GIT_TAG n9.0.2
    CONFIGURE_COMMAND ${EXEC} CONF=1 <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --pkg-config-flags=--static
        --enable-cross-compile
        --disable-gpl
        --disable-nonfree
        --enable-version3
        --enable-static
        --disable-shared
        --disable-iconv
        --enable-stripping

        --disable-muxers
        --disable-decoders
        --disable-encoders
        --disable-demuxers
        --disable-parsers
        --disable-protocols
        --disable-filters
        --disable-doc
        --disable-programs
        --disable-gray
        --disable-swscale-alpha
        --enable-bsfs

        --disable-amf
        --disable-cuda
        --disable-nvdec
        --disable-nvenc
        --disable-cuvid
        --enable-d3d11va
        --enable-dxva2
        --disable-libmfx

        --disable-alsa
        --disable-bzlib
        --disable-ffnvcodec
        --disable-libdrm
        --disable-libuavs3d
        --disable-linux-perf
        --disable-sndio
        --disable-v4l2-m2m
        --disable-vaapi
        --disable-vdpau
        --disable-videotoolbox
        --disable-audiotoolbox
        --disable-xlib

        --disable-bsf=eac3_core
        --disable-bsf=mjpeg2jpeg
        --disable-bsf=mjpega_dump_header
        --disable-bsf=mov2textsub
        --disable-bsf=text2movsub

        --enable-small
        --enable-hwaccels
        --enable-optimizations
        --enable-runtime-cpudetect

        --enable-openssl
        --enable-libssh
        --enable-libsrt
        --enable-libbs2b
        --enable-libdav1d
        --enable-libjxl
        --enable-libmysofa
        --enable-libspeex
        --enable-libvpl
        --enable-libwebp
        --enable-libxml2
        --enable-libzimg
        --disable-vulkan

        --enable-avutil
        --enable-avcodec
        --enable-avfilter
        --enable-avformat
        --enable-avdevice
        --enable-swscale
        --enable-swresample

        --enable-decoder=flv
        --enable-decoder=h263
        --enable-decoder=h263i
        --enable-decoder=h263p
        --enable-decoder=h264*
        --enable-decoder=mpeg1video
        --enable-decoder=mpeg2*
        --enable-decoder=mpeg4*
        --enable-decoder=vp6
        --enable-decoder=vp6a
        --enable-decoder=vp6f
        --enable-decoder=vp8*
        --enable-decoder=vp9*
        --enable-decoder=hevc*
        --enable-decoder=av1*
        --enable-decoder=libdav1d
        --enable-decoder=theora
        --enable-decoder=msmpeg*
        --enable-decoder=vc1*
        --enable-decoder=wmv*

        --enable-decoder=aac*
        --enable-decoder=ac3
        --enable-decoder=alac
        --enable-decoder=als
        --enable-decoder=ape
        --enable-decoder=atrac*
        --enable-decoder=eac3
        --enable-decoder=flac
        --enable-decoder=gsm*
        --enable-decoder=mp1*
        --enable-decoder=mp2*
        --enable-decoder=mp3*
        --enable-decoder=mpc*
        --enable-decoder=opus
        --enable-decoder=ra*
        --enable-decoder=ralf
        --enable-decoder=shorten
        --enable-decoder=tak
        --enable-decoder=tta
        --enable-decoder=vorbis
        --enable-decoder=wavpack
        --enable-decoder=wma*
        --enable-decoder=pcm*
        --enable-decoder=dsd*
        --enable-decoder=dca
        --enable-decoder=truehd

        --enable-decoder=ssa
        --enable-decoder=ass
        --enable-decoder=dvbsub
        --enable-decoder=dvdsub
        --enable-decoder=srt
        --enable-decoder=stl
        --enable-decoder=subrip
        --enable-decoder=subviewer
        --enable-decoder=subviewer1
        --enable-decoder=text
        --enable-decoder=vplayer
        --enable-decoder=webvtt
        --enable-decoder=movtext

        --enable-decoder=mjpeg*
        --enable-decoder=jpegls
        --enable-decoder=jpeg2000
        --enable-decoder=png
        --enable-decoder=gif
        --enable-decoder=bmp
        --enable-decoder=tiff
        --enable-decoder=webp

        --enable-demuxer=concat
        --enable-demuxer=data
        --enable-demuxer=hls
        --enable-demuxer=image_gif_pipe
        --enable-demuxer=image_png_pipe
        --enable-demuxer=live_flv
        --enable-demuxer=loas
        --enable-demuxer=mpegps
        --enable-demuxer=mpegts
        --enable-demuxer=mpegvideo
        --enable-demuxer=hevc
        --enable-demuxer=rtsp
        --enable-demuxer=mjpeg*
        --enable-demuxer=av1
        --enable-demuxer=dash
        --enable-demuxer=webm_dash_manifest

        --enable-demuxer=aac
        --enable-demuxer=ac3
        --enable-demuxer=aiff
        --enable-demuxer=ape
        --enable-demuxer=asf
        --enable-demuxer=au
        --enable-demuxer=avi
        --enable-demuxer=flac
        --enable-demuxer=flv
        --enable-demuxer=matroska
        --enable-demuxer=mov
        --enable-demuxer=m4v
        --enable-demuxer=mp3
        --enable-demuxer=mpc*
        --enable-demuxer=ogg
        --enable-demuxer=pcm*
        --enable-demuxer=rm
        --enable-demuxer=shorten
        --enable-demuxer=tak
        --enable-demuxer=tta
        --enable-demuxer=wav
        --enable-demuxer=wv
        --enable-demuxer=xwma
        --enable-demuxer=dsf
        --enable-demuxer=dts
        --enable-demuxer=truehd
        --enable-demuxer=dtshd

        --enable-demuxer=ass
        --enable-demuxer=srt
        --enable-demuxer=stl
        --enable-demuxer=webvtt
        --enable-demuxer=subviewer
        --enable-demuxer=subviewer1
        --enable-demuxer=vplayer

        --enable-parser=h263
        --enable-parser=h264
        --enable-parser=hevc
        --enable-parser=mpeg4video
        --enable-parser=mpegvideo
        --enable-parser=vc1

        --enable-parser=aac*
        --enable-parser=ac3
        --enable-parser=cook
        --enable-parser=flac
        --enable-parser=gsm
        --enable-parser=mpegaudio
        --enable-parser=tak
        --enable-parser=vorbis
        --enable-parser=dca

        --enable-filter=overlay
        --enable-filter=equalizer
        --enable-filter=rotate
        --enable-filter=vflip

        --enable-protocol=async
        --enable-protocol=cache
        --enable-protocol=crypto
        --enable-protocol=data
        --enable-protocol=ffrtmphttp
        --enable-protocol=file
        --enable-protocol=ftp
        --enable-protocol=http
        --enable-protocol=httpproxy
        --enable-protocol=https
        --enable-protocol=pipe
        --enable-protocol=rtmp
        --enable-protocol=rtmps
        --enable-protocol=rtmpt
        --enable-protocol=rtmpts
        --enable-protocol=rtp
        --enable-protocol=subfile
        --enable-protocol=tcp
        --enable-protocol=tls
        --enable-protocol=libsrt
        --enable-protocol=udp

        --enable-encoder=mjpeg
        --enable-encoder=ljpeg
        --enable-encoder=jpegls
        --enable-encoder=jpeg2000
        --enable-encoder=png

        --enable-network
        ${ffmpeg_cuda}
        ${ffmpeg_lto}
        --extra-cflags='-Wno-error=int-conversion'
        "--extra-libs='${ffmpeg_extra_libs}'" # -lstdc++ / -lc++ is needed by libjxl
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)
