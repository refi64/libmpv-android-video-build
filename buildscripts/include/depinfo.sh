#!/bin/bash -e

## Dependency versions

v_sdk=9123335_latest
v_ndk=25.2.9519653
v_sdk_build_tools=33.0.2

v_libass=0.17.4
v_harfbuzz=12.3.0
v_fribidi=1.0.16
v_freetype=2-14-1
v_mbedtls=3.6.5
v_dav1d=1.5.2
v_libxml2=2.15.1
v_ffmpeg=6.1.4
v_mpv=0.41.0
v_libogg=1.3.6
v_libvorbis=1.3.7
v_libvpx=1.15


## Dependency tree
# I would've used a dict but putting arrays in a dict is not a thing

dep_mbedtls=()
dep_dav1d=()
dep_libvorbis=(libogg)
if [ -n "$ENCODERS_GPL" ]; then
	dep_ffmpeg=(mbedtls dav1d libxml2 libvorbis libvpx libx264)
else
	dep_ffmpeg=(mbedtls dav1d libxml2)
fi
dep_freetype2=()
dep_fribidi=()
dep_harfbuzz=()
dep_libass=(freetype fribidi harfbuzz)
dep_lua=()
dep_shaderc=()
if [ -n "$ENCODERS_GPL" ]; then
	dep_mpv=(ffmpeg libass fftools_ffi)
else
	dep_mpv=(ffmpeg libass)
fi
