 INCLUDE globals.ink
 EXTERNAL giveItem(itemName)
 
{ item_flowers == 0: -> main | -> got_flowers}

=== main ===
Good morning my dear! #speaker:Grandma #portrait:Grandma #layout:Right
Good morning Grandma! #speaker:Jack #portrait:Jack #layout:Left
What are you doing?
I bought a new vase but I don't have any spring flowers to put in it. #speaker:Grandma #portrait:Grandma #layout:Right
If you fing some flowers can you bring them to me?
Sure Grandma. #speaker:Jack #portrait:Jack #layout:Left
-> END

=== got_flowers ===
{ item_flowers == 2: -> already_done | -> got_flowers_real}
Hi Grandma I got some flowers for you! #speaker:Jack #portrait:Jack #layout:Left
Splendid! Thank you so much! #speaker:Grandma #portrait:Grandma #layout:Right
Oh, and I found this giant balloon yesterday at the base of the tree.
Can you find out whose it is?
Sure Grandma. #speaker:Jack #portrait:Jack #layout:Left
~ item_flowers = 2
~ item_balloon = 1
~ giveItem("balloon")
-> END
=== got_flowers_real===
Hi Grandma I got some flowers for you! #speaker:Jack #portrait:Jack #layout:Left
Splendid! Thank you so much! #speaker:Grandma #portrait:Grandma #layout:Right
Oh, and I found this giant balloon yesterday at the base of the tree.
Can you find out whose it is?
Sure Grandma. #speaker:Jack #portrait:Jack #layout:Left
~ item_flowers = 2
~ item_balloon = 1
~ giveItem("balloon")
-> END


=== already_done ===
Grandpa told me, if you manage to kiss her, tell me. Hehe. #speaker:Grandma #portrait:Grandma #layout:Right
-> END