tag: browser
-
tag(): user.address
tag(): user.find
tag(): user.navigation

go page | page focus: browser.focus_page()

go home: browser.go_home()
advance: browser.go_forward()
retreat: browser.go_back()
# jab <digits>$: user.click_by_voice(digits, "")
# slam <digits>$: user.click_by_voice(digits, "t")
# voice hints off:
#     key(ctrl-shift-space)
#     sleep(50ms)
#     insert(":-")
#     key(enter)
# voice hints on:
#     key(ctrl-shift-space)
#     sleep(50ms)
#     insert(":+")
#     key(enter)
ready join:
    key(ctrl-d ctrl-e tab:9)
    user.engine_sleep()
    
go to {user.website}: browser.go(website)
go private: browser.open_private_window()

bookmark it: browser.bookmark()
bookmark tabs: browser.bookmark_tabs()
refresh: browser.reload()
refresh hard: browser.reload_hard()

bookmark show: browser.bookmarks()
bookmark bar [show]: browser.bookmarks_bar()
downloads show: browser.show_downloads()
extensions show: browser.show_extensions()
history show: browser.show_history()
cache show: browser.show_clear_cache()
dev tools [show]: browser.toggle_dev_tools()

# Legacy [verb noun] commands to be removed at a later time
show downloads: browser.show_downloads()
show extensions: browser.show_extensions()
show history: browser.show_history()
show cache: browser.show_clear_cache()
