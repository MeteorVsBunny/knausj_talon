tag: user.code_operators_assignment
-
tag(): user.code_operators_math
tag(): user.code_operators_bitwise

# assignment
lodge assign: user.code_operator_assignment()
lodge or assign: user.code_or_operator_assignment()

# combined computation and assignment
lodge (minus | subtract) equals: user.code_operator_subtraction_assignment()
lodge (plus | add) equals: user.code_operator_addition_assignment()
lodge (times | multiply) equals: user.code_operator_multiplication_assignment()
lodge divide equals: user.code_operator_division_assignment()
lodge mod equals: user.code_operator_modulo_assignment()
[op] increment: user.code_operator_increment()

#bitwise operators
[op] bit [wise] and equals: user.code_operator_bitwise_and_assignment()
[op] bit [wise] or equals: user.code_operator_bitwise_or_assignment()
(op | logical | bitwise) (ex | exclusive) or equals:
    user.code_operator_bitwise_exclusive_or_assignment()
[(op | logical | bitwise)] (left shift | shift left) equals:
    user.code_operator_bitwise_left_shift_assignment()
[(op | logical | bitwise)] (right shift | shift right) equals:
    user.code_operator_bitwise_right_shift_assignment()
