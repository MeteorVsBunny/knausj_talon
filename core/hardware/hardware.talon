# yellow dual fit switch
key(f13):
    user.noise_trigger_pop()
    # key(alt-left)
    # user.foot_pedal_left()
key(f14): 
    user.foot_pedal_right()
    # key(alt-right)
# key(f15): key("ctrl-'")
# key(f15:down):
#     user.mouse_scroll_down_continuous()
# key(f15:up):
#     user.mouse_scroll_stop()
key(f15):
    # user.keyboard_repeat()
    key(alt-right)
key(f16):
    user.foot_pedal_left()

# sidewinder
key(pause): core.repeat_command(1)
#key(menu:down): key(super:down)
#key(menu:up): key(super:up)
#does not work
#key(altgr:down): key(alt:down)
#key(altgr:up): key(alt:up)
key(alt-pause): user.foot_pedal_right()

# glove80
# top left
key(f17): user.keyboard_close()
key(f18): user.keyboard_prior()
# top right
key(f19): user.keyboard_next()
key(f20): user.keyboard_open()
# bottom left
key(f21): user.keyboard_repeat()
# bottom right
key(f22): user.keyboard_repeat()

# key(,):
#     if not input focused
#         previous tab
# key(.): user.keyboard_next()
#     if not input focused
#         next tab

# macropad
key(ctrl-alt-shift-f10): user.keyboard_prior()
key(ctrl-alt-shift-f12): user.keyboard_next()
key(ctrl-alt-shift-f11:up): insert("test")

# row 1
# key(f13): 
# key(f14): 
# key(f15):
# # row 2
# key(f16): 
# key(f17): 

# key(f18):
# row 3
# key(f19): key(alt:left)
# key(f20): user.keyboard_open()
# key(f21): key(alt:right)
# row 4
# key(f22): user.keyboard_prior()
key(f23):
    key(ctrl-c)
    # user.keyboard_close()
key(f24):
    key(ctrl-v)
    # user.keyboard_next()

# pad
key(keypad_plus):
    user.keyboard_repeat()