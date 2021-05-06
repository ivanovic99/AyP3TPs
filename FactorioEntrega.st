!classDefinition: #Caja category: 'FactorioPart3'!
DenotativeObject subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioPart3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caja class' category: 'FactorioPart3'!
Caja class
	instanceVariableNames: 'contenido'!

!Caja class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:35:50'!
agregarMenas: aCollectionOfMenas

	^contenido addAll: aCollectionOfMenas.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:35:02'!
cantidadDeMenasDeCarbon

	^contenido count: [ :cadaElemento | cadaElemento = 'una mena de carbon' ].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:14:49'!
cantidadDeMenasDeHierro

	^contenido count: [ :cadaElemento | cadaElemento = 'una mena de hierro' ].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:35:43'!
cantidadDeMenasTotales

	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'MF 5/6/2021 13:07:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:34:18'!
vaciar

	contenido := OrderedCollection new.! !


!classDefinition: #CintaA category: 'FactorioPart3'!
DenotativeObject subclass: #CintaA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioPart3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaA class' category: 'FactorioPart3'!
CintaA class
	instanceVariableNames: 'transportado destino'!

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:38:33'!
agregarMenas: coleccionDeMenas

	^transportado addAll: coleccionDeMenas.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:38:33'!
cantidadDeMenasDeCarbon

	^transportado count: [ :cadaElemento | cadaElemento = 'una mena de carbon' ].! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:38:33'!
cantidadDeMenasDeHierro

	^transportado count: [ :cadaElemento | cadaElemento = 'una mena de hierro' ].! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:38:33'!
cantidadDeMenasTotales

	^transportado size.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:38:33'!
destino: contenedor

	destino := contenedor.
	^self.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'MF 5/6/2021 13:07:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	transportado := ((OrderedCollection new)).
	destino := Caja.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:38:33'!
transportar

	destino agregarMenas: transportado.
	self vaciar.
	^self.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:38:33'!
vaciar

	transportado := OrderedCollection new.! !


!classDefinition: #CintaB category: 'FactorioPart3'!
DenotativeObject subclass: #CintaB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioPart3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaB class' category: 'FactorioPart3'!
CintaB class
	instanceVariableNames: 'transportado destino'!

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:32'!
agregarMenas: coleccionDeMenas

	^transportado addAll: coleccionDeMenas.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:32'!
cantidadDeMenasDeCarbon

	^transportado count: [ :cadaElemento | cadaElemento = 'una mena de carbon' ].! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:32'!
cantidadDeMenasDeHierro

	^transportado count: [ :cadaElemento | cadaElemento = 'una mena de hierro' ].! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:32'!
cantidadDeMenasTotales

	^transportado size.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:33'!
destino: contenedor

	destino := contenedor.
	^self.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'MF 5/6/2021 13:07:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	transportado := ((OrderedCollection new)).
	destino := CintaA.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:33'!
transportar

	destino agregarMenas: transportado.
	self vaciar.
	^self.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:33'!
vaciar

	transportado := OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'FactorioPart3'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioPart3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'FactorioPart3'!
ExtractorDeCarbon class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:23:04'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:44:58'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:29:41'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:21:02'!
energiaActual

	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:29'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:34:57'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'MF 5/6/2021 13:07:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := Caja.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:27'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:36:12'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:57'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #ExtractorDeHierro category: 'FactorioPart3'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioPart3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'FactorioPart3'!
ExtractorDeHierro class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:47'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:22:40'!
conjuntoDeMenasDeHierroCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:47'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:47'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:47'!
energiaActual

	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:47'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:22:40'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeHierroCantidad: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'MF 5/6/2021 13:07:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := CintaB.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:47'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:47'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:21:47'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #PruebasDeExtractorDeCarbon category: 'FactorioPart3'!
DenotativeObject subclass: #PruebasDeExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioPart3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeCarbon class' category: 'FactorioPart3'!
PruebasDeExtractorDeCarbon class
	instanceVariableNames: ''!

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:37:39'!
setUp
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:41:43'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:46:54'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:47:56'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:49:57'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 7 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:50:53'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 50 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 10.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeFactorio category: 'FactorioPart3'!
DenotativeObject subclass: #PruebasDeFactorio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioPart3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeFactorio class' category: 'FactorioPart3'!
PruebasDeFactorio class
	instanceVariableNames: ''!

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'IE 5/5/2021 15:17:55'!
testEscenarioExtractorCaja
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.
	ExtractorDeCarbon extraer.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'MF 5/6/2021 13:06:57'!
testEscenarioExtractorDosCintas

	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	
	
	ExtractorDeCarbon destino: CintaA.
	ExtractorDeHierro destino: CintaB.
	CintaA destino: Caja.
	CintaB destino: CintaA.
	
	
	CintaA vaciar.
	CintaB vaciar.
	Caja vaciar.
	
	
	
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer.
	
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 0.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 0.
	Assert that: Caja cantidadDeMenasDeHierro isEqualTo: 0.
	
	Assert that: CintaA cantidadDeMenasTotales  isEqualTo: 1.
	Assert that: CintaA cantidadDeMenasDeCarbon  isEqualTo: 1.
	Assert that: CintaA cantidadDeMenasDeHierro  isEqualTo: 0.
	
	Assert that: CintaB cantidadDeMenasTotales  isEqualTo: 1.	
	Assert that: CintaB cantidadDeMenasDeHierro  isEqualTo: 1.
	Assert that: CintaB cantidadDeMenasDeCarbon  isEqualTo: 0.
	
	
	
	CintaB transportar.
	
	Assert that: CintaB cantidadDeMenasTotales  isEqualTo: 0.	
	Assert that: CintaB cantidadDeMenasDeHierro  isEqualTo: 0.
	Assert that: CintaB cantidadDeMenasDeCarbon  isEqualTo: 0.
	
	Assert that: CintaA cantidadDeMenasTotales  isEqualTo: 2.
	Assert that: CintaA cantidadDeMenasDeCarbon  isEqualTo: 1.
	Assert that: CintaA cantidadDeMenasDeHierro  isEqualTo: 1.
	
	
	CintaA transportar.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 2.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeHierro isEqualTo: 1.
	Assert that: CintaA cantidadDeMenasTotales  isEqualTo: 0.
	Assert that: CintaA cantidadDeMenasDeCarbon  isEqualTo: 0.
	Assert that: CintaA cantidadDeMenasDeHierro  isEqualTo: 0.
	
	"Prueba con mas menas"
	ExtractorDeCarbon agregarEnergia: 10 * joule.
	ExtractorDeHierro agregarEnergia: 10 * joule.
	
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer.
	
	CintaB transportar.
	Assert that: CintaB cantidadDeMenasTotales  isEqualTo: 0.	
	Assert that: CintaB cantidadDeMenasDeHierro  isEqualTo: 0.
	Assert that: CintaB cantidadDeMenasDeCarbon  isEqualTo: 0.
	
	CintaA transportar.
	Assert that: CintaA cantidadDeMenasTotales  isEqualTo: 0.
	Assert that: CintaA cantidadDeMenasDeCarbon  isEqualTo: 0.
	Assert that: CintaA cantidadDeMenasDeHierro  isEqualTo: 0.
	
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 6.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 3.
	Assert that: Caja cantidadDeMenasDeHierro isEqualTo: 3.
	! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'MF 5/6/2021 12:58:24'!
testEscenarioExtractorUnaCinta

	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	
	ExtractorDeCarbon destino: CintaA.
	CintaA destino: Caja.
	
	CintaA vaciar.
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 0.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 0.
	Assert that: Caja cantidadDeMenasDeHierro isEqualTo: 0. "Agregado"
	
	Assert that: CintaA cantidadDeMenasTotales  isEqualTo: 1.
	Assert that: CintaA cantidadDeMenasDeCarbon isEqualTo: 1.  "Agregado"
	Assert that: CintaA cantidadDeMenasDeHierro isEqualTo: 0. "Agregado"
	
	
	CintaA transportar.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeHierro isEqualTo: 0. "Agregado"
	
	Assert that: CintaA cantidadDeMenasTotales  isEqualTo: 0.
	Assert that: CintaA cantidadDeMenasDeCarbon isEqualTo: 0. "Agregado"
	Assert that: CintaA cantidadDeMenasDeHierro isEqualTo: 0. "Agregado"
	
	"Prueba con varias menas, la mena anterior + otras 3 nuevas" " -- Agregado"
	ExtractorDeCarbon agregarEnergia: 15 * joule. 
	ExtractorDeCarbon extraer.
	CintaA transportar .
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 4.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 4.
	
	
	! !

Caja initializeAfterFileIn!
CintaA initializeAfterFileIn!
CintaB initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!