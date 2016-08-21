## CI6910v2 Francisco Nazar - Revestimiento de Túnel, Metro de Santiago, 2016. 
# Unidades: m, N, s, kg
wipe all;

# Tiempo inicial 
set TIME_start [clock clicks -milliseconds]

# Para visor de datos vtk (Paraview)
interp recursionlimit {} 140000
source opensees-vtk.tcl

puts "" 
puts ">Modelo"
## Constantes
set g -9.820 ;#m/s2
set gammas -22500.0; # N/m3
set gammas2 22500.0;#N/m3
set betaexcavacion 0.5

puts "Constantes definidas" 
 
### Modelo del suelo

## Nodos 
# Nodos suelo
source CI6910NodosSuelo.tcl; # nodos de la malla del suelo
source CI6910RemoverNodosIncorrectos.tcl; # remueve los nodos incorrectos de GID
source CI6910NodosCorregidos.tcl; # Coloca los nodos incorrectos con los GDL corregidos
puts "Nodos Suelo definidos";

# Nodos interfaz vigas
source CI6910NodosDummyViga.tcl; # Nodos dummy viga izquierda
source CI6910NodosDummyVigaDer.tcl; # Nodos dummy viga izquierda
puts "Nodos dummy vigas";

## Materiales de suelo, lining, viga, y resortes de interfaz
source CI6910Materiales.tcl
puts "Materiales 2dgl definidos" 

## Elementos
# Elementos Suelo
source CI6910ElementosSuelo.tcl
puts "Elementos Suelo definidos";

## Nodos
# Nodos Barra Rígida
source CI6910NodosViga.tcl
source CI6910NodosVigaDer.tcl
puts "Nodos Vigas definidos"

### Unión entre modelos 
# Conexión entre nodos en la misma ubicación
source CI6910equalDOFViga.tcl
source CI6910equalDOFVigaDer.tcl
#source CI6910equalDOFEntreVigas.tcl
source CI6910equalDOFEntreVigas2.tcl
puts "Equaldofs definidos"

## Condiciónes de borde
source CI6910CDBPorous.tcl
source CI6910CDBSueloAbajo.tcl
source CI6910CDBVigas.tcl
puts "Condiciones de borde definidas"


# Elementos Interfaz viga suelo
geomTransf Linear 1 

source CI6910ElementosInterfazViga.tcl
#source CI6910ElementosInterfazVigav2.tcl
source CI6910ElementosInterfazVigaDer.tcl
#source CI6910ElementosInterfazVigaDerv2.tcl
puts "Elementos Interfaz vigas definidos";

### Modelo Túnel y Viga rígida
 

## Transformaciones geométricas quedan igual
geomTransf Linear 2 
geomTransf Linear 3
puts "Transformaciones geométricas definidas"


## Elementos
# Elementos Barra rígida 
puts "Transformaciones geométricas definidas"
source CI6910ElementosViga.tcl
source CI6910ElementosVigaDer.tcl
puts "Elementos Viga definidos"



#source CI6910Recorders.tcl
#puts " -Recorders definidos"
#recorder pvd RecVTK eleResponse force
#recorder pvd RecVTK eleResponse strain
#recorder pvd RecVTK eleResponse force
#recorder pvd RecVTK disp

# A vtk

set fd [open "./Desplazamientos1.vtk" "w"]
set tsns	[open "./Tensiones1.vtk" "w"]
set dsns	[open "./Deformaciones1.vtk" "w"]

#print -ele 1
vtk_output_meta $fd
vtk_output_mesh $fd
vtk_output_meta $tsns
vtk_output_mesh $tsns
vtk_output_meta $dsns
vtk_output_mesh $dsns

vtk_output_cell_data_header $tsns
vtk_output_ele_resp_stresses $tsns "Inicio"

vtk_output_cell_data_header $dsns
vtk_output_ele_resp_strains $dsns "Inicio"

vtk_output_point_data_header $fd
vtk_output_node_disp $fd "Inicio"
#InitialStateAnalysis on 

source CI6910SoilsStage0.tcl
#puts "Soil Stage 0"

numberer RCM
#numberer Plain
#system SparseSYM
#system UmfPack -lvalueFact 35000
#system ProfileSPD
#system SparseGEN
#system BandSPD
system SparseSPD
#system SparseGeneral
test NormDispIncr 1.0e-7 1000 1 1
#test NormUnbalance 1 1000 1 1
#algorithm KrylovNewton
#algorithm ModifiedNewton -initial
#algorithm BFGS
#algorithm NewtonLineSearch
#algorithm SecantNewton
algorithm Newton
#constraints Penalty 1.e18 1.e18
#constraints Transformation
#constraints Lagrange
constraints Plain
#set nw 0.5
#set nw2 [expr pow($nw+0.5, 2)/4]
#integrator Newmark $nw $nw2
integrator LoadControl 1;# 0.1;

analysis Static
#analysis Transient 

#analyze 5 5.0e3
analyze 5


vtk_output_node_disp $fd "Gravedad_elastica"
vtk_output_ele_resp_stresses $tsns "Gravedad_elastica"
vtk_output_ele_resp_strains $dsns "Gravedad_elastica"

puts "Gravedad elástica"

source CI6910SoilsStage1.tcl
#source CI6910UpdateMaterialsBulk.tcl
#puts "Soil Stage 1"

test NormDispIncr 1e-7 1000 1
#algorithm ModifiedNewton -initial
#algorithm BFGS
#algorithm Broyden
#integrator MinUnbalDispNorm 0.01;# 0.1;
#integrator LoadControl 1;
#integrator ArcLength 1.0 0.1;
#algorithm KrylovNewton
#constraints Plain
algorithm Newton

#analyze 30 5.0e3
analyze 5
#vtk_output_cell_data_header $fd
#vtk_output_ele_resp_stresses $fd
#vtk_output_ele_resp_strains $fd
vtk_output_node_disp $fd "Gravedad_plastica"
vtk_output_ele_resp_stresses $tsns "Gravedad_plastica"
vtk_output_ele_resp_strains $dsns "Gravedad_plastica"

puts "Gravedad plástica OK"


source CI6910UpdateMaterialsInternalbetaexc.tcl


test NormDispIncr 1e-5 1000 1
#algorithm ModifiedNewton -initial
#integrator MinUnbalDispNorm 0.01;# 0.1;
#integrator LoadControl 1;
#integrator ArcLength 1.0 0.1;
algorithm KrylovNewton
#algorithm Newton
#constraints Plain
#algorithm Newton

#analyze 30 5.0e3
analyze 5

#vtk_output_cell_data_header $fd
#vtk_output_ele_resp_stresses $fd
#vtk_output_ele_resp_strains $fd
vtk_output_node_disp $fd "Excavacion_plastica"
vtk_output_ele_resp_stresses $tsns "Excavacion_plastica"
vtk_output_ele_resp_strains $dsns "Excavacion_plastica"

puts "Excavación plástica OK (beta = $betaexcavacion)"

close $fd
close $tsns
close $dsns

if 1 {

## Transformaciones geométricas quedan igual

# Nodos interfaz tunel
source CI6910NodosDummyLiningSuelo.tcl; # OK
source CI6910NodosDummyLiningCorridos.tcl ; # OK

puts "Nodos dummy lining definidos";

# Nodos Túnel
source CI6910NodosLiningCorridos.tcl
puts "Nodos Lining definidos"

# equalDOF Lining 
source CI6910equaldofLining.tcl; # OK
source CI6910equalDOFLiningSuelo.tcl; # OK
puts "equalDOF Lining definidos"

# Elementos Interfaz tunel suelo
#source CI6910equalDOFInterfazNoSlip.tcl
#source CI6910ElementosInterfazLining.tcl; # aca esta el problema. 
#source CI6910ElementosInterfazLiningNoSlip.tcl; # OK 
#source CI6910ElementosInterfazLiningNoSlip2.tcl; # OK 
source CI6910ElementosInterfazLiningFullSlip.tcl; # OK
#source CI6910ElementosInterfazSinTangencial.tcl; # OK 

puts "Elementos Interfaz Lining definidos";
model basic -ndm 2 -ndf 3
## Materiales 3gdl
source CI6910Materiales3gdl.tcl
puts "Materiales 3dgl definidos" 

## Secciones
source CI6910Seccion.tcl
puts "Secciones definidas"
geomTransf Linear 1 

# Elementos Revestimiento
source CI6910ElementosLining.tcl
puts "Elementos Lining definidos"

# Recorders 

source CI6910RecElLining.tcl
source CI6910RecNodLining.tcl

puts "Recorders Lining definidos"

#source RemoverNodosInterior.tcl; # NO funciona
#source RemoverElementosInterior.tcl; ; # NO funciona


set fd [open "./Desplazamientos2.vtk" "w"]
set tsns	[open "./Tensiones2.vtk" "w"]
set dsns	[open "./Deformaciones2.vtk" "w"]

#print -ele 1
vtk_output_meta $fd
vtk_output_mesh $fd
vtk_output_meta $tsns
vtk_output_mesh $tsns
vtk_output_meta $dsns
vtk_output_mesh $dsns

vtk_output_cell_data_header $tsns
vtk_output_ele_resp_stresses $tsns "Excavacion_plastica"

vtk_output_cell_data_header $dsns
vtk_output_ele_resp_strains $dsns "Excavacion_plastica"

vtk_output_point_data_header $fd
vtk_output_node_disp $fd "Excavacion_plastica"


test FixedNumIter 5 1
algorithm Newton


#set betaexcavacion 0.65
#puts "$betaexcavacion"
#source CI6910UpdateMaterialsInternalbetaexc.tcl
#analyze 3

set betaexcavacion 0.5
puts "$betaexcavacion"
source CI6910UpdateMaterialsInternalbetaexc.tcl
analyze 3

set betaexcavacion2 0.25
puts "$betaexcavacion2"
source CI6910UpdateMaterialsInternalbetaexc2.tcl
analyze 3

set betaexcavacion2 0.1
puts "$betaexcavacion2"
source CI6910UpdateMaterialsInternalbetaexc2.tcl
analyze 3

puts "Colocación Lining y excavación completa"

vtk_output_node_disp $fd "Sostenimiento"
vtk_output_ele_resp_stresses $tsns "Sostenimiento"
vtk_output_ele_resp_strains $dsns "Sostenimiento"

close $fd
close $tsns
close $dsns

}


if 1 {

model BasicBuilder -ndm 2 -ndf 3   						
source CI6910NodosLiningCorridos2.tcl
source CI6910Materiales3gdl.tcl
puts "Materiales 3dgl definidos" 
source CI6910Seccion2.tcl
puts "Secciones definidas"
geomTransf Linear 1 

source CI6910ElementosLining2.tcl

#source CI6910equalDOFSNodosLinings.tcl
#source CI6910FixesNodosLinings2.tcl
source CI6910LinksNodosLinings.tcl

source CI6910RecElLining2.tcl
source CI6910RecNodLining2.tcl


set fd [open "./Desplazamientos3.vtk" "w"]
set tsns	[open "./Tensiones3.vtk" "w"]
set dsns	[open "./Deformaciones3.vtk" "w"]

#print -ele 1
vtk_output_meta $fd
vtk_output_mesh $fd
vtk_output_meta $tsns
vtk_output_mesh $tsns
vtk_output_meta $dsns
vtk_output_mesh $dsns

vtk_output_cell_data_header $tsns
vtk_output_ele_resp_stresses $tsns "Sostenimiento"

vtk_output_cell_data_header $dsns
vtk_output_ele_resp_strains $dsns "Sostenimiento"

vtk_output_point_data_header $fd
vtk_output_node_disp $fd "Sostenimiento"

set betaexcavacion2 0.001
puts "$betaexcavacion2"
source CI6910UpdateMaterialsInternalbetaexc2.tcl
analyze 3

puts "Colocación del revestimiento secundario OK"

vtk_output_node_disp $fd "Revestimiento"
vtk_output_ele_resp_stresses $tsns "Revestimiento"
vtk_output_ele_resp_strains $dsns "Revestimiento"

}

if 1 {

set CargaLat 50000000000000;				# 
#loadConst -time 0.0

pattern Plain 1 Linear {
	load 2222221 $CargaLat 0.0 0.0
	#load 233469 $CargaLat 0.0 0.0
}

recorder	Node	-file	Recorders/Nodos/Nodo208052disp.out	-closeOnWrite	-node	208052	-dof	1	2	3	disp;
recorder	Node	-file	Recorders/Nodos/Nodo8052disp.out	-closeOnWrite	-node	8052	-dof	1	2	3	disp;

recorder	Node	-file	Recorders/Nodos/Nodo233469disp.out	-closeOnWrite	-node	233469	-dof	1	2	3	disp;
recorder	Node	-file	Recorders/Nodos/Nodo33469disp.out	-closeOnWrite	-node	33469	-dof	1	2	3	disp;

recorder	Node	-file	Recorders/Nodos/Nodo26086disp.out	-closeOnWrite	-node	26086	-dof	1	2	3	disp;


algorithm Newton
test FixedNumIter 5 1
integrator LoadControl 1 

set incr 0.01
analysis Static

set gammatarjet	[expr 0.2/100.0]
set deltaf   [expr $gammatarjet*49]   ;# time step for analysis
set numSteps 20   ;# Number of analysis steps
set incr [expr $deltaf/$numSteps]

#integrator DisplacementControl 208052 1 $incr

#analyze $numSteps
analyze 20
#analyze 
#set startT [clock seconds]
#analyze $numSteps $deltaT [expr $deltaT/100] $deltaT 10
#set endT [clock seconds]
#puts "Execution time: [expr $endT-$startT] seconds."

vtk_output_node_disp $fd "Ovalling"
vtk_output_ele_resp_stresses $tsns "Ovalling"
vtk_output_ele_resp_strains $dsns "Ovalling"

puts "Ovalling"


}

close $fd
close $tsns
close $dsns

#vtk_output_node_disp $fd

#close $fd

set TIME_taken [expr [clock clicks -milliseconds] - $TIME_start]
set Tiemposecs [expr $TIME_taken/1000]
set Tiempomin [expr $Tiemposecs/60]
set Tiempohoras [expr $Tiempomin/60]

puts $Tiempomin

wipe all;

##

