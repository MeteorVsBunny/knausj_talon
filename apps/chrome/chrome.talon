app: chrome
-
tag(): browser
tag(): user.tabs

profile switch: user.chrome_mod("shift-m")
dark mode: key(alt-shift-d)
tab search: user.chrome_mod("shift-a")

tab search <user.text>$:
    user.chrome_mod("shift-a")
    sleep(200ms)
    insert("{text}")
    key(down)
