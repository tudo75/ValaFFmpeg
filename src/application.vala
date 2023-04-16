/* application.vala
 *
 * Copyright 2022-2023 Nicola tudo75 Tudino
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using LibAVUtil;
using LibSWResample;
using LibAVCodec;
using LibAVFormat;

namespace ValaFFmpeg {

    public static int main (string[] args) {
        new Application (args[0]);
        return 0;
    }

    public class Application : GLib.Object {

        private const string APP_NAME = "ValaFFMpeg";
        private const string VERSION = Constants.VERSION;
        private const string APP_ID = Constants.PROJECT_NAME;
        private const string APP_LANG_DOMAIN = Constants.GETTEXT_PACKAGE;
        private const string APP_INSTALL_PREFIX = Constants.PREFIX;

        public Application (string file) {
            /********
            LibAVUtil.Avutil
            *********/
            stdout.printf ("%s\n", "LibAVUtil.Avutil.version: " + LibAVUtil.Avutil.version ().to_string ());
            // return '4.4.2-0ubuntu0.22.04.1' and the 'double free or corruption (out)' error
            // stdout.printf ("%s\n", "LibAVUtil.Avutil.version_info: " + LibAVUtil.Avutil.version_info ());
            
            // return  
            // '--prefix=/usr --extra-version=0ubuntu0.22.04.1 --toolchain=hardened
            //  --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu 
            //  --arch=amd64 --enable-gpl --disable-stripping --enable-gnutls --enable-ladspa 
            //  --enable-libaom --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca 
            //  --enable-libcdio --enable-libcodec2 --enable-libdav1d --enable-libflite --enable-libfontconfig 
            //  --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libjack 
            //  --enable-libmp3lame --enable-libmysofa --enable-libopenjpeg --enable-libopenmpt --enable-libopus 
            //  --enable-libpulse --enable-librabbitmq --enable-librubberband --enable-libshine --enable-libsnappy 
            //  --enable-libsoxr --enable-libspeex --enable-libsrt --enable-libssh --enable-libtheora 
            //  --enable-libtwolame --enable-libvidstab --enable-libvorbis --enable-libvpx --enable-libwebp 
            //  --enable-libx265 --enable-libxml2 --enable-libxvid --enable-libzimg --enable-libzmq 
            //  --enable-libzvbi --enable-lv2 --enable-omx --enable-openal --enable-opencl --enable-opengl 
            //  --enable-sdl2 --enable-pocketsphinx --enable-librsvg --enable-libmfx --enable-libdc1394 
            //  --enable-libdrm --enable-libiec61883 --enable-chromaprint --enable-frei0r --enable-libx264 
            //  --enable-shared' and 'free(): invalid pointer' error
            // stdout.printf ("%s\n", LibAVUtil.Avutil.configuration ());

            // return 'GPL version 2 or later' and the 'free(): invalid pointer' error
            // stdout.printf ("%s\n", LibAVUtil.Avutil.license ());

            // return 'video' and 'munmap_chunk(): invalid pointer' error
            // stdout.printf ("%s\n", LibAVUtil.Avutil.get_media_type (LibAVUtil.Avutil.MediaType.AVMEDIA_TYPE_VIDEO));
            
            stdout.printf ("%s\n", "LibAVUtil.Avutil.LAMBDA_SHIFT: " + LibAVUtil.Avutil.LAMBDA_SHIFT.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.LAMBDA_SCALE: " + LibAVUtil.Avutil.LAMBDA_SCALE.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.QP2LAMBDA: " + LibAVUtil.Avutil.QP2LAMBDA.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.LAMBDA_MAX: " + LibAVUtil.Avutil.LAMBDA_MAX.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.QUALITY_SCALE: " + LibAVUtil.Avutil.QUALITY_SCALE.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.NOPTS_VALUE: " + LibAVUtil.Avutil.NOPTS_VALUE.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.TIME_BASE: " + LibAVUtil.Avutil.TIME_BASE.to_string ());

            stdout.printf ("%s\n", "LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_B): " 
                                + LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_B).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_BI): " 
                                + LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_BI).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_I): " 
                                + LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_I).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_NONE): " 
                                + LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_NONE).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_P): " 
                                + LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_P).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_S): " 
                                + LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_S).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_SI): " 
                                + LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_SI).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_SP): " 
                                + LibAVUtil.Avutil.get_picture_type (LibAVUtil.Avutil.PictureType.AV_PICTURE_TYPE_SP).to_string ());

            stdout.printf ("%s\n", "LibAVUtil.Avutil.FOURCC_MAX_STRING_SIZE: " + LibAVUtil.Avutil.FOURCC_MAX_STRING_SIZE.to_string ());

            /********
            LibAVUtil.Cpu
            *********/
            stdout.printf ("%s", "LibAVUtil.Cpu.CPUCapabilityFlags: ");
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.3DNOWEXT);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.AESNI);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.ALTIVEC);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.ARMV5TE);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.ARMV6);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.ARMV6T2);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.ARMV8);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.ATOM);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.AVX);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.AVX2);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.AVX512);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.AVXSLOW);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.BMI1);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.BMI2);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.CMOV);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.FMA3);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.FMA4);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.FORCE);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.MMX);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.MMX2);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.MMXEXT);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.NEON);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.POWER8);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SETEND);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SSE);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SSE2);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SSE2SLOW);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SSE3);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SSE3SLOW);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SSE4);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SSE42);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SSSE3);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.SSSE3SLOW);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.VFP);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.VFP_VM);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.VFPV3);
            stdout.printf ("%d ", LibAVUtil.Cpu.CPUCapabilityFlags.VSX);
            stdout.printf ("%d\n", LibAVUtil.Cpu.CPUCapabilityFlags.XOP);
            stdout.printf ("%s\n", "LibAVUtil.Cpu.get_cpu_flags: " + LibAVUtil.Cpu.get_cpu_flags ().to_string ());
            stdout.printf ("%s\n", "LibAVUtil.Cpu.cpu_count: " + LibAVUtil.Cpu.cpu_count ().to_string ());


            /********
            LibSWResample
            *********/
            stdout.printf ("%s\n", "LibSWResample.LIBSWRESAMPLE_BUILD: " + LibSWResample.LIBSWRESAMPLE_BUILD.to_string ());
            stdout.printf ("%s\n", "LibSWResample.LIBSWRESAMPLE_IDENT: " + LibSWResample.LIBSWRESAMPLE_IDENT);

            stdout.printf ("%s\n", "LibSWResample.version (): " + LibSWResample.version ().to_string ());
            //stdout.printf ("%s\n", "LibSWResample.configuration (): " + LibSWResample.configuration ());
            //stdout.printf ("%s\n", "LibSWResample.license (): " + LibSWResample.license ());

            /********
            LibAVCodec
            *********/
            stdout.printf ("%s\n", "LibAVCodec.LIBAVCODEC_IDENT: " + LibAVCodec.LIBAVCODEC_IDENT);
            stdout.printf ("%s\n", "LibAVCodec.LIBAVCODEC_VERSION_MAJOR: " + LibAVCodec.LIBAVCODEC_VERSION_MAJOR.to_string ());
            stdout.printf ("%s\n", "LibAVCodec.LIBAVCODEC_VERSION_MINOR: " + LibAVCodec.LIBAVCODEC_VERSION_MINOR.to_string ());
            stdout.printf ("%s\n", "LibAVCodec.LIBAVCODEC_VERSION_MICRO: " + LibAVCodec.LIBAVCODEC_VERSION_MICRO.to_string ());

            /********
            LibAVCodec
            *********/
            stdout.printf ("%s\n", "LibAVFormat.LIBAVFORMAT_IDENT: " + LibAVFormat.LIBAVFORMAT_IDENT);
            stdout.printf ("%s\n", "LibAVFormat.LIBAVFORMAT_VERSION_MAJOR: " + LibAVFormat.LIBAVFORMAT_VERSION_MAJOR.to_string ());
            stdout.printf ("%s\n", "LibAVFormat.LIBAVFORMAT_VERSION_MINOR: " + LibAVFormat.LIBAVFORMAT_VERSION_MINOR.to_string ());
            stdout.printf ("%s\n", "LibAVFormat.LIBAVFORMAT_VERSION_MICRO: " + LibAVFormat.LIBAVFORMAT_VERSION_MICRO.to_string ());
        }
    }
}
