 INCLUDE globals.ink
 EXTERNAL giveItem(itemName)
 
{ item_curtains == 0: -> main | -> got_curtains}

=== main ===
What do you want? #speaker:Gabe #portrait:Gabe #layout:Right
Why are you so grumpy? #speaker:Jack #portrait:Jack #layout:Left
Because I don't have any curtains at my window to block all this light #speaker:Gabe #portrait:Gabe #layout:Right
Now leave me alone!
-> END

=== got_curtains ===
{ item_curtains == 2: -> already_done | -> got_curtains_real}
-> END

=== got_curtains_real ===
What do you want? #speaker:Gabe #portrait:Gabe #layout:Right
I know you don't like the light so I brought you some curtains to put at your window. #speaker:Jack #portrait:Jack #layout:Left
Thanks, I will install them right away. #speaker:Gabe #portrait:Gabe #layout:Right
Here take this hat to protect you from this damn hot light.
Maybe you will be cooler with this for the girls. Hehe.
~ item_curtains = 2
~ item_hat = 1
~ giveItem("hat")
-> END

=== already_done ===
This damn light... #speaker:Gabe #portrait:Gabe #layout:Right
-> END