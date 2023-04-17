namespace LibAVUtil {
    [CCode (cheader_filename="libavutil/avutil.h")]
    namespace AVUtil {
        /***********************************************************
        @brief Return the LibAVUtil.Version.INT constant.
        ***********************************************************/
        [CCode (cname="avutil_version", cheader_filename="libavutil/avutil.h")]
        public int version ();
        /***********************************************************
        @brief Return an informative version string. This usually is the actual release
        version number or a git commit description. This string has no fixed format
        and can change any time. It should never be parsed by code.
        ***********************************************************/
        [CCode (cname="av_version_info", cheader_filename="libavutil/avutil.h")]
        public string* version_info ();
        /***********************************************************
        @brief Return the libavutil build-time configuration.
        ***********************************************************/
        [CCode (cname="avutil_configuration", cheader_filename="libavutil/avutil.h")]
        public string* configuration ();
        /***********************************************************
        @brief Return the libavutil license.
        ***********************************************************/
        [CCode (cname="avutil_license", cheader_filename="libavutil/avutil.h")]
        public string* license ();
        /***********************************************************
        @addtogroup lavu_media Media Type
        @brief Media Type
        ***********************************************************/
        [CCode (cname="AVMediaType", cprefix="", cheader_filename="libavutil/avutil.h")]
        public enum MediaType {
            AVMEDIA_TYPE_UNKNOWN,
            AVMEDIA_TYPE_VIDEO,
            AVMEDIA_TYPE_AUDIO,
            AVMEDIA_TYPE_DATA,
            AVMEDIA_TYPE_SUBTITLE,
            AVMEDIA_TYPE_ATTACHMENT;
        }
        /***********************************************************
        @brief Return a string describing the media_type enum, null if media_type
        is unknown.
        ***********************************************************/
        [CCode (cname="av_get_media_type_string", cheader_filename="libavutil/avutil.h")]
        public string* get_media_type (
            MediaType media_type
        );
        /***********************************************************
        @defgroup lavu_const Constants

        @defgroup lavu_enc Encoding specific

        @note those definition should move to avcodec
        ***********************************************************/
        [CCode (cname="FF_LAMBDA_SHIFT", cheader_filename="libavutil/avutil.h")]
        public const int LAMBDA_SHIFT;
        [CCode (cname="FF_LAMBDA_SCALE", cheader_filename="libavutil/avutil.h")]
        public const int LAMBDA_SCALE;
        /***********************************************************
        @brief Factor to convert from H.263 QP to lambda
        ***********************************************************/
        [CCode (cname="FF_QP2LAMBDA", cheader_filename="libavutil/avutil.h")]
        public const int QP2LAMBDA;
        [CCode (cname="FF_LAMBDA_MAX", cheader_filename="libavutil/avutil.h")]
        public const int LAMBDA_MAX;
        [CCode (cname="FF_QUALITY_SCALE", cheader_filename="libavutil/avutil.h")]
        public const int QUALITY_SCALE; // FIXME maybe remove
        /***********************************************************
        @defgroup lavu_time Timestamp specific

        FFmpeg internal timebase and timestamp definitions
        ***********************************************************/

        /***********************************************************
        @brief Undefined timestamp value

        Usually reported by demuxer that work on containers that do not provide
        either pts or dts.
        ***********************************************************/
        [CCode (cname="AV_NOPTS_VALUE", cheader_filename="libavutil/avutil.h")]
        public const int64 NOPTS_VALUE;
        [CCode (cname="AV_TIME_BASE", cheader_filename="libavutil/avutil.h")]
        public const int TIME_BASE;
        /***********************************************************
        @defgroup lavu_picture Image related

        AVPicture types, pixel formats and basic image planes manipulation.
        ***********************************************************/
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
        /***********************************************************
        @brief Return a single letter to describe the given picture type
        pict_type.

        @param[in] pict_type the picture type @return a single character
        representing the picture type, '?' if pict_type is unknown
        ***********************************************************/
        [CCode (cname="av_get_picture_type_char", cheader_filename="libavutil/avutil.h")]
        public char get_picture_type (
            PictureType pict_type
        );
        /***********************************************************
        @brief Fill the provided buffer with a string containing a FourCC (four-character
        code) representation.

        @param buffer a buffer with size in bytes of at least AV_FOURCC_MAX_STRING_SIZE
        @param fourcc the fourcc to represent
        @return the buffer in input
        ***********************************************************/
        [CCode (cname="AV_FOURCC_MAX_STRING_SIZE", cheader_filename="libavutil/avutil.h")]
        public const int FOURCC_MAX_STRING_SIZE;
        
        [CCode (cname="av_fourcc2str", cheader_filename="libavutil/avutil.h")]
        public string* fourcc2str (
            uint32 fourcc
        );
    } //end AVUtil

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