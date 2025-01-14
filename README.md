# Corona Rate Me !
Asking rating to the app users made easy for games made with Corona SDK.

![alt tag](https://github.com/iranjith4/coronaRateMe/blob/dev_r/screenshot.png)

Made for Womi Studios, by Perk.com Inc.

##Currently Working on

* Making the App Icon Rounded Rectangle irrespective of the Original Image.

##How to Integrate
1. Download the repo, copy the `coronaRateMe` folder and paste at the root folder of your game where the `main.lua` is there.
2. In the `coronaRateMe/rateMeUtilities.lua`, add `appIconUrl`,`appStoreId`,`androidPackageName`.

```lua
local appIconUrl = "Icon-60.png"
local appStoreId = "id1025709661"
local androidPackageName = "com.womistudios.dashingdots.aphone"
```

Note : Currently working on the image to have rounded square by default. Until you can use the rounded rectangle image itself.

##How to Use

You can use either
  1. Automatic Rating Popup
  2. Custom Call Event

### 1. Automatic Rating Popup

When you choose to use the `Automatic Rating`, You just need to mention the place where you need the Popup. Rest will be taken care. By default, the popup will be up, when the user launches for 4th time. When the user selects `Remind Me Later`, it will be asked when the app is launched 8th time (frequency = 4).

In the `main.lua` add the following code

```lua
local rateMeUtilities = require "coronaRateMe.rateMeUtilities"
rateMeUtilities.appLaunch()
rateMeUtilities.automaticAlert(true)
```

Then, at the place where you want the Popup to be automatically showed, add these below code.

```lua
local rateMeUtilities = require "coronaRateMe.rateMeUtilities"

if rateMeUtilities.checkForAlert() then
    local options =
    {
      isModal = true,
      effect = "fade",
      time = 200,
      params = {
        text = "Would you like to rate the App ?",
      }
    }
  composer.showOverlay("coronaRateMe.rateMe",options)
end
```

NOTE : Please make sure `text` should be one line.

Best place to add the above code will be after the Game complete, or high score achieve.

Thats it !!

### 2. Custom Call Event
You can call custom call even when you want to show the popup anywhere.

In the `main.lua` add the following code

```lua
local rateMeUtilities = require "coronaRateMe.rateMeUtilities"
rateMeUtilities.appLaunch()
rateMeUtilities.automaticAlert(false)
```

At the place you want to show the Popup, you can check the status of the User's previous choice by using

```lua
local rateMeUtilities = require "coronaRateMe.rateMeUtilities"

local status = rateMeUtilities.getStatus()
```
Status Values :

  * `NONE` - When user have not interacted with the Popup
  * `NEVER` - User has selected "No Thanks"
  * `LATER` - User have chosen "Remind Me Later"
  * `RATED` - User have tapped "Rate Now"

Based on the status values, you can call the Popup

```lua

if status == "LATER" then
    local options =
    {
      isModal = true,
      effect = "fade",
      time = 200,
      params = {
        text = "Would you like to rate the App ?",
      }
    }
  composer.showOverlay("coronaRateMe.rateMe",options)
end
```

NOTE : Please make sure `text` should be one line.

Thats it for Custom call Event.

## Advanced Methods
* In Automatic Rating Popup, If you want to change the app launch count, where the initial popup need to be shown and `Remind Me Later` frequency, you can modify at `coronaRateMe/rateMeUtilities.lua` as

  ```lua
  local firstAlertAfter = 4
  local laterAlertAfter = 4
  ```

* For the Custom Call Event, you can get the App Launch count by using
  ```lua
  local launchCount = rateMeUtilities.getAppLaunchCount()
  ```

## Thanks
Thanks for using Corona Rate Me. Feel free to Fork, send Pull Request.
In case of any bugs, Please create issue [here.](https://github.com/iranjith4/coronaRateMe/issues)
