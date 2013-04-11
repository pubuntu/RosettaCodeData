sub zig_zag {
    my ($w, $h, @r, $n) = @_;

    $r[ $_->[1] ][ $_->[0] ] = $n++	for
    	sort {	$a->[0] + $a->[1] <=> $b->[0] + $b->[1]	  or
		($a->[0] + $a->[1]) % 2
			? $a->[1] <=> $b->[1]
			: $a->[0] <=> $b->[0]
	}
	map  {	my $e = $_;
		map{ [$e, $_] } 0 .. $w-1
	} 0 .. $h - 1;
    @r
}

print map{ "@$_\n" } zig_zag(3, 5);