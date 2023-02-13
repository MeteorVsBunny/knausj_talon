from talon import actions, Module

mod = Module()

@mod.action_class
class MyEverywhereActions:
    def foot_pedal_left():
        "toggle mute on call mic. toggle hints"

    def foot_pedal_right():
        "toggle voice mic"