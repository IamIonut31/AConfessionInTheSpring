 INCLUDE globals.ink
 EXTERNAL giveItem(itemName)
 
{ item_hat == 0: -> main | -> got_hat}

=== main ===
Hi Jake, sure is hot today, huh? #speaker:Gus #portrait:Gus #layout:Right
Too bad I forgot my hat at the farm.
Now I have to sweat like a racing rabbit.
But enough about me, what are you doing?
I am searching for a good gift for a girl. #speaker:Jack #portrait:Jack #layout:Left
Well, if i can help you with something let me know. #speaker:Gus #portrait:Gus #layout:Right
-> END

=== got_hat ===
{ item_hat == 2: -> already_done | -> got_hat_real}
-> END

=== got_hat_real ===
Hi Jake, sure is hot today, huh? #speaker:Gus #portrait:Gus #layout:Right
Too bad I forgot my hat at the farm.
What are you doing?
I got you this hat to help you with this sun. #speaker:Jack #portrait:Jack #layout:Left
Thank you so much, you saved my head. #speaker:Gus #portrait:Gus #layout:Right
If you still searching for a gift for the girl you can bring her this juicy carrots.
You know what they say: "Love goes first through the stomach, than the heart".
Thank you so much, now I have the perfect gift for her! #speaker:Jack #portrait:Jack #layout:Left
~ item_hat = 2
~ item_carrot = 1
~ giveItem("carrot")
-> END

=== already_done ===
You can never go wrong with a bunch of carrots. #speaker:Gus #portrait:Gus #layout:Right
-> END