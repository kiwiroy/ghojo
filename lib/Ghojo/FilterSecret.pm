use v5.24;
use feature qw(signatures);

package Ghojo::FilterSecret 0.001 {
  use Mojo::Base qw{Log::Log4perl::Filter};
  no warnings qw(experimental::signatures);
  sub new ($class) { return bless {name => 'GhojoLoggerFilter'}, $class; }

  sub ok ($self, %p) {
    $p{message}
      = [map {s/<[0-9a-f]{40}>/<****** masked github access token ******>/}
        @{$p{message}}];
    return 1;
  }
}

1;
