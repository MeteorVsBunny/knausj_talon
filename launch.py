from talon import app, actions

def app_launch():
    # actions.user.mouse_toggle_zoom_mouse()
    actions.speech.disable()
    actions.user.history_toggle()
    # open log on left monitor
    actions.menu.open_log()
    actions.sleep("1000ms")
    actions.key("super-shift-left super-up")

app.register("launch", app_launch)
