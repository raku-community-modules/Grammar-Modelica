use Grammar::Modelica::LexicalConventions;
use Grammar::Modelica::ClassDefinition;
use Grammar::Modelica::Extends;
use Grammar::Modelica::ComponentClause;
use Grammar::Modelica::Modification;
use Grammar::Modelica::Equations;
use Grammar::Modelica::Expressions;

unit grammar Grammar::Modelica
  does Grammar::Modelica::LexicalConventions
  does Grammar::Modelica::ClassDefinition
  does Grammar::Modelica::Extends
  does Grammar::Modelica::ComponentClause
  does Grammar::Modelica::Modification
  does Grammar::Modelica::Equations
  does Grammar::Modelica::Expressions;

rule TOP {^ <within>?<class_def>* $}

rule within { 'within' <name>? ';' }

rule class_def { 'final'? <class_definition> ';' }

rule bgs { 'cou!!asdfafsd!!'  }

=begin pod

=head1 NAME

Grammar::Modelica - A Grammar for the Modelica programming language

=head1 SYNOPSIS

=begin code :lang<raku>

use Grammar::Modelica;

=end code

=head1 DESCRIPTION

A Raku Grammar for the L<Modelica Language Specification 3.4|https://www.modelica.org/documents/ModelicaSpec34.pdf> (pdf).

The Grammar is mostly a direct translation of the concrete syntax
specification found in Appendix B.

See the test files to get some idea of what is going on.

=head1 TODO

=item make use of proto and more named parameters to make it more useful
=item more stuff by and by

=head1 AUTHOR

Steven Albano

=head1 COPYRIGHT AND LICENSE

Copyright 2017 - 2018 Steven Albano

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
