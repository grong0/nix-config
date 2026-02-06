{ ... }: {
	services.mako = {
		enable = true;
		settings = {
			anchor = "top-center";
			default-timeout = 5000;
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
