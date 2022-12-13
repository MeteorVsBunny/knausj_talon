from talon import app, actions

def app_launch():
    # actions.user.mouse_toggle_zoom_mouse()
    actions.speech.disable()
    actions.user.history_toggle()
app.register("launch", app_launch)
