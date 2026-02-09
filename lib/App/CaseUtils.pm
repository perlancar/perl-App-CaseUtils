package App::CaseUtils;

use strict;
use warnings;
#use Log::ger;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{uppercase} = {
    v => 1.1,
    summary => 'Change input to upper case',
    description => <<'MARKDOWN',

This is basically a simple shortcut for something like:

    % perl -ne'print uc' INPUT ...
    % perl -pe'$_ = uc' INPUT ...

with some additional options.

MARKDOWN
    args => {
    },
};
sub uppercase {
    my %args = @_;

    while (<>) {
        print uc $_;
    }

    [200];
}

$SPEC{lowercase} = {
    v => 1.1,
    summary => 'Change input to lower case',
    description => <<'MARKDOWN',

This is basically a simple shortcut for something like:

    % perl -ne'print lc' INPUT ...
    % perl -pe'$_ = lc' INPUT ...

with some additional options.

MARKDOWN
    args => {
    },
};
sub lowercase {
    my %args = @_;

    while (<>) {
        print lc $_;
    }

    [200];
}

$SPEC{togglecase} = {
    v => 1.1,
    summary => 'Toggle case of input (lowercase to uppercase, while uppercase to lowercase)',
    description => <<'MARKDOWN',

MARKDOWN
    args => {
    },
};
sub togglecase {
    my %args = @_;

    while (<>) {
        s{(?:(\p{Lu})|(\p{Ll}))}{lc($1 // "") . uc($2 // "")}eg;
        print;
    }

    [200];
}

$SPEC{titlecase} = {
    v => 1.1,
    summary => 'Change case of input to title case (uppercase start of the word, lowercase the rest)',
    description => <<'MARKDOWN',

MARKDOWN
    args => {
    },
};
sub titlecase {
    my %args = @_;

    while (<>) {
        s/\b(\w)(\w*)\b/uc($1) . lc($2)/eg;
        print;
    }

    [200];
}

1;
# ABSTRACT: CLI utilities related to case (uppercase/lowercase)

=head1 DESCRIPTION

This distribution contains the following CLI utilities related to case
(uppercase/lowercase):

# INSERT_EXECS_LIST
