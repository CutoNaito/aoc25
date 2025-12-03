sub part1 {
    open(DATA, "<input");

    $result = 0;

    while ( my $line = <DATA> ) {
        $left = 0;
        $right = 0;
        $left_index = 0;

        for ( $i = 0; $i < length($line) - 2; $i = $i + 1 ) {
            if ( substr($line, $i, 1) > $left ) {
                $left = substr($line, $i, 1);
                $left_index = $i;
            }
        }

        for ( $i = $left_index + 1; $i < length($line) - 1; $i = $i + 1 ) {
            if ( substr($line, $i, 1) > $right ) {
                $right = substr($line, $i, 1);
            }
        }
        
        print $left . $right;
        print "\n";
        $result = $result + ($left . $right);
    }

    print $result;
}

part1();
