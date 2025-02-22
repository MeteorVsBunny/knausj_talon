window (new | open): app.window_open()
window next: app.window_next()
window last: app.window_previous()
window close: app.window_close()
window hide: app.window_hide()
flip <user.running_applications>: user.switcher_focus(running_applications)
# following only works on windows. Can't figure out how to make it work for mac. No idea what the equivalent for linux would be.
flip$: user.switcher_menu()
focus last: user.switcher_focus_last()
running list: user.switcher_toggle_running()
running close: user.switcher_hide_running()
please launch <user.launch_applications>: user.switcher_launch(launch_applications)

window stretch: key(super-shift-up)
manage <user.window_snap_position>: user.snap_window(window_snap_position)
monitor right: user.move_window_next_screen()
monitor left: user.move_window_previous_screen()
snap screen <number>: user.move_window_to_screen(number)
snap <user.running_applications> <user.window_snap_position>:
    user.snap_app(running_applications, window_snap_position)
# <user.running_applications> is here twice to require at least two applications.
snap <user.window_split_position> <user.running_applications> <user.running_applications>+:
    user.snap_layout(window_split_position, running_applications_list)
snap <user.running_applications> [screen] <number>:
    user.move_app_to_screen(running_applications, number)

window max: key(super-up:2)
dredge: key(alt-tab)
[go] desktop: key(super-d)

flip explore: key(super-1)
# flip explore: user.switcher_focus("Windows Explorer")
flip chrome: key(super-2)
flip web: key(super-2)
# flip web: user.switcher_focus("chrome")
# flip intelli: key(super-3)
flip code: key(super-4)
# flip code: user.switcher_focus("code")
flip draft: user.switcher_focus("wordpad")
flip slack: key(super-9)
# flip slack: user.switcher_focus("slack")
flip outlook: key(super-0)
flip terminal: key(super-8)
# flip terminal: user.switcher_focus("m s")

draft new:
    user.switcher_focus("wordpad")
    key(ctrl-a)
    mode.enable("dictation")
    # user.code_clear_language_mode()
    # mode.disable("user.gdb")
    user.engine_mimic("start normal mode")
draft that:
    key(ctrl-c)
    user.switcher_focus("wordpad")
    key(ctrl-a)
    mode.enable("dictation")
    # user.code_clear_language_mode()
    # mode.disable("user.gdb")
    user.engine_mimic("start normal mode")
    key(ctrl-v)
draft retrieve:
    user.switcher_focus("wordpad")
    key(ctrl-a)
    key(ctrl-c)
    key(alt-tab)
    sleep(500ms)
    key(ctrl-v)
    
captain:
    mode.disable("sleep")
    mode.disable("dictation")
    mode.enable("command")
    # user.engine_mimic("start command mode")
dictate:
    # mode.disable("sleep")
    # mode.disable("command")
    # mode.enable("dictation")
    # user.code_clear_language_mode()
    # mode.disable("user.gdb")
    user.engine_mimic("start normal mode")