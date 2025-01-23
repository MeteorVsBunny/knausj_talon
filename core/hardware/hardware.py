from talon import actions, Module, Context

ctx_awake = Context()
ctx_awake.matches = r"""
not mode: sleep
"""

ctx_sleep = Context()
ctx_sleep.matches = r"""
mode: sleep
"""

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

@ctx_awake.action_class("user")
class UserActions:
    def foot_pedal_right():
        actions.speech.disable()
        # actions.user.dragon_engine_sleep()

@ctx_sleep.action_class("user")
class UserActions:
    def foot_pedal_right():
        actions.speech.enable()
        # actions.user.dragon_engine_sleep()