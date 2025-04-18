os: windows
os: linux
app: slack
#todo: some sort of plugin, consolidate with teams or something?
-
tag(): user.messaging
tag(): user.emoji
# Workspaces
workspace <number>: key("ctrl-{number}")
# Channel
info: key(ctrl-shift-i)
# Navigation
focus (move | next): key(ctrl-`)
(section | zone) [next]: key(f6)
(section | zone) (previous | last): key(shift-f6)
(slack | lack) [direct] messages: key(ctrl-shift-k)
go threads: key(ctrl-shift-t)
retreat: key(alt-left)
advance: key(alt-right)
(element | bit) [next]: key(tab)
(element | bit) (previous | last): key(shift-tab)
(slack | lack) (my stuff | activity): key(ctrl-shift-m)
(slack | lack) directory: key(ctrl-shift-e)
(slack | lack) (starred [items] | stars): key(ctrl-shift-s)
(slack | lack) unread [messages]: key(ctrl-shift-a)
# Messaging
grab left: key(shift-up)
grab right: key(shift-down)
add line: key(shift-enter)
#"(slack | lack) (slap | slaw | slapper): [key(cmd-right) key(shift-enter")],
(slack | lack) (react | reaction): key(ctrl-shift-\)
(insert command | commandify): key(ctrl-shift-c)
insert code: insert("```")
code block: key(ctrl-alt-shift-c)
(slack | lack) (bull | bullet | bulleted) [list]: key(ctrl-shift-8)
(slack | lack) (number | numbered) [list]: key(ctrl-shift-7)
(slack | lack) (quotes | quotation): key(ctrl-shift-9)
bold: key(ctrl-b)
(italic | italicize): key(ctrl-i)
(strike | strikethrough): key(ctrl-shift-x)
(slack | lack) snippet: key(ctrl-shift-enter)
# Calls
([toggle] mute | unmute): key(m)
(slack | lack) ([toggle] video): key(v)
(slack | lack) invite: key(a)
# Miscellaneous
(slack | lack) shortcuts: key(ctrl-/)
emote <user.text>: "{text}"
toggle left sidebar: key(ctrl-shift-d)
toggle right sidebar: key(ctrl-.)

# my stuff
next: key(alt-shift-down)
prior: key(alt-shift-up)
channel next: key(alt-down)
channel prior: key(alt-up)

create new message: key(ctrl-n)
huddle toggle:
    key(ctrl-shift-h)
    speech.disable()
    user.engine_sleep()
keyboard: key(ctrl-/)
open [<user.text>]:
    key(ctrl-k)
    insert(user.text or "")
open channel: key(ctrl-k)
jump: key(ctrl-j)
quit slack: key(ctrl-q)
edit last message: key(ctrl-up)

yes: "yes "
yep: "yep "
yeah: "yeah "
hi: "hi "
okay: "ok "
no: "no "
thanks: "thanks "
done: "done "

# DEPRECATED
(move | next) focus:
    app.notify("please use the voice command 'focus next' instead of 'next focus'")
    key(ctrl-`)
[next] (section | zone):
    app.notify("please use the voice command 'section next' instead of 'next section'")
    key(f6)
(previous | last) (section | zone):
    app.notify("please use the voice command 'section last' instead of 'last section'")
    key(shift-f6)
[next] (element | bit):
    app.notify("please use the voice command 'element next' instead of 'next element'")
    key(tab)
(previous | last) (element | bit):
    app.notify("please use the voice command 'element last' instead of 'last element'")
    key(shift-tab)


vertical link:
    mouse_move(-358, 1926)
    mouse_click(0)
horizontal link:
    mouse_move(-915, 1205)
    mouse_click(0)