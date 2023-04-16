namespace LibAVUtil {
    [CCode (cheader_filename="libavutil/avutil.h")]
    namespace Avutil {
        [CCode (cname="avutil_version", cheader_filename="libavutil/avutil.h")]
        public int version ();
        [CCode (cname="av_version_info", cheader_filename="libavutil/avutil.h")]
        public string version_info ();
        [CCode (cname="avutil_configuration", cheader_filename="libavutil/avutil.h")]
        public string configuration ();
        [CCode (cname="avutil_license", cheader_filename="libavutil/avutil.h")]
        public string license ();

        [CCode (cname="AVMediaType", cprefix="", cheader_filename="libavutil/avutil.h")]
        public enum MediaType {
            AVMEDIA_TYPE_UNKNOWN,
            AVMEDIA_TYPE_VIDEO,
            AVMEDIA_TYPE_AUDIO,
            AVMEDIA_TYPE_DATA,
            AVMEDIA_TYPE_SUBTITLE,
            AVMEDIA_TYPE_ATTACHMENT;
        }
        [CCode (cname="av_get_media_type_string", cheader_filename="libavutil/avutil.h")]
        public string get_media_type (MediaType media_type);

        [CCode (cname="FF_LAMBDA_SHIFT", cheader_filename="libavutil/avutil.h")]
        public const int LAMBDA_SHIFT;
        [CCode (cname="FF_LAMBDA_SCALE", cheader_filename="libavutil/avutil.h")]
        public const int LAMBDA_SCALE;
        [CCode (cname="FF_QP2LAMBDA", cheader_filename="libavutil/avutil.h")]
        public const int QP2LAMBDA;
        [CCode (cname="FF_LAMBDA_MAX", cheader_filename="libavutil/avutil.h")]
        public const int LAMBDA_MAX;
        [CCode (cname="FF_QUALITY_SCALE", cheader_filename="libavutil/avutil.h")]
        public const int QUALITY_SCALE; // FIXME maybe remove
        [CCode (cname="AV_NOPTS_VALUE", cheader_filename="libavutil/avutil.h")]
        public const int64 NOPTS_VALUE;
        [CCode (cname="AV_TIME_BASE", cheader_filename="libavutil/avutil.h")]
        public const int TIME_BASE;

        [CCode (cprefix="", cheader_filename="libavutil/avutil.h")]
        public enum PictureType {
            AV_PICTURE_TYPE_NONE,
            AV_PICTURE_TYPE_I,
            AV_PICTURE_TYPE_P,
            AV_PICTURE_TYPE_B,
            AV_PICTURE_TYPE_S,
            AV_PICTURE_TYPE_SI,
            AV_PICTURE_TYPE_SP,
            AV_PICTURE_TYPE_BI
        }
        [CCode (cname="av_get_picture_type_char", cheader_filename="libavutil/avutil.h")]
        public char get_picture_type (PictureType pict_type);

        [CCode (cname="AV_FOURCC_MAX_STRING_SIZE", cheader_filename="libavutil/avutil.h")]
        public const int FOURCC_MAX_STRING_SIZE;

    } //end Avutil

    [CCode (cheader_filename="libavutil/cpu.h")]
    namespace Cpu {
        [Flags]
        [CCode (cprefix="AV_CPU_FLAG_", cheader_filename="libavutil/cpu.h")]
        public enum CPUCapabilityFlags {
            FORCE,
            MMX,
            MMXEXT,
            MMX2,
            SSE,
            SSE2,
            SSE2SLOW,
            3DNOWEXT,
            SSE3,
            SSE3SLOW,
            SSSE3,
            SSSE3SLOW,
            ATOM,
            SSE4,
            SSE42,
            AESNI,
            AVX,
            AVXSLOW,
            XOP,
            FMA4,
            CMOV,
            AVX2,
            FMA3,
            BMI1,
            BMI2,
            AVX512,
            ALTIVEC,
            VSX,
            POWER8,
            ARMV5TE,
            ARMV6,
            ARMV6T2,
            VFP,
            VFPV3,
            NEON,
            ARMV8,
            VFP_VM,
            SETEND
        }
        [CCode (cname="av_get_cpu_flags", cheader_filename="libavutil/cpu.h")]
        public int get_cpu_flags ();
        [CCode (cname="av_cpu_count", cheader_filename="libavutil/cpu.h")]
        public int cpu_count ();

    } //end Cpu
} //end LibAVUtil