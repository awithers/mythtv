package ndfdXML;

# -- generated by SOAP::Lite (v0.60) for Perl -- soaplite.com -- Copyright (C) 2000-2001 Paul Kulchenko --
# -- generated from http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl [Tue Jun 13 14:37:18 2006]

my %methods = (
  NDFDgenByDay => {
    endpoint => 'http://graphical.weather.gov/xml/SOAP_server/ndfdXMLserver.php',
    soapaction => 'http://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl#NDFDgenByDay',
    uri => 'http://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl',
    parameters => [
      SOAP::Data->new(name => 'latitude', type => 'xsd:decimal', attr => {}),
      SOAP::Data->new(name => 'longitude', type => 'xsd:decimal', attr => {}),
      SOAP::Data->new(name => 'startDate', type => 'xsd:date', attr => {}),
      SOAP::Data->new(name => 'numDays', type => 'xsd:integer', attr => {}),
      SOAP::Data->new(name => 'format', type => 'typens:formatType', attr => {}),
    ],
  },
  NDFDgen => {
    endpoint => 'http://graphical.weather.gov/xml/SOAP_server/ndfdXMLserver.php',
    soapaction => 'http://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl#NDFDgen',
    uri => 'http://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl',
    parameters => [
      SOAP::Data->new(name => 'latitude', type => 'xsd:decimal', attr => {}),
      SOAP::Data->new(name => 'longitude', type => 'xsd:decimal', attr => {}),
      SOAP::Data->new(name => 'product', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'startTime', type => 'xsd:dateTime', attr => {}),
      SOAP::Data->new(name => 'endTime', type => 'xsd:dateTime', attr => {}),
      SOAP::Data->new(name => 'Unit', type => 'xsd:string', attr => {}),
      SOAP::Data->new(name => 'weatherParameters', type => 'typens:weatherParametersType', attr => {}),
    ],
  },
);

use SOAP::Lite;
use Exporter;
use Carp ();

use vars qw(@ISA $AUTOLOAD @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter SOAP::Lite);
@EXPORT_OK = (keys %methods);
%EXPORT_TAGS = ('all' => [@EXPORT_OK]);

no strict 'refs';
for my $method (@EXPORT_OK) {
  my %method = %{$methods{$method}};
  *$method = sub {
    my $self = UNIVERSAL::isa($_[0] => __PACKAGE__) 
      ? ref $_[0] ? shift # OBJECT
                  # CLASS, either get self or create new and assign to self
                  : (shift->self || __PACKAGE__->self(__PACKAGE__->new))
      # function call, either get self or create new and assign to self
      : (__PACKAGE__->self || __PACKAGE__->self(__PACKAGE__->new));
    $self->proxy(($method{endpoint} || Carp::croak "No server address (proxy) specified"), options => {compress_threshold => 10000}) unless $self->proxy;
    my @templates = @{$method{parameters}};
    my $som = $self
      -> endpoint($method{endpoint})
      -> uri($method{uri})
      -> on_action(sub{qq!"$method{soapaction}"!})
      -> call($method => map {@templates ? shift(@templates)->value($_) : $_} @_);

    (UNIVERSAL::isa($som => 'SOAP::SOM') ?
     (wantarray ? $som->paramsall : $som->result) : $som);
  }
}

sub AUTOLOAD {
  my $method = substr($AUTOLOAD, rindex($AUTOLOAD, '::') + 2);
  return if $method eq 'DESTROY';

  die "Unrecognized method '$method'. List of available method(s): @EXPORT_OK\n";
}

1;
