from talon import actions, Module

mod = Module()

@mod.action_class
class MyEverywhereActions:
    def foot_pedal_left():
        "toggle mute on call mic. toggle hints"

    def foot_pedal_right():
        "toggle voice mic"

    def keyboard_prior():
        ""
        actions.app.tab_previous()

    def keyboard_next():
        ""
        actions.app.tab_next()

    def keyboard_repeat():
        ""
        actions.core.repeat_command(1)
