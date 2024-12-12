unit role Grammar::Modelica::Extends;

rule extends_clause {
  'extends' <type_specifier> <class_modification>? <annotation>?
}

rule constraining_clause {
  'constrainedby' <type_specifier> <class_modification>?
}

# vim: expandtab shiftwidth=4
