wipe all

model basic -ndm 2 -ndf 3

#########################################################################
# MATERIALES
#########################################################################

# Hormigones

# ConcreteCM (Chang Mander) Sin fibras
set matTag 1
set fpcc	-55
set epcc	-0.0025
set Ec	25000
set rc	8
set xcrn	1.035
set ft	3
set et	0.00015
set rt	1.8
set xcrp	10000
set gap 	0

uniaxialMaterial ConcreteCM $matTag $fpcc $epcc $Ec $rc $xcrn $ft $et $rt $xcrp -GapClose $gap

# ConcreteCM (Chang Mander) Con fibras de acero
set matTag 2
set fpcc	-60
set epcc	-0.0035
set Ec	25000
set rc	9
set xcrn	1.035
set ft	3.2
set et	0.00015
set rt	0.7
set xcrp	10000.0
set gap 	0

uniaxialMaterial ConcreteCM $matTag $fpcc $epcc $Ec $rc $xcrn $ft $et $rt $xcrp -GapClose $gap

# ConcreteCM (Chang Mander) 
set matTag 3
set fpcc	-62
set epcc	-0.0034
set Ec	25000
set rc	9
set xcrn	1.035
set ft	2.8
set et	0.00015
set rt	0.6
set xcrp	1000.0
set gap 	0

uniaxialMaterial ConcreteCM $matTag $fpcc $epcc $Ec $rc $xcrn $ft $et $rt $xcrp -GapClose $gap

# Aceros 

# ReinforcingSteel AT56-50H

set matTag 44
set fy	500
set fu	710
set Es	200000
set Esh	150000
set esh	[expr 1.01*$fy/$Es]
set eult	0.018
set meult	[expr -$eult]

uniaxialMaterial ReinforcingSteel $matTag $fy $fu $Es $Esh $esh $eult

uniaxialMaterial MinMax 4 44 -min $meult -max $eult

# ReinforcingSteel A630S
set matTag 99
set fy	450
set fu	680
set Es	200000
set Esh	20000
set esh	[expr 1.2*$fy/$Es]
set eult	0.09
set meult	[expr -$eult]

uniaxialMaterial ReinforcingSteel $matTag $fy $fu $Es $Esh $esh $eult -IsoHard	3.0 0.01

uniaxialMaterial MinMax 5 99 -min $meult -max $eult


#########################################################################
# Secciones
#########################################################################



set hsost	150
set bsost	1000
set bsostaux	[expr $bsost/2]
set cover 50
set distphi22malla	[expr 50]
set Hmarco	145

set numSubdivY	80
set numSubdivZ	1

set Asmalla	[expr 7.5*7.5*3.1415/4]
set As22	[expr 22*22*3.1415/4]
set As28	[expr 28*28*3.1415/4]

# Sostenimiento sin fibras, con malla y marco 
section Fiber 1 {
	# hormigón sostenimiento
	patch rect 1 $numSubdivY $numSubdivZ [expr -$hsost] [expr -$bsostaux] [expr 0] [expr $bsostaux]
	
	# Acero ReinforcingSteel AT56-50H
	# malla de abajo 
	layer straight 4 6 $Asmalla [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	#layer straight 5 7 $As [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	
	#Acero A630S
	# 2 barras del 22
	#layer straight 5 2 $As22 [expr $cover+$distphi22malla-$hsost] [expr $Hmarco/2] [expr $cover+$distphi22malla-$hsost] [expr -$Hmarco/2]	
	# 1 barra del 28
	#fiber [expr $cover+$distphi22malla-$hsost+$Hmarco] 0 $As28 5
}


# Sostenimiento con fibras de acero, sin malla y con marco 
section Fiber 2 {
	# hormigón sostenimiento
	patch rect 2 $numSubdivY $numSubdivZ [expr -$hsost] [expr -$bsostaux] [expr 0] [expr $bsostaux]
	
	#Acero A630S
	# 2 barras del 22
	#layer straight 5 2 $As22 [expr $cover+$distphi22malla-$hsost] [expr $Hmarco/2] [expr $cover+$distphi22malla-$hsost] [expr -$Hmarco/2]	
	# 1 barra del 28
	#fiber [expr $cover+$distphi22malla-$hsost+$Hmarco] 0 $As28 5
}


# Sostenimiento con fibras de acero, sin malla y con marco 
section Fiber 3 {
	# hormigón sostenimiento
	patch rect 3 $numSubdivY $numSubdivZ [expr -$hsost] [expr -$bsostaux] [expr 0] [expr $bsostaux]
	
	#Acero A630S
	# 2 barras del 22
	#layer straight 5 2 $As22 [expr $cover+$distphi22malla-$hsost] [expr $Hmarco/2] [expr $cover+$distphi22malla-$hsost] [expr -$Hmarco/2]	
	# 1 barra del 28
	#fiber [expr $cover+$distphi22malla-$hsost+$Hmarco] 0 $As28 5
}


# revestimiento de hormigón con una malla
section Fiber 4 {
	# hormigón revestimiento
	patch rect 1 $numSubdivY $numSubdivZ [expr 0] [expr -$bsostaux] [expr $hsost] [expr $bsostaux]
	
	# Acero ReinforcingSteel AT56-50H
	# malla de arriba 
	layer straight 4 6 $Asmalla [expr -$cover+$hsost] [expr $bsostaux-$cover] [expr -$cover+$hsost] [expr $cover-$bsostaux]
	#layer straight 5 7 $As [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	
	#Acero A630S
	# 2 barras del 22
	#layer straight 5 2 $As22 [expr $cover+$distphi22malla-$hsost] [expr $Hmarco/2] [expr $cover+$distphi22malla-$hsost] [expr -$Hmarco/2]	
	# 1 barra del 28
	#fiber [expr $cover+$distphi22malla-$hsost+$Hmarco] 0 $As28 5
}



# Sección completa Sin fibras
section Fiber 5 {
	# hormigón sostenimiento
	patch rect 1 $numSubdivY $numSubdivZ [expr 0] [expr -$bsostaux] [expr $hsost] [expr $bsostaux]
	
	# Acero ReinforcingSteel AT56-50H
	# malla de arriba 
	layer straight 4 6 $Asmalla [expr -$cover+$hsost] [expr $bsostaux-$cover] [expr -$cover+$hsost] [expr $cover-$bsostaux]
	#layer straight 5 7 $As [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	
	patch rect 1 $numSubdivY $numSubdivZ [expr -$hsost] [expr -$bsostaux] [expr 0] [expr $bsostaux]
	
	# Acero ReinforcingSteel AT56-50H
	# malla de abajo 
	layer straight 4 6 $Asmalla [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	#layer straight 5 7 $As [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	
	#Acero A630S
	# 2 barras del 22
	layer straight 5 2 $As22 [expr $cover+$distphi22malla-$hsost] [expr $Hmarco/2] [expr $cover+$distphi22malla-$hsost] [expr -$Hmarco/2]	
	# 1 barra del 28
	fiber [expr $cover+$distphi22malla-$hsost+$Hmarco] 0 $As28 5
}


# Sección completa Sin fibras
section Fiber 6 {
	# hormigón sostenimiento
	patch rect 1 $numSubdivY $numSubdivZ [expr 0] [expr -$bsostaux] [expr $hsost] [expr $bsostaux]
	
	
	# Acero ReinforcingSteel AT56-50H
	# malla de arriba 
	layer straight 4 6 $Asmalla [expr -$cover+$hsost] [expr $bsostaux-$cover] [expr -$cover+$hsost] [expr $cover-$bsostaux]
	#layer straight 5 7 $As [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	
	# hormigón sostenimiento
	patch rect 2 $numSubdivY $numSubdivZ [expr -$hsost] [expr -$bsostaux] [expr 0] [expr $bsostaux]
	
	#Acero A630S
	# 2 barras del 22
	layer straight 5 2 $As22 [expr $cover+$distphi22malla-$hsost] [expr $Hmarco/2] [expr $cover+$distphi22malla-$hsost] [expr -$Hmarco/2]	
	# 1 barra del 28
	fiber [expr $cover+$distphi22malla-$hsost+$Hmarco] 0 $As28 5
}


section Fiber 7 {
	# hormigón sostenimiento
	patch rect 1 $numSubdivY $numSubdivZ [expr 0] [expr -$bsostaux] [expr $hsost] [expr $bsostaux]
	
	
	# Acero ReinforcingSteel AT56-50H
	# malla de arriba 
	layer straight 4 6 $Asmalla [expr -$cover+$hsost] [expr $bsostaux-$cover] [expr -$cover+$hsost] [expr $cover-$bsostaux]
	#layer straight 5 7 $As [expr $cover-$hsost] [expr $bsostaux-$cover] [expr $cover-$hsost] [expr $cover-$bsostaux]
	
	# hormigón sostenimiento
	patch rect 2 $numSubdivY $numSubdivZ [expr -$hsost] [expr -$bsostaux] [expr 0] [expr $bsostaux]
	
	#Acero A630S
	# 2 barras del 22
	layer straight 5 3 $As22 [expr $cover+$distphi22malla-$hsost] [expr $Hmarco/2] [expr $cover+$distphi22malla-$hsost] [expr -$Hmarco/2]	
	# 1 barra del 28
	fiber [expr $cover+$distphi22malla-$hsost+$Hmarco] 0 $As28 5
}



#########################################################################
# Modelo
#########################################################################

# Procedimiento para analisis phi-M

proc MomentCurvaturepos {secTag axialLoad maxK {numIncr 100} } {
	# Define two nodes at (0,0)
	wipe
	node 1 0.0 0.0
	node 2 0.0 0.0

	# Fix all degrees of freedom except axial and bending
	fix 1 1 1 1
	fix 2 0 1 0

	# Define element
	#                         tag ndI ndJ  secTag
	element zeroLengthSection  1   1   2  $secTag

	# Create recorder
	recorder Node -file DiagphiMSM/sectiondisp$secTag$axialLoad.pos.out -closeOnWrite -time -node 2 -dof 3 disp
	recorder Node -file DiagphiMSM/sectionreac$secTag$axialLoad.pos.out -closeOnWrite -time -node 1 -dof 3 reaction

	# Define constant axial load
	pattern Plain 1 "Constant" {
		load 2 $axialLoad 0.0 0.0
	}

	# Define analysis parameters
	integrator LoadControl 0.0
	system SparseGeneral -piv;	# Overkill, but may need the pivoting!
	test NormUnbalance 1.0e-7 30 5
	numberer Plain
	constraints Plain
	algorithm Newton
	analysis Static

	# Do one analysis for constant axial load
	analyze 1

	# Define reference moment
	pattern Plain 2 "Linear" {
		load 2 0.0 0.0 1.0
	}

	# Compute curvature increment
	set dK [expr $maxK/$numIncr]

	# Use displacement control at node 2 for section analysis
	integrator DisplacementControl 2 3 [expr $dK]

	# Do the section analysis
	analyze $numIncr
}

proc MomentCurvatureneg {secTag axialLoad maxK {numIncr 100} } {
	# Define two nodes at (0,0)
	wipe all
	node 1 0.0 0.0
	node 2 0.0 0.0

	# Fix all degrees of freedom except axial and bending
	fix 1 1 1 1
	fix 2 0 1 0

	# Define element
	#                         tag ndI ndJ  secTag
	element zeroLengthSection  1   1   2  $secTag

	# Create recorder
	recorder Node -file DiagphiMSM/sectiondisp$secTag$axialLoad.neg.out -closeOnWrite -time -node 2 -dof 3 disp
	recorder Node -file DiagphiMSM/sectionreac$secTag$axialLoad.neg.out -closeOnWrite -time -node 1 -dof 3 reaction

	# Define constant axial load
	pattern Plain 1 "Constant" {
		load 2 $axialLoad 0.0 0.0
	}

	# Define analysis parameters
	integrator LoadControl 0.0
	system SparseGeneral -piv;	# Overkill, but may need the pivoting!
	test NormUnbalance 1.0e-7 30 5
	numberer Plain
	constraints Plain
	algorithm Newton
	analysis Static

	# Do one analysis for constant axial load
	analyze 1

	# Define reference moment
	pattern Plain 2 "Linear" {
		load 2 0.0 0.0 1.0
	}

	# Compute curvature increment
	set dK [expr $maxK/$numIncr]

	# Use displacement control at node 2 for section analysis
	integrator DisplacementControl 2 3 [expr -$dK]

	# Do the section analysis
	analyze $numIncr
}

######################################################
# Diags M phi discretos

if 1 {
	set numIncr 300;	

	# Sostenimiento sin fibras 

	MomentCurvaturepos 1 0 0.00092 $numIncr
	MomentCurvaturepos 1 [expr -350000] 0.00085 $numIncr
	MomentCurvaturepos 1 [expr -1000000] 0.00062 $numIncr
	#MomentCurvaturepos 1 [expr -900000] 0.0005 $numIncr
	MomentCurvaturepos 1 [expr -1800000] 0.00043 $numIncr

	MomentCurvatureneg 1 0 0.00045 $numIncr
	MomentCurvatureneg 1 [expr -350000] 0.00052 $numIncr
	MomentCurvatureneg 1 [expr -1000000] 0.00037 $numIncr
	#MomentCurvatureneg 1 [expr -900000] 0.0005 $numIncr
	MomentCurvatureneg 1 [expr -1800000] 0.0002 $numIncr

	# Sostenimiento fibras de acero
	MomentCurvaturepos 2 0 0.00089 $numIncr
	MomentCurvaturepos 2 [expr -350000] 0.00083 $numIncr
	MomentCurvaturepos 2 [expr -1000000] 0.00062 $numIncr
	#MomentCurvaturepos 2 [expr -900000] 0.0005 $numIncr
	MomentCurvaturepos 2 [expr -1800000] 0.00043 $numIncr

	MomentCurvatureneg 2 0 0.00041 $numIncr
	MomentCurvatureneg 2 [expr -350000] 0.00045 $numIncr
	MomentCurvatureneg 2 [expr -1000000] 0.00037 $numIncr
	#MomentCurvatureneg 2 [expr -900000] 0.0005 $numIncr
	MomentCurvatureneg 2 [expr -1800000] 0.0002 $numIncr

	# Sostenimiento fibras de polipropileno
	MomentCurvaturepos 3 0 0.00089 $numIncr
	MomentCurvaturepos 3 [expr -350000] 0.00083 $numIncr
	MomentCurvaturepos 3 [expr -1000000] 0.00062 $numIncr
	#MomentCurvaturepos 3 [expr -900000] 0.0005 $numIncr
	MomentCurvaturepos 3 [expr -1800000] 0.00043 $numIncr

	MomentCurvatureneg 3 0 0.00041 $numIncr
	MomentCurvatureneg 3 [expr -350000] 0.00045 $numIncr
	MomentCurvatureneg 3 [expr -1000000] 0.00037 $numIncr
	#MomentCurvatureneg 3 [expr -900000] 0.0005 $numIncr
	MomentCurvatureneg 3 [expr -1800000] 0.0002 $numIncr

}

######################################################
# Diagramas de interacción sostenimientos

if 1 {
	array set PesSF [list 1 450000 2 0 3 -550000 4 -1100000 5 -1650000 6 -2200000 7 -2750000 8 -3300000 9 -3850000 10 -4400000 11 -4950000 12 -5500000 13 -6050000 14 -6600000 15 -7150000 16 -7700000 17 -8250000 18 -9000000]
	array set PesFA [list 1 480000 2 0 3 -600000 4 -1200000 5 -1800000 6 -2400000 7  -3000000 8 -3600000 9 -4200000 10 -4800000 11 -5400000 12 -6000000 13 -6600000 14 -7200000 15 -7800000 16 -8400000 17 -9000000 18 -9800000]
	array set PesFP [list 1 420000 2 0 3 -620000 4 -1240000 5 -1860000 6 -2480000 7  -3100000 8 -3720000 9 -4340000 10 -4960000 11 -5580000 12 -6200000 13 -6820000 14 -7440000 15 -8060000 16 -8680000 17 -9300000 18 -10000000]
	
	for {set i 1} {$i < 18} {incr i} {
		MomentCurvaturepos 1 $PesSF($i) 0.00092 $numIncr
		MomentCurvaturepos 2 $PesFA($i) 0.00092 $numIncr
		MomentCurvaturepos 3 $PesFP($i) 0.00092 $numIncr
		#MomentCurvaturepos 4 [expr 2*$PesSF($i)] 0.00092 $numIncr
		#MomentCurvaturepos 5 [expr 2*$PesFA($i)] 0.00092 $numIncr
		#MomentCurvaturepos 6 [expr 2*$PesFP($i)] 0.00092 $numIncr
		MomentCurvatureneg 1 $PesSF($i) 0.00077 $numIncr
		MomentCurvatureneg 2 $PesFA($i) 0.00077 $numIncr
		MomentCurvatureneg 3 $PesFP($i) 0.00077 $numIncr
		#MomentCurvatureneg 4 [expr 2*$PesSF($i)] 0.00077 $numIncr
		#MomentCurvatureneg 5 [expr 2*$PesFA($i)] 0.00077 $numIncr
		#MomentCurvatureneg 6 [expr 2*$PesFP($i)] 0.00077 $numIncr
	}
}

######################################################
# Inclusión del revestimiento en la sección

if 1 {

	proc MomentCurvatureComppos {secTag axialLoad maxK {numIncr 100} } {
		# Define two nodes at (0,0)
		wipe
		node 1 0.0 0.0
		node 2 0.0 0.0

		# Fix all degrees of freedom except axial and bending
		fix 1 1 1 1
		fix 2 0 1 0

		# Define element
		#                         tag ndI ndJ  secTag
		element zeroLengthSection  1   1   2  $secTag
		element zeroLengthSection  2   1   2  4	; # Elemento en paralelo con los mismos nodos

		# Create recorder
		recorder Node -file DiagphiMTotalSM/sectiondisp$secTag$axialLoad.tot.pos.out -closeOnWrite -time -node 2 -dof 3 disp
		recorder Node -file DiagphiMTotalSM/sectionreac$secTag$axialLoad.tot.pos.out -closeOnWrite -time -node 1 -dof 3 reaction

		# Define constant axial load
		pattern Plain 1 "Constant" {
			load 2 $axialLoad 0.0 0.0
		}

		# Define analysis parameters
		integrator LoadControl 0.0
		system SparseGeneral -piv;	# Overkill, but may need the pivoting!
		test NormUnbalance 1.0e-7 30 5
		numberer Plain
		constraints Plain
		algorithm Newton
		analysis Static

		# Do one analysis for constant axial load
		analyze 1

		# Define reference moment
		pattern Plain 2 "Linear" {
			load 2 0.0 0.0 1.0
		}

		# Compute curvature increment
		set dK [expr $maxK/$numIncr]

		# Use displacement control at node 2 for section analysis
		integrator DisplacementControl 2 3 [expr $dK]

		# Do the section analysis
		analyze $numIncr
	}

	proc MomentCurvatureCompneg {secTag axialLoad maxK {numIncr 100} } {
		# Define two nodes at (0,0)
		wipe all
		node 1 0.0 0.0
		node 2 0.0 0.0

		# Fix all degrees of freedom except axial and bending
		fix 1 1 1 1
		fix 2 0 1 0

		# Define element
		#                         tag ndI ndJ  secTag
		element zeroLengthSection  1   1   2  $secTag
		element zeroLengthSection  2   1   2  4	; # Elemento en paralelo con los mismos nodos

		# Create recorder
		recorder Node -file DiagphiMTotalSM/sectiondisp$secTag$axialLoad.tot.neg.out -closeOnWrite -time -node 2 -dof 3 disp
		recorder Node -file DiagphiMTotalSM/sectionreac$secTag$axialLoad.tot.neg.out -closeOnWrite -time -node 1 -dof 3 reaction

		# Define constant axial load
		pattern Plain 1 "Constant" {
			load 2 $axialLoad 0.0 0.0
		}

		# Define analysis parameters
		integrator LoadControl 0.0
		system SparseGeneral -piv;	# Overkill, but may need the pivoting!
		test NormUnbalance 1.0e-7 30 5
		numberer Plain
		constraints Plain
		algorithm Newton
		analysis Static

		# Do one analysis for constant axial load
		analyze 1

		# Define reference moment
		pattern Plain 2 "Linear" {
			load 2 0.0 0.0 1.0
		}

		# Compute curvature increment
		set dK [expr $maxK/$numIncr]

		# Use displacement control at node 2 for section analysis
		integrator DisplacementControl 2 3 [expr -$dK]

		# Do the section analysis
		analyze $numIncr
	}

	if 1 {
		set numIncr 300;	

		# Sostenimiento sin fibras 

		MomentCurvatureComppos 1 0 0.00091 $numIncr
		MomentCurvatureComppos 1 [expr -2*350000] 0.00085 $numIncr
		MomentCurvatureComppos 1 [expr -2*1000000] 0.00060 $numIncr
		#MomentCurvatureComppos 1 [expr -2*900000] 0.0005 $numIncr
		MomentCurvatureComppos 1 [expr -2*1800000] 0.00043 $numIncr

		MomentCurvatureCompneg 1 0 0.00039 $numIncr
		MomentCurvatureCompneg 1 [expr -2*350000] 0.00043 $numIncr
		MomentCurvatureCompneg 1 [expr -2*1000000] 0.00037 $numIncr
		#MomentCurvatureCompneg 1 [expr -2*900000] 0.0005 $numIncr
		MomentCurvatureCompneg 1 [expr -2*1800000] 0.0002 $numIncr

		# Sostenimiento fibras de acero
		MomentCurvatureComppos 2 0 0.00087 $numIncr
		MomentCurvatureComppos 2 [expr -2*350000] 0.00083 $numIncr
		MomentCurvatureComppos 2 [expr -2*1000000] 0.00062 $numIncr
		#MomentCurvatureComppos 2 [expr -2*900000] 0.0005 $numIncr
		MomentCurvatureComppos 2 [expr -2*1800000] 0.00043 $numIncr

		MomentCurvatureCompneg 2 0 0.00039 $numIncr
		MomentCurvatureCompneg 2 [expr -2*350000] 0.00040 $numIncr
		MomentCurvatureCompneg 2 [expr -2*1000000] 0.00037 $numIncr
		#MomentCurvatureCompneg 2 [expr -2*900000] 0.0005 $numIncr
		MomentCurvatureCompneg 2 [expr -2*1800000] 0.0002 $numIncr

		# Sostenimiento fibras de polipropileno
		MomentCurvatureComppos 3 0 0.00087 $numIncr
		MomentCurvatureComppos 3 [expr -2*350000] 0.00083 $numIncr
		MomentCurvatureComppos 3 [expr -2*1000000] 0.00062 $numIncr
		#MomentCurvatureComppos 3 [expr -2*900000] 0.0005 $numIncr
		MomentCurvatureComppos 3 [expr -2*1800000] 0.00043 $numIncr

		MomentCurvatureCompneg 3 0 0.00039 $numIncr
		MomentCurvatureCompneg 3 [expr -2*350000] 0.00040 $numIncr
		MomentCurvatureCompneg 3 [expr -2*1000000] 0.00037 $numIncr
		#MomentCurvatureCompneg 3 [expr -2*900000] 0.0005 $numIncr
		MomentCurvatureCompneg 3 [expr -2*1800000] 0.0002 $numIncr

	}
	
	if 1 {
		array set PesSF [list  1 900000 2 0 3 -1100000 4 -2200000 5 -3300000 6 -4400000 7 -5500000 8 -6600000 9 -7700000 10 -8800000 11 -9900000 12 -11000000 13 -12100000 14 -13200000 15 -14300000 16 -15400000 17 -16500000]
		array set PesFA [list  1 930000 2 0 3 -1150000 4 -2300000 5 -3450000 6 -4600000 7 -5750000 8 -6900000 9 -8050000 10 -9200000 11 -10350000 12 -11500000 13 -12650000 14 -13800000 15 -14950000 16 -16100000 17 -17250000]
		array set PesFP [list  1 870000 2 0 3 -1170000 4 -2340000 5 -3510000 6 -4680000 7 -5850000 8 -7020000 9 -8190000 10 -9360000 11 -10530000 12 -11700000 13 -12870000 14 -14040000 15 -15210000 16 -16380000 17 -17550000]
	
		for {set i 1} {$i < 18} {incr i} {
			MomentCurvatureComppos 1 $PesSF($i) 0.00092 $numIncr
			MomentCurvatureComppos 2 $PesFA($i) 0.00092 $numIncr
			MomentCurvatureComppos 3 $PesFP($i) 0.00092 $numIncr
			MomentCurvatureCompneg 1 $PesSF($i) 0.00039 $numIncr
			MomentCurvatureCompneg 2 $PesFA($i) 0.00077 $numIncr
			MomentCurvatureCompneg 3 $PesFP($i) 0.00077 $numIncr
		}
	}
}



######################################################
# Análisis considerando desfases de carga


if 0 {
	

	proc MomentCurvatureComppos2 {secTag axialLoadmid axialLoad Mmid maxK {numIncr 100} } {
		# Define two nodes at (0,0)
		wipe
		node 1 0.0 0.0
		node 2 0.0 0.0

		# Fix all degrees of freedom except axial and bending
		fix 1 1 1 1
		fix 2 0 1 0

		# Define element
		#                         tag ndI ndJ  secTag
		element zeroLengthSection  1   1   2  $secTag

		# Create recorder
		recorder Node -file DiagphiMTotalDesfase/sectiondisp.$secTag.$axialLoadmid.$axialLoad.$Mmid.tot.pos.out -closeOnWrite -time -node 2 -dof 3 disp
		recorder Node -file DiagphiMTotalDesfase/sectionreac.$secTag.$axialLoadmid.$axialLoad.$Mmid.tot.pos.out -closeOnWrite -time -node 1 -dof 3 reaction

		# Define constant axial load
		pattern Plain 1 "Constant" {
			load 2 $axialLoadmid 0.0 0.0
		}

		# Define analysis parameters
		integrator LoadControl 0.0
		system SparseGeneral -piv;	# Overkill, but may need the pivoting!
		test NormUnbalance 1.0e-7 30 5
		numberer Plain
		constraints Plain
		algorithm Newton
		analysis Static

		# Do one analysis for constant axial load
		analyze 1

		# Define reference moment
		pattern Plain 2 "Constant" {
			load 2 0.0 0.0 $Mmid
		}

		# Compute curvature increment
		#set dK [expr $Kmid/$numIncr]

		# Use displacement control at node 2 for section analysis
		#integrator DisplacementControl 2 3 [expr $dK]
		integrator LoadControl 0.0

		# Do the section analysis
		#analyze $numIncr
		analyze 1
		
		element zeroLengthSection  2   1   2  4	; # Elemento en paralelo con los mismos nodos
		

		# Define constant axial load
		pattern Plain 3 "Constant" {
			load 2 [expr $axialLoad-$axialLoadmid] 0.0 0.0
		}

		# Define analysis parameters
		integrator LoadControl 0.0
		system SparseGeneral -piv;	# Overkill, but may need the pivoting!
		test NormUnbalance 1.0e-7 15 5
		numberer Plain
		constraints Plain
		algorithm Newton
		analysis Static

		# Do one analysis for constant axial load
		analyze 1

		# Define reference moment
		pattern Plain 4 "Linear" {
			load 2 0.0 0.0 1.0
		}

		# Compute curvature increment
		set dK [expr ($maxK)/$numIncr]

		# Use displacement control at node 2 for section analysis
		integrator DisplacementControl 2 3 [expr $dK]

		# Do the section analysis
		analyze $numIncr
		
	}

	proc MomentCurvatureCompneg2 {secTag axialLoadmid axialLoad Mmid maxK {numIncr 100} } {
		# Define two nodes at (0,0)
		wipe
		node 1 0.0 0.0
		node 2 0.0 0.0

		# Fix all degrees of freedom except axial and bending
		fix 1 1 1 1
		fix 2 0 1 0

		# Define element
		#                         tag ndI ndJ  secTag
		element zeroLengthSection  1   1   2  $secTag

		# Create recorder
		recorder Node -file DiagphiMTotalDesfase/sectiondisp.$secTag.$axialLoadmid.$axialLoad.$Mmid.tot.neg.out -closeOnWrite -time -node 2 -dof 3 disp
		recorder Node -file DiagphiMTotalDesfase/sectionreac.$secTag.$axialLoadmid.$axialLoad.$Mmid.tot.neg.out -closeOnWrite -time -node 1 -dof 3 reaction

		# Define constant axial load
		pattern Plain 1 "Constant" {
			load 2 $axialLoadmid 0.0 0.0
		}

		# Define analysis parameters
		integrator LoadControl 0.0
		system SparseGeneral -piv;	# Overkill, but may need the pivoting!
		test NormUnbalance 1.0e-7 30 5
		numberer Plain
		constraints Plain
		algorithm Newton
		analysis Static

		# Do one analysis for constant axial load
		analyze 1

		# Define reference moment
		pattern Plain 2 "Constant" {
			load 2 0.0 0.0 $Mmid
		}

		# Compute curvature increment
		#set dK [expr $Kmid/$numIncr]

		# Use displacement control at node 2 for section analysis
		#integrator DisplacementControl 2 3 [expr -$dK]
		integrator LoadControl 0.0

		# Do the section analysis
		#analyze $numIncr
		analyze 1
		
		
		element zeroLengthSection  2   1   2  4	; # Elemento en paralelo con los mismos nodos
		

		# Define constant axial load
		pattern Plain 3 "Constant" {
			load 2 [expr $axialLoad-$axialLoadmid] 0.0 0.0
		}

		# Define analysis parameters
		integrator LoadControl 0.0
		system SparseGeneral -piv;	# Overkill, but may need the pivoting!
		test NormUnbalance 1.0e-7 15 5
		numberer Plain
		constraints Plain
		algorithm Newton
		analysis Static

		# Do one analysis for constant axial load
		analyze 1

		# Define reference moment
		pattern Plain 4 "Linear" {
			load 2 0.0 0.0 1.0
		}

		# Compute curvature increment
		set dK [expr ($maxK)/$numIncr]

		# Use displacement control at node 2 for section analysis
		integrator DisplacementControl 2 3 [expr -$dK]

		# Do the section analysis
		analyze $numIncr
		
	}
		
	set numIncr 100
	
	array set PesMNSF [list  1 900000 2 0 3 -1100000 4 -2200000 5 -3300000 6 -4400000 7 -5500000 8 -6600000 9 -7700000 10 -8800000 11 -9900000 12 -11000000 13 -12100000 14 -13200000 15 -14300000 16 -15400000 17 -16500000]
	array set PesMNSF2 [list 1 450000 2 0 3 -550000 4 -1100000 5 -1650000 6 -2200000 7 -2750000 8 -3300000 9 -3850000 10 -4400000 11 -4950000 12 -5500000 13 -6050000 14 -6600000 15 -7150000 16 -7700000 17 -8250000]
	array set MesMNSFP [list  1 0 2 79698500 3 116332000 4 142037000 5 160371000 6 175948000 7 188104000 8 195918000 9 200476000 10 200822000 11 196001000 12 185214000 13 168032000 14 146274000 15 124628000 16 102306000 17 0]
	array set MesMNSFN [list    1 0 2 -145616000 3 -165571000 4 -181207000 5 -193059000 6 -199419000 7 -200478000 8 -199601000 9 -195696000 10 -187717000 11 -174841000 12 -156500000 13 -132181000 14 -102730000 15 -94028800 16 -37859300 17 0]

	array set PesMNFA [list  1 930000 2 0 3 -1150000 4 -2300000 5 -3450000 6 -4600000 7 -5750000 8 -6900000 9 -8050000 10 -9200000 11 -10350000 12 -11500000 13 -12650000 14 -13800000 15 -14950000 16 -16100000 17 -17250000]
	array set PesMNFA2 [list 1 480000 2 0 3 -600000 4 -1200000 5 -1800000 6 -2400000 7  -3000000 8 -3600000 9 -4200000 10 -4800000 11 -5400000 12 -6000000 13 -6600000 14 -7200000 15 -7800000 16 -8400000 17 -9000000]
	array set MesMNFAP [list  1 0 2 87390400 3 122254000 4 148086000 5 170484000 6 188335000 7 203984000 8 215991000 9 222867000 10 223466000 11 217654000 12 205966000 13 187441000 14 163835000 15 138196000 16 112084000 17 0]
	array set MesMNFAN [list   1 0 2 -155256000 3 -181582000 4 -201140000 5 -214605000 6 -222063000 7 -221812000 8 -218658000 9 -212381000 10 -202145000 11 -187295000 12 -167266000 13 -142643000 14 -112704000 15 -74183600 16 -33418800 17 0]

	array set PesMNFP [list  1 870000 2 0 3 -1170000 4 -2340000 5 -3510000 6 -4680000 7 -5850000 8 -7020000 9 -8190000 10 -9360000 11 -10530000 12 -11700000 13 -12870000 14 -14040000 15 -15210000 16 -16380000 17 -17550000]
	array set PesMNFP2 [list 1 420000 2 0 3 -620000 4 -1240000 5 -1860000 6 -2480000 7  -3100000 8 -3720000 9 -4340000 10 -4960000 11 -5580000 12 -6200000 13 -6820000 14 -7440000 15 -8060000 16 -8680000 17 -9300000]
	array set MesMNFPP [list   1 0 2 89233100 3 123938000 4 150997000 5 173752000 6 192197000 7 208149000 8 220150000 9 226753000 10 226873000 11 220314000 12 207200000 13 187869000 14 163498000 15 137420000 16 111295000 17 0]
	array set MesMNFPN [list   1 0 2 -156592000 3 -183732000 4 -203903000 5 -217859000 6 -225498000 7 -225435000 8 -222479000 9 -216133000 10 -205553000 11 -190096000 12 -169220000 13 -143725000 14 -112060000 15 -72923400 16 -32336800 17 0]


	array set Porcentajes [list 1 0.83 2 0.85 3 0.87 4 0.90 5 0.92]
	
	for {set i 2} {$i < 6} {incr i} {
		puts "caca"
		puts $i
		for {set j 1} {$j < 17} {incr j} {
			for {set l 1} {$l < 17} {incr l} {
				MomentCurvatureComppos2 1 [expr round($Porcentajes($i)*$PesMNSF2($j))] [expr round($PesMNSF($l))] [expr round($Porcentajes($i)*$MesMNSFP($j))] 0.001 $numIncr
				MomentCurvatureCompneg2 1 [expr round($Porcentajes($i)*$PesMNSF2($j))] [expr round($PesMNSF($l))] [expr round($Porcentajes($i)*$MesMNSFN($j))] 0.001 $numIncr
				MomentCurvatureComppos2 2 [expr round($Porcentajes($i)*$PesMNFA2($j))] [expr round($PesMNFA($l))] [expr round($Porcentajes($i)*$MesMNFAP($j))] 0.001 $numIncr
				MomentCurvatureCompneg2 2 [expr round($Porcentajes($i)*$PesMNFA2($j))] [expr round($PesMNFA($l))] [expr round($Porcentajes($i)*$MesMNFAN($j))] 0.001 $numIncr
				MomentCurvatureComppos2 3 [expr round($Porcentajes($i)*$PesMNFP2($j))] [expr round($PesMNFP($l))] [expr round($Porcentajes($i)*$MesMNFPP($j))] 0.001 $numIncr
				MomentCurvatureCompneg2 3 [expr round($Porcentajes($i)*$PesMNFP2($j))] [expr round($PesMNFP($l))] [expr round($Porcentajes($i)*$MesMNFPN($j))] 0.001 $numIncr
			}
		}
	}
}