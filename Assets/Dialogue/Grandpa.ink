 INCLUDE globals.ink
 EXTERNAL giveItem(itemName)
 
{ item_money == 0: -> main | -> already_done}

=== main ===
Good morning Grandpa! #speaker:Jack #portrait:Jack #layout:Left
Good morning lad! #speaker:Grandpa #portrait:Grandpa #layout:Right
What you up to? 
I'm trying to gather my courage to talk with the girl from across the tree. #speaker:Jack #portrait:Jack #layout:Left
Ahh, to be young again... #speaker:Grandpa #portrait:Grandpa #layout:Right
I remember when i tried to get with your Grandmother...
Grandpa... I heard this story a million times... #speaker:Jack #portrait:Jack #layout:Left
Hehehe, sorry, than take this money to get something nice for the girl.#speaker:Grandpa #portrait:Grandpa #layout:Right
Goodluck kiddo!
Thank you Grandpa! #speaker:Jack #portrait:Jack #layout:Left
~ item_money = 1
~ giveItem("money")
-> END

=== already_done ===
Hehe, young love. #speaker:Grandpa #portrait:Grandpa #layout:Right
-> END


