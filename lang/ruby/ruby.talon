code.language: ruby
-
tag(): user.code_imperative
tag(): user.code_object_oriented

tag(): user.code_comment_line
tag(): user.code_comment_documentation
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
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

args pipe: user.insert_between("|", "|")

# NOTE: this command is created for backward compatibility, but the documentation comments are not actually strings in Ruby.
dock string: user.code_comment_documentation()

lodge end: "end"
lodge begin: "begin"
lodge rescue: "rescue "
lodge module: "module "

^instance <user.text>$:
    insert("@")
    user.code_public_variable_formatter(text)
