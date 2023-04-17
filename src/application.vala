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
            LibAVUtil.AVUtil
            *********/
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.version: " + LibAVUtil.AVUtil.version ().to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.version_info: " + LibAVUtil.AVUtil.version_info ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.configuration: " + LibAVUtil.AVUtil.configuration ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.license: " + LibAVUtil.AVUtil.license ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_ATTACHMENT): " 
                                + LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_ATTACHMENT));
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_AUDIO): " 
                                + LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_AUDIO));
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_DATA): " 
                                + LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_DATA));
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_SUBTITLE): " 
                                + LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_SUBTITLE));
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_UNKNOWN): " 
                                + LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_UNKNOWN));
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_VIDEO): " 
                                + LibAVUtil.AVUtil.get_media_type (LibAVUtil.AVUtil.MediaType.AVMEDIA_TYPE_VIDEO));
            
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.LAMBDA_SHIFT: " + LibAVUtil.AVUtil.LAMBDA_SHIFT.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.LAMBDA_SCALE: " + LibAVUtil.AVUtil.LAMBDA_SCALE.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.QP2LAMBDA: " + LibAVUtil.AVUtil.QP2LAMBDA.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.LAMBDA_MAX: " + LibAVUtil.AVUtil.LAMBDA_MAX.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.QUALITY_SCALE: " + LibAVUtil.AVUtil.QUALITY_SCALE.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.NOPTS_VALUE: " + LibAVUtil.AVUtil.NOPTS_VALUE.to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.TIME_BASE: " + LibAVUtil.AVUtil.TIME_BASE.to_string ());

            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_B): " 
                                + LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_B).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_BI): " 
                                + LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_BI).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_I): " 
                                + LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_I).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_NONE): " 
                                + LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_NONE).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_P): " 
                                + LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_P).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_S): " 
                                + LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_S).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_SI): " 
                                + LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_SI).to_string ());
            stdout.printf ("%s\n", "LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_SP): " 
                                + LibAVUtil.AVUtil.get_picture_type (LibAVUtil.AVUtil.PictureType.AV_PICTURE_TYPE_SP).to_string ());

            stdout.printf ("%s\n", "LibAVUtil.AVUtil.FOURCC_MAX_STRING_SIZE: " + LibAVUtil.AVUtil.FOURCC_MAX_STRING_SIZE.to_string ());

            stdout.printf ("%s\n", "");
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

            stdout.printf ("%s\n", "");
            /********
            LibSWResample
            *********/
            stdout.printf ("%s\n", "LibSWResample.LIBSWRESAMPLE_BUILD: " + LibSWResample.LIBSWRESAMPLE_BUILD.to_string ());
            stdout.printf ("%s\n", "LibSWResample.LIBSWRESAMPLE_IDENT: " + LibSWResample.LIBSWRESAMPLE_IDENT);

            stdout.printf ("%s\n", "LibSWResample.version (): " + LibSWResample.version ().to_string ());
            //stdout.printf ("%s\n", "LibSWResample.configuration (): " + LibSWResample.configuration ());
            //stdout.printf ("%s\n", "LibSWResample.license (): " + LibSWResample.license ());

            stdout.printf ("%s\n", "");
            /********
            LibAVCodec
            *********/
            stdout.printf ("%s\n", "LibAVCodec.LIBAVCODEC_IDENT: " + LibAVCodec.LIBAVCODEC_IDENT);
            stdout.printf ("%s\n", "LibAVCodec.LIBAVCODEC_VERSION_MAJOR: " + LibAVCodec.LIBAVCODEC_VERSION_MAJOR.to_string ());
            stdout.printf ("%s\n", "LibAVCodec.LIBAVCODEC_VERSION_MINOR: " + LibAVCodec.LIBAVCODEC_VERSION_MINOR.to_string ());
            stdout.printf ("%s\n", "LibAVCodec.LIBAVCODEC_VERSION_MICRO: " + LibAVCodec.LIBAVCODEC_VERSION_MICRO.to_string ());

            stdout.printf ("%s\n", "");
            /********
            LibAVFormat
            *********/
            stdout.printf ("%s\n", "LibAVFormat.LIBAVFORMAT_IDENT: " + LibAVFormat.LIBAVFORMAT_IDENT);
            stdout.printf ("%s\n", "LibAVFormat.LIBAVFORMAT_VERSION_MAJOR: " + LibAVFormat.LIBAVFORMAT_VERSION_MAJOR.to_string ());
            stdout.printf ("%s\n", "LibAVFormat.LIBAVFORMAT_VERSION_MINOR: " + LibAVFormat.LIBAVFORMAT_VERSION_MINOR.to_string ());
            stdout.printf ("%s\n", "LibAVFormat.LIBAVFORMAT_VERSION_MICRO: " + LibAVFormat.LIBAVFORMAT_VERSION_MICRO.to_string ());
            stdout.printf ("%s\n", "LibAVFormat.AVIO_SEEKABLE_NORMAL: " + LibAVFormat.AVIO_SEEKABLE_NORMAL.to_string ());
            stdout.printf ("%s\n", "LibAVFormat.AVIO_SEEKABLE_TIME: " + LibAVFormat.AVIO_SEEKABLE_TIME.to_string ());
        }
    }
}
