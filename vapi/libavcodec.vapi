namespace LibAVCodec {
    [CCode (cname="LIBAVCODEC_VERSION_MAJOR", cheader_filename="libavcodec/version.h")]
    public const int LIBAVCODEC_VERSION_MAJOR;
    [CCode (cname="LIBAVCODEC_VERSION_MINOR", cheader_filename="libavcodec/version.h")]
    public const int LIBAVCODEC_VERSION_MINOR;
    [CCode (cname="LIBAVCODEC_VERSION_MICRO", cheader_filename="libavcodec/version.h")]
    public const int LIBAVCODEC_VERSION_MICRO;
    [CCode (cname="LIBAVCODEC_IDENT", cheader_filename="libavcodec/version.h")]
    public const string LIBAVCODEC_IDENT;
} // end LibAVCodec