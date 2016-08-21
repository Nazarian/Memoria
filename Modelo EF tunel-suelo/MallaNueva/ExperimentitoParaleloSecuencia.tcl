# experimentito
wipe all
model BasicBuilder -ndm 2 -ndf 3

node 1	0	0
node 2	0	10
node 3	0	0
node 4	0	10

fix 1 1 1 1
fix 3 1 1 1 

geomTransf Linear 1
#geomTransf Corotational 2

#element elasticBeamColumn $eleTag $iNode $jNode $A $E $Iz $transfTag
element elasticBeamColumn 1 1 2 1 1 1 1
element elasticBeamColumn 2 3 4 1 1 1 1

#uniaxialMaterial Elastic $matTag $E
uniaxialMaterial Elastic 1 10000000

#element zeroLength 3 2 4 -mat 1 -dir 1 2 6
#element twoNodeLink 3 2 4 -mat 1 1 1 -dir 1 2 3
#equalDOF 2 4 1 2 3

recorder Node -file Nodosdisp.out -closeOnWrite -node 2 4 -dof 1 2 3 disp;
recorder Node -file Nodosreac.out -closeOnWrite -node 2 4 -dof 1 2 3 reaction;

recorder Element -file Elementosfuerzas.out -closeOnWrite -ele 1 2 force

pattern Plain 1 Linear {
	load 2 0 -0.1 0
}

constraints Plain
numberer Plain
system FullGeneral
test NormDispIncr 1.0E-9 50
algorithm Newton
integrator LoadControl 1
analysis Static
analyze 10


#equalDOF 2 4 1 2 3

uniaxialMaterial Elastic 42 1.0E+8
												
element	zeroLength	123 2	4	-mat	42	42	42	-dir	1	2	6


analyze 10



wipe

