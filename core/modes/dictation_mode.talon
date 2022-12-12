mode: dictation
-
^press <user.modifiers>$: key(modifiers)
^press <user.keys>$: key(keys)

# Everything here should call `auto_insert()` (instead of `insert()`), to preserve the state to correctly auto-capitalize/auto-space.
# (Talonscript string literals implicitly call `auto_insert`, so there's no need to wrap those)
# :<user.raw_prose>: auto_insert(raw_prose)
cap: user.dictation_format_cap()
# Hyphenated variants are for Dragon.
(no cap | no-caps): user.dictation_format_no_cap()
(no space | no-space): user.dictation_format_no_space()
^cap that$: user.dictation_reformat_cap()
^(no cap | no-caps) that$: user.dictation_reformat_no_cap()
^(no space | no-space) that$: user.dictation_reformat_no_space()

# Navigation
up <number_small>:
    edit.up()
    repeat(number_small - 1)
down <number_small>:
    edit.down()
    repeat(number_small - 1)
left [<number_small>]:
    edit.left()
    r = number_small or 3
    repeat(r + 5)
right <number_small>:
    edit.right()
    repeat(number_small - 1)
fly left <number_small>:
    edit.word_left()
    repeat(number_small - 1)
fly right <number_small>:
    edit.word_right()
    repeat(number_small - 1)
left wally: edit.line_start()
right wally: edit.line_end()

# Selection
queue left <number_small>:
    edit.extend_word_left()
    repeat(number_small - 1)
queue right <number_small>:
    edit.extend_word_right()
    repeat(number_small - 1)
splat <number_small>:
    edit.extend_word_left()
    repeat(number_small - 1)
    edit.delete()
squash <number_small>:
    edit.extend_word_right()
    repeat(number_small - 1)
    edit.delete()
clear <number_small>:
    edit.extend_left()
    repeat(number_small - 1)
    edit.delete()
deli <number_small>:
    edit.extend_right()
    repeat(number_small - 1)
    edit.delete()

# Formatting
formatted <user.format_text>: user.dictation_insert_raw(format_text)
^format selection <user.formatters>$: user.formatters_reformat_selection(formatters)

# Corrections
scratch that: user.clear_last_phrase()
scratch selection: edit.delete()
select that: user.select_last_phrase()
spell that <user.letters>: auto_insert(letters)
spell that <user.formatters> <user.letters>:
    result = user.formatted_text(letters, formatters)
    user.dictation_insert_raw(result)

# Escape, type things that would otherwise be commands
^escape <user.text>$: auto_insert(user.text)

<user.letter>: key(letter)
shock: key(enter)
tell sink: key(end enter)
landscape: key(ctrl-a)
cancel: key(escape)
shackle:
    key(home)
    sleep(5ms)
    key(shift-end)
stoosh: key(ctrl-c)
spark: key(ctrl-v)
ace: key(space)
spammer: insert(", ")
deckle: insert(":")

captain:
    mode.disable("sleep")
    mode.disable("dictation")
    mode.enable("command")
    user.engine_mimic("start command mode")

draft transfer:
    key(ctrl-a)
    key(ctrl-c)
    key(alt-tab)
    sleep(350ms)
    key(ctrl-v)
    mode.disable("dictation")
    mode.enable("command")
    user.engine_mimic("start command mode")