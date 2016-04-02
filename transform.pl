#!/usr/bin/perl

  use XML::LibXSLT;
  use XML::LibXML;

  my $parser = XML::LibXML->new();
  my $xslt = XML::LibXSLT->new();

  my $source = $parser->parse_file('works/works.xml');
  my $style_doc = $parser->parse_file('works.xsl');

  my $stylesheet = $xslt->parse_stylesheet($style_doc);

  my $results = $stylesheet->transform($source);

  my $output = $stylesheet->output_string($results);

  $output =~ s/&amp;nbsp;/&nbsp;/gi;
  $output =~ s/&amp;#(x?[0-9a-fA-F]{4});/&#$1;/gi;
  
  print $output;