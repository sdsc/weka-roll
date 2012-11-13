#!/usr/bin/perl -w
# weka roll installation test.  Usage:
# weka.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/weka';
my $output;

my $TESTFILE = 'tmpweka';

open(OUT, ">$TESTFILE.sh");
print OUT <<END;
#!/bin/bash
if test -f /etc/profile.d/modules.sh; then
  . /etc/profile.d/modules.sh
  module load weka
fi
java weka.classifiers.trees.J48 -t \$WEKAINSTALL/data/iris.arff
END
close(OUT);

# weka-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'weka installed');
} else {
  ok(! $isInstalled, 'weka not installed');
}
SKIP: {

  skip 'weka not installed', 4 if ! $isInstalled;
  $output = `/bin/bash $TESTFILE.sh 2>&1`;
  like($output, qr/Correctly Classified Instances\s+144/, 'weka test run');

  skip 'modules not installed', 3 if ! -f '/etc/profile.d/modules.sh';
  `/bin/ls /opt/modulefiles/applications/weka/[0-9]* 2>&1`;
  ok($? == 0, 'weka module installed');
  `/bin/ls /opt/modulefiles/applications/weka/.version.[0-9]* 2>&1`;
  ok($? == 0, 'weka version module installed');
  ok(-l '/opt/modulefiles/applications/weka/.version',
     'weka version module link created');

}

`rm -fr $TESTFILE* ~/wekafiles`;
