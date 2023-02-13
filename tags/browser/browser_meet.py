from talon import Context, actions

ctx = Context()
ctx.matches = r"""
tag: browser
browser.host: /meet\.google\.com/
"""

@ctx.action_class("user")
class UserActions:
    def foot_pedal_left():
        # rango hints toggle. shortcut has to be set in chrome extensions
        actions.key("ctrl-d")