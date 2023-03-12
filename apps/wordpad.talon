os: windows
and app.name: Windows Wordpad Application
os: windows
and app.exe: wordpad.exe
-

draft transfer:
    key(ctrl-a)
    key(ctrl-c)
    key(alt-tab)
    sleep(750ms)
    key(ctrl-v)
    mode.disable("dictation")
    mode.enable("command")
    user.engine_mimic("start command mode")
