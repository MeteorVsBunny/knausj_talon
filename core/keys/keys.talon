<user.letter>: key(letter)
big <user.letter>:
    user.insert_formatted(letter, "ALL_CAPS")
(ship | uppercase) <user.letters> [(lowercase | sunk)]:
    user.insert_formatted(letters, "ALL_CAPS")
<user.symbol_key>: key(symbol_key)
# Use "press f4" instead to reduce collisions
# <user.function_key>: key(function_key)
<user.special_key>: key(special_key)
<user.keypad_key>: key(keypad_key)
<user.modifiers> <user.unmodified_key>: key("{modifiers}-{unmodified_key}")
# for key combos consisting only of modifiers, eg. `press super`.
press <user.modifiers>: key(modifiers)
# for consistency with dictation mode and explicit arrow keys if you need them.
press <user.keys>: key(keys)
