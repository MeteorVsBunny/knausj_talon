#provide both anchored and unachored commands via 'brunt'
phrase <user.text>$:
    user.add_phrase_to_history(text)
    insert(text)
phrase <user.text> brunt:
    user.add_phrase_to_history(text)
    insert(text)
phrase <user.text> ace:
    user.add_phrase_to_history(text)
    insert(text)
    insert(" ")
{user.prose_formatter} <user.prose>$: user.insert_formatted(prose, prose_formatter)
{user.prose_formatter} <user.prose> brunt: user.insert_formatted(prose, prose_formatter)
{user.prose_formatter} <user.prose> ace:
    user.insert_formatted(prose, prose_formatter)
    insert(" ")
<user.format_text>+$: user.insert_many(format_text_list)
<user.format_text>+ brunt: user.insert_many(format_text_list)
<user.format_text>+ ace:
    user.insert_many(format_text_list)
    insert(" ")
<user.formatters> that: user.formatters_reformat_selection(user.formatters)
word <user.word>:
    user.add_phrase_to_history(word)
    insert(word)
proud <user.word>: user.insert_formatted(word, "CAPITALIZE_FIRST_WORD")
recent list: user.toggle_phrase_history()
recent close: user.phrase_history_hide()
recent repeat <number_small>:
    recent_phrase = user.get_recent_phrase(number_small)
    user.add_phrase_to_history(recent_phrase)
    insert(recent_phrase)
recent copy <number_small>: clip.set_text(user.get_recent_phrase(number_small))
select that: user.select_last_phrase()
before that: user.before_last_phrase()
nope that | scratch that: user.clear_last_phrase()
nope that was <user.formatters>: user.formatters_reformat_last(formatters)
