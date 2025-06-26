{ ... }: {
	services.mako = {
		enable = true;
		anchor = "top-center";
		defaultTimeout = 5000;
		settings = {
			"urgency=high" = {
				"default-timeout" = 0;
			};
			"category=mpd" = {
				"default-timeout" = 2000;
				"group-by" = "category";
			};
		};
		# extraConfig = ''
		# 	# [urgency=high]
		# 	# default-timeout=0

		# 	[category=mpd]
		# 	default-timeout=2000
		# 	group-by=category
		# '';
	};
}
