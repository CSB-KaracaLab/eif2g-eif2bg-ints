#!/bin/csh -f
#
set found=`tail -n 500 $1 | grep "STRUCTURES FOR DOCKING IS SET TO 4000" | wc -l | awk '{print $1}'`

if ($found > 0)then
  echo "YOU HAVE TOO MANY MODELS IN YOUR STARTING STRUCTURES ENSEMBLES" >>FAILED
  echo "THE TOTAL NUMBER OF COMBINATIONS CAN NOT EXCEED 4000" >>FAILED
endif

set found=`tail -n 500 $1 | grep "CHAIN LENGHT FOR SYMMETRY RESTRAINTS DO NOT MATCH" | grep -v display | wc -l | awk '{print $1}'`

if ($found > 0) then
  tail -n 500 $1 |grep -A 1 "CHAIN LENGHT FOR SYMMETRY RESTRAINTS DO NOT MATCH" >>FAILED
endif

set found=`tail -n 500 $1 | grep "NCS-restraints error encountered: Improperly defined non-crystallographic symmetry" | wc -l | awk '{print $1}'`

if ($found > 0) then
  tail -n 500 $1 |grep "NCS-restraints error encountered: Improperly defined non-crystallographic symmetry" >>FAILED
endif

set found=`tail -n 500 $1 | grep "PARSER error encountered: Encountered too many parsing errors" | wc -l | awk '{print $1}'`

if ($found > 0) then
  tail -n 500 $1 |grep -B 10 "PARSER error encountered: Encountered too many parsing errors" >>FAILED
endif

set found=`tail -n 500 $i | grep "SELRPN error encountered: parsing error" | wc -l | awk '{print $1}'`

if ($found > 0) then
  tail -n 500 $1 |grep -B 10 "SELRPN error encountered: parsing error" >>FAILED
  echo "Check your restraint files " >>FAILED
endif

set found=`tail -n 500 $1 | grep "exceeded allocation for NOE-restraints" | wc -l | awk '{print $1}'`

if ($found > 0) then
  tail -n 500 $1 |grep "exceeded allocation for NOE-restraints" >>FAILED
  echo "Check your definition of active and passive residues" >>FAILED
  echo "Make sure to filter those for solvent accessibility"  >>FAILED
endif

set found=`tail -n 500 $1 | grep "SELRPN-ERR: unbalanced parentheses" | wc -l | awk '{print $1}'`

if ($found > 0) then
  tail -n 500 $1 |grep "SELRPN-ERR: unbalanced parentheses" >>FAILED
  echo "Check your restraints" >>FAILED
  echo "There is a syntax error"  >>FAILED
endif

set found=`tail -n 500 $1 | grep "not enough memory available to the program" | wc -l | awk '{print $1}'`

if ($found > 0) then
  head -n 100 $1 | grep "Running on" >>WARNING
  tail -n 500 $1 | grep "not enough memory available to the program" >>WARNING
  echo "Check your definition of active and passive residues"     >>WARNING
  echo "Make sure to filter those for solvent accessibility"      >>WARNING
  echo "Try to decrease the size of your system where possible"   >>WARNING
endif

if ( -e WARNING ) then
  set warnlength=`wc -l WARNING | awk '{print $1}'`
  # if more than 20 structures fail we will flag the run as failed.
  if ( $warnlength > 100 ) then
    \cat WARNING >FAILED
  endif
endif
