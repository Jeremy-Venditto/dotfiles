!!!! THIS DOCUMENTATION IS OUTDATED !!!!




Jerms build of awesome wm

-- Required Packages:
	(Arch Based)
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		awesome nitrogen compton light nm-applet cronie
		volumeicon xfce4-power-manager gnome-keyring

		apci (optional - for batteryarc widget)
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	(Debian Based)
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		 unknown
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Required Git Repo
	
	cd ~/.config

	git clone https://github.com/computerjerms/awesome


-- Optional Git Repos
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	  This repository has additional widgets
	and is where i copied most of the widgets
	in this config
	
	git clone https://github.com/streetturtle/awesome-wm-widgets
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	  This repository has my personal wallpaper collection
	if you so wish to use it.. mostly stolen from
	Derek Taylor from DistroTube

	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	


			Configuration:

-- Wallpaper

	This build uses nitrogen, a wallpaper setter.
	Please open nitrogen and configure your wallpaper folder.

	To get the wallpaper to change you will need to create a cron job

		-- Cron Job
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		Install cronie (or whatever you want)
	
		Terminal: 

		crontab -e (if it complains about vi then type
		export EDITOR=nano (or whatever your editor is)
		(to prevent this from happening ever again, add the command
		you just typed into the end of your ~/.baschrc file

		crontab -e

		/1 * * * * (export DISPLAY=:0.0 && /bin/date && /usr/bin/nitrogen --set-zoom-fill --random/$HOME/*pathtowallpaper*) >/tmp/myNitrogen.log 2>&1
	
		Save file - this will change the wallpaper every 1 minute
	
		sudo systemctl enable cronie
		sudo systemctl start cronie
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



-- Battery Icons
	
	There are 2 different battery options to choose from:

	1) xfce-4-power-manager
	2) battery-arc

		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		-- NOTE:

		The battery-arc widget does not work on my
		ARM based computer, there is some issue with
		acpi... if using ARM, you might want to use
		xfce4-power-manager
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	~ To get xfce4-power-manager battery to show in the system tray,
 	please open xfce4-power-manager-settings and configure the application
	(making sure to tick the "show in system tray" button

	~ To get the battery-arc icon to show in the system tray, open rc.lua
	in your editor of choice and uncomment 'batteryarc(),'


-- Gnome Keyring

	Required for keeping passwords saved such as WiFi, Nextcloud, Google Drive, etc.

	Feel free to use whatever keyring manager you prefer.

-- Volume Icon

	If you do not like the current volume icon that comes with this build:

		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		in rc.lua:

			comment out:

		--        volume_widget({
		--        color = '#009BFF'
		--}),


			uncomment:

		awful.spawn.with_shell=volume_icon
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Adding additional widgets

	Some widgets require you to add a line of code in one place of the
	rc.lua file, while others require you to add lines in multiple
	places.

	Some widget documentation can be quite difficult to dechiper,
	espeically if you are new to AwesomeWM or lua
	
	If you're trying to add your first widget, take a look in your
	~/.config/awesome folder and look at the batteryarc-widget

	cd batteryarc-widget 
	nano README
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		## Installation

		Clone repo, include widget and use it in **rc.lua**:

		```lua
		local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
		...
		s.mytasklist, -- Middle widget
        		{ -- Right widgets
        		layout = wibox.layout.fixed.horizontal,
                		...
	        	--[[default]]
        	        	batteryarc_widget(),
		        --[[or customized]]
        			batteryarc_widget({
	        	    show_current_level = true,
	        	    arc_thickness = 1,
		       	}),
        		}
			...
		```
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	Quite confusing, right?

	Find those lines in the rc.lua file

		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		all you need to add are...
		1) local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
		2) batteryarc_widget(),
	
			OR

		2) batteryarc_widget({
			show_current_level = true,
			arc_thickness -1,
		   }),   
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All widgets should be git cloned into ~/.config/awesome
