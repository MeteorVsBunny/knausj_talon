window (new | open): app.window_open()
window next: app.window_next()
window last: app.window_previous()
window close: app.window_close()
flip <user.running_applications>: user.switcher_focus(running_applications)
# following only works on windows. Can't figure out how to make it work for mac. No idea what the equivalent for linux would be.
flip$: user.switcher_menu()
running list: user.switcher_toggle_running()
running close: user.switcher_hide_running()
launch <user.launch_applications>: user.switcher_launch(launch_applications)

window <user.window_snap_position>: user.snap_window(window_snap_position)
monitor right: user.move_window_next_screen()
monitor left: user.move_window_previous_screen()
snap screen <number>: user.move_window_to_screen(number)
snap <user.running_applications> <user.window_snap_position>:
    user.snap_app(running_applications, window_snap_position)
snap <user.running_applications> [screen] <number>:
    user.move_app_to_screen(running_applications, number)

window max: key(super-up)
dredge: key(alt-tab)
desktop: key(super-d)

flip terminal: user.switcher_focus("m s")

flip draft: user.switcher_focus("wordpad")
draft new:
    #user.switcher_launch("wordpad")
    user.switcher_focus("wordpad")
    user.engine_mimic("start normal mode")
    mode.disable("sleep")
    mode.disable("command")
    mode.enable("dictation")
    user.code_clear_language_mode()
    mode.disable("user.gdb")
draft that:
    key(ctrl-c)
    #user.switcher_launch("wordpad")
    user.switcher_focus("wordpad")
    user.engine_mimic("start normal mode")
    mode.disable("sleep")
    mode.disable("command")
    mode.enable("dictation")
    user.code_clear_language_mode()
    mode.disable("user.gdb")
    key(ctrl-v)
    
# captain: user.engine_mimic("start command mode")
dictate:
    # user.engine_mimic("start normal mode")
    mode.disable("sleep")
    mode.disable("command")
    mode.enable("dictation")
    user.code_clear_language_mode()
    mode.disable("user.gdb")