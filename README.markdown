# Rate Me Corona Plugin!
Derived from Ranjith's [Corona Rate Me](https://github.com/iranjith4/coronaRateMe/)
Current Version : 1.0

Asking rating to the app users made easy for games made with Corona SDK.

![alt tag](https://github.com/iranjith4/coronaRateMe/blob/dev_r/screenshot.png)

![alt tag](https://github.com/iranjith4/coronaRateMe/blob/dev_r/screenshot1.png)

Made for Womi Studios, by Perk.com Inc.

##How to Integrate

Note : Please use an image on minimum with 120 x 120 with corner Radius.

##How to Use

You can use either
  1. Automatic Rating Popup
  2. Custom Call Event

### 1. Automatic Rating Popup

When you choose to use the `Automatic Rating`, You just need to mention the place where you need the Popup. Rest will be taken care. By default, the popup will be up, when the user launches for 4th time. When the user selects `Remind Me Later`, it will be asked when the app is launched 8th time (frequency = 4).

In the `main.lua` add the following code

```lua
local rate_me = require "plugin.rate_me"
rate_me.init("AppName","icon.png","AppStoreId","AndroidPackageName")
rate_me.automaticAlert(true)
```

Then, at the place where you want the Popup to be automatically showed, add these below code.

```lua
rate_me.rateMe();
```
In the composer architecture, please add the above lines inside `function scene:show( event )` and the phase `did`

```lua
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
    if ( phase == "will" ) then
    elseif ( phase == "did" ) then
      -- Add the code here :D
    end
end
```

NOTE : Please make sure `text` should be one / two line. If you want to explicitly break the line use `\n`.

Best place to add the above code will be after the Game complete, or high score achieve.

Thats it !!

### 2. Custom Call Event
You can call custom call even when you want to show the popup anywhere.

In the `main.lua` add the following code

```lua
local rate_me = require "plugin.rate_me"
rate_me.init("AppName","icon.png","AppStoreId","AndroidPackageName")
rate_me.automaticAlert(false)
```

At the place you want to show the Popup, you can check the status of the User's previous choice by using

```lua
local status = rate_me.getStatus()
```
Status Values :

  * `NONE` - When user have not interacted with the Popup
  * `NEVER` - User has selected "No Thanks"
  * `LATER` - User have chosen "Remind Me Later"
  * `RATED` - User have tapped "Rate Now"

Based on the status values, you can call the Popup

```lua

if status == "LATER" then
    rate_me.rateMe();
end
```

NOTE : Please make sure `text` should be one line.

Thats it for Custom call Event.

## Advanced Methods
* In Automatic Rating Popup, If you want to change the app launch count, where the initial popup need to be shown and `Remind Me Later` frequency, you can modify as

  ```lua
  rate_me.setAlertInterval(first,after);
  ```

* For the Custom Call Event, you can get the App Launch count by using
  ```lua
  rate_me.getAppLaunchCount()
  ```


## Thanks

