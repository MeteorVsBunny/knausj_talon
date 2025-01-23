code.language: scala
-
tag(): user.code_imperative
tag(): user.code_object_oriented

tag(): user.code_block_c_like
tag(): user.code_comment_line
tag(): user.code_comment_block_c_like
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_libraries
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_lambda
tag(): user.code_operators_math

settings():
    user.code_private_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_function_formatter = "PRIVATE_CAMEL_CASE"
    user.code_private_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_protected_variable_formatter = "PRIVATE_CAMEL_CASE"
    user.code_public_variable_formatter = "PRIVATE_CAMEL_CASE"

lodge {user.scala_modifier}: insert("{user.scala_modifier} ")

lodge {user.scala_keyword}: insert("{scala_keyword} ")

lodge right arrow: " -> "
lodge left arrow: " <- "
lodge plus plus: " ++ "
lodge subtype: " <: "

lodge match: user.code_state_switch()

block string:
    insert('""""""')
    key("left left left")
