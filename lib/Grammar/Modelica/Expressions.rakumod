unit role Grammar::Modelica::Expressions;

rule expression {
  ||  'if' <expression> 'then' <expression> [
        'elseif' <expression> 'then' <expression>
      ]*
      'else' <expression>
  ||  <simple_expression>
}

rule simple_expression {
  <logical_expression> [
    ':' <logical_expression> [
      ':' <logical_expression>
    ]?
  ]?
}

rule logical_expression {
  <logical_term> [ 'or' <logical_term> ]*
}

rule logical_term {
  <logical_factor> [ 'and' <logical_factor> ]*
}

rule logical_factor {
  'not'? <relation>
}

rule relation {
  <arithmetic_expression> [ <relational_operator> <arithmetic_expression> ]?
}

rule arithmetic_expression {
  <add_operator>? <term> [ <add_operator> <term> ]*
}

rule term {
  <factor> [ <mul_operator> <factor> ]*
}

rule factor {
  <primary> [
    [ '^' || '.^' ] <primary>
  ]?
}

rule primary {
  ||  <UNSIGNED_NUMBER>
  ||  <STRING>
  ||  'false'
  ||  'true'
  ||  [<component_reference>||'der'||'initial'||'pure'] <function_call_args>
  ||  <component_reference>
  ||  '(' <output_expression_list> ')'
  ||  '[' <expression_list> [ ';' <expression_list> ]* ']'
  ||  '{' <array_arguments> '}'
  ||  'end'
}

token type_specifier {"."?<name>}

rule name { <IDENT> [ '.' <IDENT> ]* }

rule component_reference {
  '.'? <IDENT> <array_subscripts>? ['.' <IDENT> <array_subscripts>? ]*
}

rule function_call_args {
  '(' <function_arguments>? ')'
}

rule function_arguments {
  ||  <|w>'function'<|w> <name> '(' <named_arguments>? ')'  [ ',' <function_arguments_non_first> ]?
  ||  <named_arguments>
  ||  <expression> [ [ ',' <function_arguments_non_first> ] || [ <|w>'for'<|w> <for_indices>] ]?
}

rule function_arguments_non_first {
  <named_arguments> ||
  [ <function_argument> [ ',' <function_arguments_non_first> ]? ]
}

rule array_arguments {
  <expression>  [
    ||',' <array_arguments_non_first>
    || 'for' <for_indices>
  ]?
}

rule array_arguments_non_first {
  <expression>  [ ',' <array_arguments_non_first> ]?
}

rule named_arguments {
  <named_argument> [',' <named_arguments>]?
}

rule named_argument {
  <IDENT> '=' <function_argument>
}

rule function_argument {
  ['function' <name> '(' <named_arguments>? ')' ] ||
  <expression>
}

rule output_expression_list {
  <expression>? [ ',' <expression>? ]*
}

rule expression_list { <expression> [ ',' <expression> ]* }

rule array_subscripts { "[" <subscript> [ "," <subscript> ]* "]" }

rule subscript { ':' | <expression> }

rule string_comment { <ws>? [ <STRING> [ '+' <STRING> ]* ]? }

rule comment { <string_comment> <annotation>? }

rule annotation { 'annotation' <class_modification> }

token add_operator {'+'|'-'|'.+'|'.-'}

token mul_operator {'*'|'/'|'.*'|'./'}

token relational_operator {"<"|"<="|">"|">="|"=="|"<>"}

# vim: expandtab shiftwidth=4
