# -1 because we are repeating, so the initial command counts as one
<user.ordinals>: core.repeat_command(ordinals - 1)
^(fifth | sixth):
    # breathing recognized as this in dragon only
# <number_small>: core.repeat_command(number_small-1)
<number_small> tie: core.repeat_command(number_small - 1)
(repeat that | twice): core.repeat_command(1)
repeat that <number_small> [times]: core.repeat_command(number_small)
