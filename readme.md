# Aggro! (tank computers)

TODO Stellaris 1.8 adds has_component, so update the event file with this.

# Steam description

[//]: # (start)
Steam description transliterated from `steam.bbcode` by [our release script](https://raw.githubusercontent.com/stellaris-mods/scripts/master/stlrel).

## **Want your ships to charge forward with a complete disregard for health or safety? Then you've come to the right place\.**

This mods adds 3 combat computers that unlock along with the standard ones in the game (level 1, 2, and sentient, but nothing for precog yet)\.

The computers change the behavior of the ships in several ways; depending on ship type\.

* Increase maintenance cost
* Increase combat speed to match Corvettes (with thrusters level 4 and 0 boosters equipped)
* Increased hullpoints, shields, evasion, and armor
* Adds hull regen % (like the military station aura)


And many other tweaks individually per ship type\.
The tank computers are designed such that a ship equipped with a level 3 computer will survive indefinitely against 3 non\-tank versions of the same ship type\.
But it will die vs 4 of them\. This has not been re\-tested for 1\.3\.2, yet\.

This scales up to fleet level, so if your fleet has 1x Tank Battleship, and the enemy has 3x artillery/tachyon/arc emitter XL Battleships (for example), you should eventually win\. Provided the rest of your fleet composition within a few thousand power points of the enemy fleet\.

Tank ships are not affected by friendly auras from Stellaris vanilla, from either military stations, or if they add them back to ships in some form\. Friendly auras from 3rd party addons will affect them\.

The computers also change the ship behavior, so that it will actually charge in to a minimum distance\. Ships equipped with these computers will charge directly at enemy fleets, disregarding collisions and kill anything they find\.
Please be aware that the ship armor bonus is a percentage bonus of the ships base armor plus any equipped armor\. Also note that any ship can not have more than 90% total damage reduction from armor, so tweak your designs accordingly\.

Try to keep the number of tanking ships at a minimum, because their brains are not equipped for strategic target choices for their weapons output\. Not to mention the upkeep cost is horrible ;\-)
Rebuild often\!

These computers are only available for Destroyer and bigger, not Corvette\.

Support for ships from [Realistic Ships](http://steamcommunity\.com/sharedfiles/filedetails/?id=725596168) and [NSC](https://steamcommunity\.com/sharedfiles/filedetails/?id=683230077) is built in\. To my amazement, ISBS basically has tanking\-computers already :\-P

## AI Empires
Standard AI empires will sometimes construct Destroyers, Cruisers, or Battleships with tanking computers in them\.
I'm not sure how well this is tuned at the moment\. I have ran games into year 2400, and seen the AI build them, but I don't know the ratio to normal ships\.

Basically Paradox doesn't want us modders to be able to control the AI like I have done here\.

So, for anyone curious, or anyone who wants to get technical, here's how it works:

1. If they have the tech for tank computers \+ Destroyer
1. Every month, there is a 10% chance that an AI empire will produce ships with this computer
1. Usage priority of tank computers is set to a higher number than standard computers for this empire
1. They are forced to auto\-update their auto\-ship\-designs (which selects components based on said priority)
1. They are forced to produce at least one ship, either Destroyer, Cruiser, or Battleship, with the computer\.



For any modders, I've done a [more detailed writeup\.](https://forum\.paradoxplaza\.com/forum/index\.php?threads/how\-to\-make\-the\-ai\-use\-a\-specific\-ship\-component\.978013/) Also, I've [documented the ship behavior](http://www\.stellariswiki\.com/Ship\_modding) coding to a large degree\.

## Got some feedback?
I really want some feedback on this right now, there's many of the values that probably need loads of tuning\.
Mostly I'm not sure about the shield regen, hull regen and combat speed\.
The behavior works fine, so the ships do charge, and all the regen works \- I just think perhaps the amount of regen needs to be adjusted\.
There's also quite a steep power draw from the combat computers, but I use this mod along with my other mod, ["Ship Power Stations"](https://steamcommunity\.com/sharedfiles/filedetails/?id=776095610) (obviously hehe)\.

Please let me know what you think\!
**If anyone can help me make some better ingame icons, then please contact me :\-)**

## Please check out my other addons\!
[![](http://i\.imgur\.com/XLkY9rP\.png)](http://steamcommunity\.com/sharedfiles/filedetails/?id=786514324) [![](http://i\.imgur\.com/HB3mzUd\.png)](http://steamcommunity\.com/sharedfiles/filedetails/?id=790840932)
[![](http://i\.imgur\.com/QbwKam7\.png)](http://steamcommunity\.com/sharedfiles/filedetails/?id=787280885) [![](http://i\.imgur\.com/Qowgmu2\.png)](http://steamcommunity\.com/sharedfiles/filedetails/?id=785719197)
[![](http://i\.imgur\.com/557d0qz\.png)](http://steamcommunity\.com/sharedfiles/filedetails/?id=776095610) [![](http://i\.imgur\.com/c85HK9A\.png)](http://steamcommunity\.com/sharedfiles/filedetails/?id=785582857)
[![](http://i\.imgur\.com/hGJdX51\.png)](http://steamcommunity\.com/sharedfiles/filedetails/?id=779729987) [![](http://i\.imgur\.com/HmbP3Gd\.png)](http://steamcommunity\.com/sharedfiles/filedetails/?id=796214744)
[![](http://i\.imgur\.com/IVM6B6g\.png)](http://steamcommunity\.com/sharedfiles/filedetails/?id=799159083)
[And many others :\-)](http://steamcommunity\.com/workshop/filedetails/?id=779739023)

[//]: # (stop)
