 INCLUDE globals.ink
 EXTERNAL giveItem(itemName)
 
{ item_carrot == 0: -> main | -> got_carrot}

=== main ===
Poor guy... I can even hear his stomach grumbling from here... #speaker:Jack #portrait:Jack #layout:Left
I wish I could help him...
-> END

=== got_carrot ===
{ item_carrot == 2: -> already_done | ->got_carrot_real}

-> END

=== got_carrot_real ===
... #speaker:Jack #portrait:Jack #layout:Left
...
I know I wanted this for something else, but I think he needs it more...
Hey I think you could use this.
Are you sure? #speaker:Homeless Man #portrait:HomelessMan #layout:Right
Yea, I am very sure, you need it more. #speaker:Jack #portrait:Jack #layout:Left
Here, take it.
Thank you so much, you are such a good person! #speaker:Homeless Man #portrait:HomelessMan #layout:Right
I don't have a gift for her now, but I can't go back... #speaker:Jack #portrait:Jack #layout:Left
~ item_carrot = 2
~ item_happy = 1
~ giveItem("happy")
-> END

=== already_done ===
I hope he is doing ok now. #speaker:Jack #portrait:Jack #layout:Left
-> END