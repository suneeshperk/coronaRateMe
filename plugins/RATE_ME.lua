-- Created by Ranjithkumar Matheswaran on 20 Jan 2016
-- Modified by Suneesh Rajan on 28 March 2016
-- For Womi Studios by Perk.com
-- ╦ ╦╔═╗╔╦╗╦  ╔═╗╔╦╗╦ ╦╔╦╗╦╔═╗╔═╗
-- ║║║║ ║║║║║  ╚═╗ ║ ║ ║ ║║║║ ║╚═╗
-- ╚╩╝╚═╝╩ ╩╩  ╚═╝ ╩ ╚═╝═╩╝╩╚═╝╚═╝
local Library = require "CoronaLibrary"
local rateMeUtilities = require "plugin.RATE_ME.rateMeUtilities"
local composer = require "composer"

-- Create library
local lib = Library:new{ name='RATE_ME', publisherId='com.coronalabs' }

-------------------------------------------------------------------------------
-- BEGIN (Insert your implementation starting here)
-------------------------------------------------------------------------------
function showMe()
	local options =
        {
          isModal = true,
          effect = "fade",
          time = 200,
          params = {
            text = "Would you like to rate the App ?",
          }
        }
  	composer.showOverlay("plugin.RATE_ME.rateMe",options)
end

lib.automaticAlert = function (flag)
	rateMeUtilities.automaticAlert(flag)
end

lib.rateMe = function ()
	if rateMeUtilities.getAlertFlag() then
		if rateMeUtilities.checkForAlert() then
	        showMe()
	   	end
	else showMe() end

end

lib.init = function ( aN, aI, AS, AP)
	if aN == "" then aN = "App" end
	if aI == "" then aN = "plugin/RATE_ME/star.png" end
	rateMeUtilities.setAppName(aN);
	rateMeUtilities.setAppIconUrl(aI);
	rateMeUtilities.setAppStoreId(AS);
	rateMeUtilities.setAndroidPackageName(AP);
	rateMeUtilities.appLaunch()
end

lib.getStatus = function()
	return rateMeUtilities.getStatus()
end

lib.getAppLaunchCount = function ()
	return rateMeUtilities.getAppLaunchCount()
end

lib.setAlertInterval = function (first,later)
  rateMeUtilities.setAlertInterval(first,later)
end

-------------------------------------------------------------------------------
-- END
-------------------------------------------------------------------------------

-- Return library instance
return lib
