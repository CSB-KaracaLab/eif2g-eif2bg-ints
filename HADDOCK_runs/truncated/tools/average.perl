#!/usr/bin/perl
#
# A. Bonvin, ETHZ June 97
#
# average.perl : This script averages hydrogen bond data generated by
#                texchange.perl and bfactor.perl
#
#
##eval "exec /usr/bin/perl -S $0 $*"
##    if $running_under_some_shell;
			# this emulates #! processing on NIH machines.
			# (remove #! line above if indigestible)

eval '$'.$1.'$2;' while $ARGV[0] =~ /^([A-Za-z_]+=)(.*)/ && shift;
			# process any FOO=bar switches

$nx = 0;
$x = 0.0;
$xsd = 0.0;

while (<>) {
    chop;	# strip record separator
    @Fld = split(' ', $_, 9999);
    print $_ if $nawk;
    if (scalar @Fld == 1) {
	$x += $Fld[0];
	$xsd += $Fld[0] * $Fld[0];
	$nx += 1;
    }
}

if ($nx > 0) {
    $x = $x / $nx;
    $x2 = $xsd / $nx;

    if ($x2 - ($x * $x) < 0.000000001){
        $xsd = 0
    }
    else{
        $xsd = sqrt($x2 - ($x * $x));
    }
}
printf "%8.3f %8.3f\n", $x, $xsd;
