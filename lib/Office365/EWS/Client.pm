use strict;
use warnings;
package Office365::EWS::Client;
use Moose;
extends 'EWS::Client';
with qw/
    Office365::EWS::Client::Role::SOAP
/;
no Moose;
1;

# ABSTRACT: Office 365 Exchange Web Services client

__END__

=pod

=encoding UTF-8

=head1 NAME

Office365::EWS::Client - Office 365 Exchange Web Services client

=head1 VERSION

version 1.140390

=head1 SYNOPSIS

Set up your Office 365 Exchange Web Services client.

 use Office365::EWS::Client;
 use DateTime;
 
 my $ews = Office365::EWS::Client->new({
     server         => 'pod12345.outlook.com',
     username       => 'oliver@some.org',
     password       => 's3krit', # or set in $ENV{EWS_PASS}
 });

Then perform operations on the Exchange server:

 my $entries = $ews->calendar->retrieve({
     start => DateTime->now(),
     end   => DateTime->now->add( months => 1 ),
 });
 
 print "I retrieved ". $entries->count ." items\n";
 
 while ($entries->has_next) {
     print $entries->next->Subject, "\n";
 }
 
 my $contacts = $ews->contacts->retrieve;

=head1 DESCRIPTION

This module acts as a client to the Office 365 Exchange Web Services API. From
here you can access calendar and contact entries using the capabilities of 
L<EWS::Client>.

=head1 AUTHOR

Jesse Thompson <zjt@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Jesse Thompson.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut