#!/usr/bin/perl
use 5.008;
use strict;
use Memoize;
 
# usage:
# git-large-files 500k
# git-large-files 0.5m
# git-large-files 5b
 
sub usage { die "usage: git-large-files <size[b|k|m]> [<git-log arguments ...>]\n" }
 
@ARGV or usage();
my ( $max_size, $unit ) = ( shift =~ /^(\d+)([bkm]?)\z/ ) ? ( $1, $2 ) : usage();
 
my $exp = 10 * ( $unit eq 'b' ? 0 : $unit eq 'k' ? 1 : 2 );
my $cutoff = $max_size * 2**$exp;
 
sub walk_tree {
    my ( $tree, @path ) = @_;
    my @subtree;
    my @r;
 
    {
        open my $ls_tree, '-|', git => 'ls-tree' => -l => $tree
            or die "Couldn't open pipe to git-ls-tree: $!\n";
 
        while ( <$ls_tree> ) {
            my ( $type, $sha1, $size, $name ) = /\A[0-7]{6} (\S+) (\S+) +(\S+)\t(.*)/;
            if ( $type eq 'tree' ) {
                push @subtree, [ $sha1, $name ];
            }
            elsif ( $type eq 'blob' and $size >= $cutoff ) {
                push @r, [ $size, @path, $name ];
            }
        }
    }
 
    push @r, walk_tree( $_->[0], @path, $_->[1] )
        for @subtree;
 
    return @r;
}
 
memoize 'walk_tree';
 
open my $log, '-|', git => log => @ARGV, '--pretty=format:%T %h %cr'
    or die "Couldn't open pipe to git-log: $!\n";
 
my %seen;
while ( <$log> ) {
    chomp;
    my ( $tree, $commit, $age ) = split " ", $_, 3;
    my $is_header_printed;
    for ( walk_tree( $tree ) ) {
        my ( $size, @path ) = @$_;
        my $path = join '/', @path;
        next if $seen{ $path }++;
        print "$commit $age\n" if not $is_header_printed++;
        print "\t$size\t$path\n";
    }
}