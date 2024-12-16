 INCLUDE globals.ink
 EXTERNAL giveItem(itemName)
 
{ item_balloon == 0: -> main | -> got_balloon}

=== main ===
Hello mate! What are you doing? #speaker:Tony #portrait:Tony #layout:Right
I am searching for a good gift for someone. #speaker:Jack #portrait:Jack #layout:Left
What are YOU doing?
I'm building a hot air balloon! #speaker:Tony #portrait:Tony #layout:Right
I can't see a balloon here. #speaker:Jack #portrait:Jack #layout:Left
That's because I lost it yesterday. #speaker:Tony #portrait:Tony #layout:Right
Now I try to make new one with this curtains but they aren't so good.
Now, if you don't have anything else, I have work to do.
-> END

=== got_balloon ===
{ item_balloon == 2: -> already_done | -> got_balloon_real}
-> END
=== got_balloon_real ===
Hello mate! What are you doing? #speaker:Tony #portrait:Tony #layout:Right
I found a balloon and I was wondering if it's yours. #speaker:Jack #portrait:Jack #layout:Left
Really? I tought I lost it, thank you! #speaker:Tony #portrait:Tony #layout:Right
Yea, no problem! #speaker:Jack #portrait:Jack #layout:Left
Now that you found my balloon I don't need this curtains anymore.#speaker:Tony #portrait:Tony #layout:Right
Can you give them to someone that needs them?
Sure thing. #speaker:Jack #portrait:Jack #layout:Left
~ item_balloon = 2
~ item_curtains = 1
~ giveItem("curtains")
-> END


=== already_done ===
How do you like my balloon? #speaker:Tony #portrait:Tony #layout:Right
-> END