from talon import Context, Module, actions, ctrl, settings, ui

mod = Module()
ctx = Context()

mod.list(
    "mouse_button",
    desc="List of mouse button words to mouse_click index parameter",
)
mod.setting(
    "mouse_enable_pop_click",
    type=int,
    default=0,
    desc="Pop noise clicks left mouse button. 0 = off, 1 = on with eyetracker but not with zoom mouse mode, 2 = on but not with zoom mouse mode",
)
mod.setting(
    "mouse_enable_pop_stops_scroll",
    type=bool,
    default=False,
    desc="When enabled, pop stops continuous scroll modes (wheel upper/downer/gaze)",
)
mod.setting(
    "mouse_enable_pop_stops_drag",
    type=bool,
    default=False,
    desc="When enabled, pop stops mouse drag",
)
mod.setting(
    "mouse_wake_hides_cursor",
    type=bool,
    default=False,
    desc="When enabled, mouse wake will hide the cursor. mouse_wake enables zoom mouse.",
)


@mod.action_class
class Actions:
    def zoom_close():
        """Closes an in-progress zoom. Talon will move the cursor position but not click."""
        actions.user.deprecate_action(
            "2024-12-26",
            "user.zoom_close",
            "tracking.zoom_cancel",
        )
        actions.tracking.zoom_cancel()

    def mouse_wake():
        """Enable control mouse, zoom mouse, and disables cursor"""
        actions.tracking.control_zoom_toggle(True)

        if settings.get("user.mouse_wake_hides_cursor"):
            actions.user.mouse_cursor_hide()

    def mouse_calibrate():
        """Start calibration"""
        eye_mouse.calib_start()

    def mouse_toggle_control_mouse(enabled: bool = None):
        """Toggles control mouse. Pass in a bool to enable it, otherwise toggle the current state"""
        if enabled is not None:
            toggle_control(enabled)
        else:
            toggle_control(not config.control_mouse)

    def mouse_toggle_camera_overlay():
        """Toggles camera overlay"""
        toggle_camera_overlay(not config.show_camera)

    def mouse_toggle_zoom_mouse(enabled: bool = None):
        """Toggles zoom mouse"""
        if enabled is not None:
            eye_zoom_mouse.toggle_zoom_mouse(enabled)
        else:
            eye_zoom_mouse.toggle_zoom_mouse(not eye_zoom_mouse.zoom_mouse.enabled)

    def do_zoom_mouse(enabled: bool = True):
        """Clicks zoom mouse"""
        if enabled is not None:
            eye_zoom_mouse.zoom_mouse.on_pop(enabled)
        else:
            eye_zoom_mouse.zoom_mouse.on_pop(not eye_zoom_mouse.zoom_mouse.enabled)

    def toggleable_pop():
        """pop"""
        toggleable_pop(True)

    def set_pop_control():
        """Toggles pop"""
        global pop_mode
        pop_mode = 2
        actions.tracking.control_zoom_toggle(False)

    def set_pop_control_on():
        """Toggles pop"""
        global pop_mode
        pop_mode = 3
        actions.tracking.control_gaze_toggle(True)
        actions.tracking.control_head_toggle(True)
        actions.tracking.control_zoom_toggle(False)

    def set_pop_repeat():
        """Toggles pop"""
        global pop_mode
        pop_mode = 1

    def set_pop_mouse():
        """Toggles pop"""
        global pop_mode
        pop_mode = 0
        actions.tracking.control_toggle(False)
        actions.tracking.control_zoom_toggle(True)

    def mouse_cancel_zoom_mouse():
        """Cancel zoom mouse if pending"""
        if (
            eye_zoom_mouse.zoom_mouse.enabled
            and eye_zoom_mouse.zoom_mouse.state != eye_zoom_mouse.STATE_IDLE
        ):
            eye_zoom_mouse.zoom_mouse.cancel()

    def mouse_trigger_zoom_mouse():
        """Trigger zoom mouse if enabled"""
        if eye_zoom_mouse.zoom_mouse.enabled:
            eye_zoom_mouse.zoom_mouse.on_pop(eye_zoom_mouse.zoom_mouse.state)

    def mouse_drag(button: int):
        """Press and hold/release a specific mouse button for dragging"""
        # Clear any existing drags
        actions.user.mouse_drag_end()

        # Start drag
        actions.mouse_drag(button)

    def mouse_drag_end() -> bool:
        """Releases any held mouse buttons"""
        buttons = ctrl.mouse_buttons_down()
        if buttons:
            for button in buttons:
                actions.mouse_release(button)
            return True
        return False

    def mouse_drag_toggle(button: int):
        """If the button is held down, release the button, else start dragging"""
        if button in ctrl.mouse_buttons_down():
            actions.mouse_release(button)
        else:
            actions.mouse_drag(button)

    def mouse_sleep():
        """Disables control mouse, zoom mouse, and re-enables cursor"""
        actions.tracking.control_zoom_toggle(False)
        actions.tracking.control_toggle(False)
        actions.tracking.control1_toggle(False)

        actions.user.mouse_cursor_show()
        actions.user.mouse_scroll_stop()
        actions.user.mouse_drag_end()

    def copy_mouse_position():
        """Copy the current mouse position coordinates"""
        x, y = actions.mouse_x(), actions.mouse_y()
        actions.clip.set_text(f"{x}, {y}")

    def mouse_move_center_active_window():
        """Move the mouse cursor to the center of the currently active window"""
        rect = ui.active_window().rect
        actions.mouse_move(rect.center.x, rect.center.y)


@ctx.action_class("user")
class UserActions:
    def noise_trigger_pop():
        dont_click = False

        # Allow pop to stop drag
        if settings.get("user.mouse_enable_pop_stops_drag"):
            if actions.user.mouse_drag_end():
                dont_click = True

        # Allow pop to stop scroll
        if settings.get("user.mouse_enable_pop_stops_scroll"):
            if actions.user.mouse_scroll_stop():
                dont_click = True

        if dont_click:
            return

        # Otherwise respect the mouse_enable_pop_click setting
        setting_val = settings.get("user.mouse_enable_pop_click")

        is_using_eye_tracker = (
            actions.tracking.control_zoom_enabled()
            or actions.tracking.control_enabled()
            or actions.tracking.control1_enabled()
        )

        should_click = (
            setting_val == 2 and not actions.tracking.control_zoom_enabled()
        ) or (
            setting_val == 1
            and is_using_eye_tracker
            and not actions.tracking.control_zoom_enabled()
        )

        if should_click:
            ctrl.mouse_click(button=0, hold=16000)
