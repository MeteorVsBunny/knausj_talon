# Searching
find it: edit.find()
next one: edit.find_next()

(go word | fly) left: edit.word_left()
(go word | fly) right: edit.word_right()

go left: edit.left()
go right: edit.right()
go up: edit.up()
go down: edit.down()

go line start: edit.line_start()
go line end: edit.line_end()

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

select way left: edit.extend_line_start()
select way right: edit.extend_line_end()
select way up: edit.extend_file_start()
select way down: edit.extend_file_end()

# Indentation
indent [more]: edit.indent_more()
(indent less | out dent): edit.indent_less()

# Delete
clear all: user.delete_all()
clear line: edit.delete_line()
clear line start: user.delete_line_start()
clear line end: user.delete_line_end()
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

clear way left:
    edit.extend_line_start()
    edit.delete()

clear way right:
    edit.extend_line_end()
    edit.delete()

clear way up:
    edit.extend_file_start()
    edit.delete()

clear way down:
    edit.extend_file_end()
    edit.delete()

# Copy
copy all: user.copy_all()
copy line: user.copy_line()
copy line start: user.copy_line_start()
copy line end: user.copy_line_end()
copy word: user.copy_word()
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

# Cut
cut all: user.cut_all()
cut line: user.cut_line()
cut line start: user.cut_line_start()
cut line end: user.cut_line_end()
cut word: user.cut_word()
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
(pace | paste) all: user.paste_all()
(pace | paste) line: user.paste_line()
(pace | paste) line start: user.paste_line_start()
(pace | paste) line end: user.paste_line_end()
(pace | paste) word: user.paste_word()

# Duplication
clone that: edit.selection_clone()
clone line: edit.line_clone()

# Insert new line
new line above: edit.line_insert_up()
new line below: edit.line_insert_down()
