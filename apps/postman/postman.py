from talon import Context, actions

ctx = Context()

ctx.matches = """
os: windows
and app.name: Postman
os: windows
and app.exe: Postman.exe
"""

@ctx.action_class("app")
class AppActions:
    def tab_next():
        actions.key("ctrl-tab")

    def tab_previous():
        actions.key("ctrl-shift-tab")

    def tab_close():
        actions.key("ctrl-w")

    def tab_reopen():
        actions.key("")
