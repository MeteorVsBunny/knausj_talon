tag: user.code_operators_math
-

# math operators
lodge (minus | subtract): user.code_operator_subtraction()
lodge (plus | add): user.code_operator_addition()
lodge (times | multiply): user.code_operator_multiplication()
lodge divide: user.code_operator_division()
lodge mod: user.code_operator_modulo()
lodge (power | exponent): user.code_operator_exponent()

# comparison operators
lodge (equal|equals): user.code_operator_equal()
lodge not equal: user.code_operator_not_equal()
lodge (greater | more) [than]: user.code_operator_greater_than()
lodge (less | below) [than]: user.code_operator_less_than()
lodge greater [than] or equal: user.code_operator_greater_than_or_equal_to()
lodge less [than] or equal: user.code_operator_less_than_or_equal_to()

# logical operators
lodge and: user.code_operator_and()
lodge or: user.code_operator_or()
lodge not: user.code_operator_not()

# set operators
lodge inside: user.code_operator_in()
lodge not inside: user.code_operator_not_in()

# TODO: This operator should either be abstracted into a function or removed.
(lodge | pad) colon: " : "
