# Sección lining
#model	BasicBuilder -ndm	2	-ndf 3
set secTag 24
#set matTag $IDconcCover
set matTag 7
set matTag2 9
set matTag3 8
set numSubdivIJ 20
set numSubdivJK	20
set zI -0.5 
set yI -0.0 
set zJ 0.5
set yJ -0.0 
set zK 0.5 
set yK 0.15 
set zL -0.5 
set yL 0.15

set numFiber 7
set areaFiber [expr 295.0/1000*150/1000000]
set zStart -0.45 
set yStart 0.1 
set zEnd 0.45 
set yEnd 0.1
set yStart2 -0.1 
set yEnd2 -0.1

set A1 [expr 615.75/1000000]
set A2 [expr 380.1/1000]

section Fiber 24 {
patch quad $matTag $numSubdivIJ $numSubdivJK $yI $zI $yJ $zJ $yK $zK $yL $zL
layer straight $matTag2 $numFiber $areaFiber $yStart $zStart $yEnd $zEnd
layer straight $matTag2 $numFiber $areaFiber $yStart2 $zStart $yEnd2 $zEnd
layer straight $matTag3 2 $A2 0.05 0.05 0.05 -0.05
#fiber 450 30 $A2 $matTag3
#fiber 550 30 $A2 $matTag3
layer straight $matTag3 1 $A1 -0.095 0 -0.095 0 
#fiber 500 120 $A1 $matTag3

}

set hsost	0.150
set bsost	1.0
set bsostaux	[expr $bsost/2]
set cover 0.050
set distphi22malla	[expr 0.050]
set Hmarco	0.145

set numSubdivY	40
set numSubdivZ	40

set Asmalla	[expr (7.5*7.5*3.1415/4)*1.0/1000000]
set As22	[expr (22*22*3.1415/4)*1.0/1000000]
set As28	[expr (28*28*3.1415/4)*1.0/1000000]

set zI -0.5 
set yI 0.0 
set zJ -0.5
set yJ 0.15 
set zK 0.5 
set yK 0.15 
set zL 0.5 
set yL 0.0

section Fiber 31 {
	# hormigón sostenimiento
	patch rect 7 $numSubdivY $numSubdivZ [expr 0] [expr -$bsostaux] [expr $hsost] [expr $bsostaux]
	#patch quad 7 $numSubdivIJ $numSubdivJK $yI $zI $yJ $zJ $yK $zK $yL $zL
	
	# Acero ReinforcingSteel AT56-50H
	# malla de abajo 
	layer straight 9 6 $Asmalla [expr -$cover+$hsost] [expr -$bsostaux+$cover] [expr -$cover+$hsost] [expr -$cover+$bsostaux]
	#layer straight 9 7 $As [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	
	#Acero A630S
	# 2 barras del 22
	layer straight 8 2 $As22 [expr -$cover-$distphi22malla+$hsost] [expr -$Hmarco/2] [expr -$cover-$distphi22malla+$hsost] [expr +$Hmarco/2]	
	# 1 barra del 28
	fiber [expr -$cover-$distphi22malla+$hsost-$Hmarco] 0 $As28 8
}



# revestimiento de hormigón con una malla
section Fiber 2444 {
	# hormigón revestimiento
	patch rect 7 $numSubdivY $numSubdivZ [expr -$hsost] [expr -$bsostaux] [expr 0] [expr $bsostaux]
	
	# Acero ReinforcingSteel AT56-50H
	# malla de arriba 
	layer straight 9 6 $Asmalla [expr +$cover-$hsost] [expr -$bsostaux+$cover] [expr $cover-$hsost] [expr -$cover+$bsostaux]
	#layer straight 9 7 $As [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	
	#Acero A630S
	# 2 barras del 22
	#layer straight 5 2 $As22 [expr $cover+$distphi22malla-$hsost] [expr $Hmarco/2] [expr $cover+$distphi22malla-$hsost] [expr -$Hmarco/2]	
	# 1 barra del 28
	#fiber [expr $cover+$distphi22malla-$hsost+$Hmarco] 0 $As28 5
}



## Sección Vigas

#set secTag 2
#set E 100000000000
#set A 10000000
#set Iz 83333333333333

#section Elastic $secTag $E $A $Iz; # <$Iy $G $J>
