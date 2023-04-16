namespace LibAVFormat {
    [CCode (cname="LIBAVFORMAT_VERSION_MAJOR", cheader_filename="libavformat/version.h")]
    public const int LIBAVFORMAT_VERSION_MAJOR;
    [CCode (cname="LIBAVFORMAT_VERSION_MINOR", cheader_filename="libavformat/version.h")]
    public const int LIBAVFORMAT_VERSION_MINOR;
    [CCode (cname="LIBAVFORMAT_VERSION_MICRO", cheader_filename="libavformat/version.h")]
    public const int LIBAVFORMAT_VERSION_MICRO;
    [CCode (cname="LIBAVFORMAT_IDENT", cheader_filename="libavformat/version.h")]
    public const string LIBAVFORMAT_IDENT;
} // end LibAVFormat