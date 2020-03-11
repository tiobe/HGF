package HGF::Protocol::http;

use base qw(LWP::Protocol::http);

# Implements a connect timeout of 2 sec
# Source: http://cpanforum.com/posts/10170
sub _new_socket {
  my $self=shift;
  my $timeout = pop(@_);

  push(@_,2);
  my $ret =$self->SUPER::_new_socket(@_);

  $ret->timeout($timeout);
  return $ret;
};

package HGF::Protocol::http::Socket;

use vars qw(@ISA);

@ISA = qw(LWP::Protocol::http::Socket);

1;
