experiment: anchor-file
mode: dictation
-
# Everything here should call `auto_insert()` (instead of `insert()`), to preserve the state to correctly auto-capitalize/auto-space.
# (Talonscript string literals implicitly call `auto_insert`, so there's no need to wrap those)
<user.raw_prose>:
    auto_insert(raw_prose)

# Formatting
formatted <user.format_text>: user.dictation_insert_raw(format_text)
^format selection <user.formatters>$: user.formatters_reformat_selection(formatters)

# Corrections
^scratch that: user.clear_last_phrase()
^scratch selection: edit.delete()
^select that: user.select_last_phrase()
^spell that <user.letters>: auto_insert(letters)
^spell that <user.formatters> <user.letters>:
    result = user.formatted_text(letters, formatters)
    user.dictation_insert_raw(result)

# Escape, type things that would otherwise be commands
^escape <user.text>$: auto_insert(user.text)
