{
	lib,
	appimageTools,
	fetchurl,
}:

let
	version = "0.8.5";
	pname = "winboat";

	src = fetchurl {
		url = "https://github.com/TibixDev/winboat/releases/download/v${version}/winboat-${version}-x86_64.AppImage ";
		hash = "";
	};

	appimageContents = appimageTools.extractType1 { inherit pname src; };
in
appimageTools.wrapType2 rec {
	inherit pname version src;

	extraInstallCommands = ''
		substituteInPlace $out/share/applications/${pname}.desktop \
		--replace-fail 'Exec=AppRun' 'Exec=${meta.mainProgram}'
	'';

	meta = {
		description = "Run Windows apps on Linux with seamless integration ";
		homepage = "www.winboat.app";
		downloadPage = "https://github.com/TibixDev/winboat/releases";
		license = lib.licenses.mit;
		sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
		platforms = [ "x86_64-linux" ];
	};
}
