namespace LibSWResample {
    [CCode (cname="LIBSWRESAMPLE_BUILD", cheader_filename="libswresample/version.h")]
	public const int LIBSWRESAMPLE_BUILD;
    [CCode (cname="LIBSWRESAMPLE_IDENT", cheader_filename="libswresample/version.h")]
	public const string LIBSWRESAMPLE_IDENT;

    [CCode (cname="swresample_version", cheader_filename="libswresample/swresample.h")]
    public int version ();
    [CCode (cname="swresample_configuration", cheader_filename="libswresample/swresample.h")]
    public string configuration ();
    [CCode (cname="swresample_license", cheader_filename="libswresample/swresample.h")]
    public string license ();
} // end LibSWResample