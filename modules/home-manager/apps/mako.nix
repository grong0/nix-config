{ ... }: {
	services.mako = {
		enable = true;
		anchor = "top-center";
		defaultTimeout = 5000;
		extraConfig = ''
# [urgency=high]
# default-timeout=0

[category=mpd]
default-timeout=2000
group-by=category
'';
	};
}
