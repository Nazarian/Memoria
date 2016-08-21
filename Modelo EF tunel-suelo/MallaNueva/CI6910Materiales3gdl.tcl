# HORMIGÓN LINING 
#model	BasicBuilder -ndm	2	-ndf 3

set matTag 7
set fpcc	-55000000.0
set epcc	-0.0025
set Ec	25000000000.0
set rc	8
set xcrn	1.035
set ft	3000000.0
set et	0.00015
set rt	1.2
set xcrp	1000
set gap 	0

uniaxialMaterial ConcreteCM $matTag $fpcc $epcc $Ec $rc $xcrn $ft $et $rt $xcrp -GapClose $gap

puts "  Material hormigón definido";


# ACERO 1 LINING (MARCO)


# ReinforcingSteel 
set matTag 9999999
set fy	450000000.0
set fu	680000000.0
set Es	200000000000.0
set Esh	80000000000.0
set esh	[expr 1.2*$fy/$Es]
set eult	0.09
set meult	[expr -$eult]

uniaxialMaterial ReinforcingSteel $matTag $fy $fu $Es $Esh $esh $eult

uniaxialMaterial MinMax 8 9999999 -min $meult -max $eult


# ACERO 2 LINING (MALLA)

# ReinforcingSteel 
set matTag 444444
set fy	500000000.0
set fu	710000000.0
set Es	200000000000.0
set Esh	150000000000.0
set esh	[expr 1.01*$fy/$Es]
set eult	0.02
set meult	[expr -$eult]

uniaxialMaterial ReinforcingSteel $matTag $fy $fu $Es $Esh $esh $eult 

uniaxialMaterial MinMax 9 444444 -min $meult -max $eult

puts "  Material aceros definido";
