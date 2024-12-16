 INCLUDE globals.ink
 EXTERNAL giveItem(itemName)
 
{ item_money == 0: -> main |-> got_money}

=== main ===
I don't have any money... #speaker:Jack #portrait:Jack #layout:Left
-> END

=== got_money ===
{ item_money == 2: -> already_done}

Good morning Jack, what can I help you with? #speaker:Suzy #portrait:Suzy #layout:Right
I want something nice for a special girl. #speaker:Jack #portrait:Jack #layout:Left
I think I have just the perfect gift. #speaker:Suzy #portrait:Suzy #layout:Right
What do you think about this bouquet of tulips?
    +[Perfect!]
        Perfect! Just the right thing. #speaker:Jack #portrait:Jack #layout:Left
        You got nice taste, I'll give it to you right away! #speaker:Suzy #portrait:Suzy #layout:Right
        Here you go.
        Thank you. #speaker:Jack #portrait:Jack #layout:Left
        ~ item_money = 2
        ~ item_flowers = 1
        ~ giveItem("flowers")
        -> END
    +[...I don't know]
        ...I don't know, this doesn't seem like the right thing... #speaker:Jack #portrait:Jack #layout:Left
        -> tulipno
=== tulipno ===
In this case, what do you think about this bouquet of roses?#speaker:Suzy #portrait:Suzy #layout:Right
            +[Perfect!]
                Perfect! Just the right thing. #speaker:Jack #portrait:Jack #layout:Left
                You got nice taste, I'll give it to you right away! #speaker:Suzy #portrait:Suzy #layout:Right
                Here you go.
                Thank you. #speaker:Jack #portrait:Jack #layout:Left
                ~ item_money = 2
                ~ item_flowers = 1
                ~ giveItem("flowers")
                -> END
            +[...I don't know]
                ...I don't know, this doesn't seem like the right thing... #speaker:Jack #portrait:Jack #layout:Left
                -> rosesno
=== rosesno ===
In this case, waht do you think about this bouquet of primroses?#speaker:Suzy #portrait:Suzy #layout:Right
            +[Perfect!]
                Perfect! Just the right thing. #speaker:Jack #portrait:Jack #layout:Left
                You got nice taste, I'll give it to you right away! #speaker:Suzy #portrait:Suzy #layout:Right
                Here you go.
                Thank you. #speaker:Jack #portrait:Jack #layout:Left
                ~ item_money = 2
                ~ item_flowers = 1
                ~ giveItem("flowers")
                -> END
            +[Thanks, but I will look for another thing]
                Thanks, but I will look for another thing. #speaker:Jack #portrait:Jack #layout:Left
                -> END
-> END


=== already_done ===
Can I help you with something else? #speaker:Suzy #portrait:Suzy #layout:Right
No thanks. #speaker:Jack #portrait:Jack #layout:Left
-> END