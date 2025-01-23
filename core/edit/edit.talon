# Compound of action(select, clear, copy, cut, paste, etc.) and modifier(word, line, etc.) commands for editing text.
# eg: "select line", "clear all"
<user.edit_action> <user.edit_modifier>: user.edit_command(edit_action, edit_modifier)

# Zoom
zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
zoom reset: edit.zoom_reset()

# Searching
find it: edit.find()
next one: edit.find_next()

# Navigation

# The reason for these spoken forms is that "page up" and "page down" are globally defined as keys.
scroll up: edit.page_up()
scroll down: edit.page_down()

# go left, go left left down, go 5 left 2 down
# go word left, go 2 words right
go <user.navigation_step>+: user.perform_navigation_steps(navigation_step_list)
fly left: edit.word_left()
fly right: edit.word_right()

go line start | head: edit.line_start()
go line end | tail: edit.line_end()

go way left:
    edit.line_start()
    edit.line_start()
go way right: edit.line_end()
go way up: edit.file_start()
go way down: edit.file_end()

go top: edit.file_start()

submerge: key(ctrl-end)
orbit: key(ctrl-home)
shift submerge: key(ctrl-shift-end)
shift orbit: key(ctrl-shift-home)

take tail: key(shift-end)
take head: key(shift-home)
copy tail: key(shift-end ctrl-c)
copy head: key(shift-home ctrl-c)

chuck head: key(shift-home delete)
chuck tail: key(shift-end delete)
go bottom: edit.file_end()

go page up: edit.page_up()
go page down: edit.page_down()

# Selecting
select all: edit.select_all()
select line: edit.select_line()
shackle:
    key(home)
    sleep(5ms)
    key(shift-end)
select line start: user.select_line_start()
select line end: user.select_line_end()
landscape: key(ctrl-a)

select left: edit.extend_left()
select right: edit.extend_right()
select up: edit.extend_line_up()
select down: edit.extend_line_down()

select word: edit.select_word()
(select word | queue) left: edit.extend_word_left()
(select word | queue) right: edit.extend_word_right()

# Indentation
indent [more]: edit.indent_more()
(indent less | out dent): edit.indent_less()

# Delete
clear left: edit.delete()
clear right: user.delete_right()

clear up:
    edit.extend_line_up()
    edit.delete()

clear down:
    edit.extend_line_down()
    edit.delete()

clear word: edit.delete_word()

splat:
    key(ctrl-backspace)
squash:
    key(ctrl-delete)

clear word left:
    edit.extend_word_left()
    edit.delete()

clear word right:
    edit.extend_word_right()
    edit.delete()

# Copy
copy that: edit.copy()
copy word left: user.copy_word_left()
copy word right: user.copy_word_right()

#to do: do we want these variants, seem to conflict
# copy left:
#      edit.extend_left()
#      edit.copy()
# copy right:
#     edit.extend_right()
#     edit.copy()
# copy up:
#     edit.extend_up()
#     edit.copy()
# copy down:
#     edit.extend_down()
#     edit.copy()

stoosh: key(ctrl-c)
scissor: key(ctrl-x)
spark: key(ctrl-v)

# Cut
cut that: edit.cut()
cut word left: user.cut_word_left()
cut word right: user.cut_word_right()

#to do: do we want these variants
# cut left:
#      edit.select_all()
#      edit.cut()
# cut right:
#      edit.select_all()
#      edit.cut()
# cut up:
#      edit.select_all()
#     edit.cut()
# cut down:
#     edit.select_all()
#     edit.cut()

# Paste
(pace | paste) that: edit.paste()
(pace | paste) enter:
    edit.paste()
    key(enter)
paste match: edit.paste_match_style()

# Duplication
clone that: edit.selection_clone()
clone line: edit.line_clone()

# Insert new line
new line above: edit.line_insert_up()
new line below | slap: edit.line_insert_down()

# Insert padding with optional symbols
padding: user.insert_between(" ", " ")
(pad | padding) <user.symbol_key>+:
    insert(" ")
    user.insert_many(symbol_key_list)
    insert(" ")

# Undo/redo
undo that: edit.undo()
redo that: edit.redo()

# Save
file save: edit.save()
file save all: edit.save_all()

[go] line mid: user.line_middle()


tell sink: edit.line_insert_down()
earthquake: key(ctrl-enter)

switch over caster:
    key(super-d)
    sleep(1s)
    key(c a s t e r enter)
    speech.disable()

captain: user.engine_mimic("start command mode")

toby stop:
    key(super-d)
    sleep(500ms)
    key(t o b i i minus s t o p menu a)