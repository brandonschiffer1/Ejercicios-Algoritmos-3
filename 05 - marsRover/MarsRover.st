!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'orientacionNorte orientacionSur orientacionOeste orientacionEste posicionInicial marsRoverConOrientacionInicialNorteYPosicionInicial00 marsRoverConOrientacionInicialSurYPosicionInicial00 marsRoverConOrientacionInicialEsteYPosicionInicial00 marsRoverConOrientacionInicialOesteYPosicionInicial00'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'setUp/tearDown' stamp: 'b 11/4/2022 12:57:35'!
setUp
	orientacionNorte := OrientacionNorteDelMarsRover new.
	orientacionSur := OrientacionSurDelMarsRover new.
	orientacionOeste := OrientacionOesteDelMarsRover new.
	orientacionEste := OrientacionEsteDelMarsRover new.
	posicionInicial := 0@0.
	marsRoverConOrientacionInicialNorteYPosicionInicial00 := MarsRover conPosicion: posicionInicial yOrientacion: orientacionNorte.
	marsRoverConOrientacionInicialSurYPosicionInicial00 := MarsRover conPosicion: posicionInicial yOrientacion: orientacionSur .
	marsRoverConOrientacionInicialEsteYPosicionInicial00 := MarsRover conPosicion: posicionInicial yOrientacion: orientacionEste .
	marsRoverConOrientacionInicialOesteYPosicionInicial00 := MarsRover conPosicion: posicionInicial yOrientacion: orientacionOeste .
	! !


!MarsRoverTest methodsFor: 'private' stamp: 'b 11/4/2022 11:34:16'!
asertarQueUnMarsRover: unMarsRover alRealizarComandos: unaLineaDeComandos suOrientacionEs: unaOrientacion ySuPosicionEs: unaPosicion

	
	
	unMarsRover realizarComandos: unaLineaDeComandos.
	
	
	self assert: unaOrientacion value.
	self assert: (unMarsRover laPosicionActualEs: unaPosicion).
! !


!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 11:47:37'!
test01DadoUnComandoVacioUnMarsRoverNoHaceNada
	
	
	 self asertarQueUnMarsRover: 	marsRoverConOrientacionInicialNorteYPosicionInicial00 alRealizarComandos: '' suOrientacionEs: [marsRoverConOrientacionInicialNorteYPosicionInicial00 laOrientacionActualEsNorte] ySuPosicionEs: posicionInicial.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 11:58:13'!
test02UnMarsRoverConOrientacionNorteSeMueveCorrectamenteHaciaAdelante
	| posicionFinal |
	

	posicionFinal := 0@1.
	
	 self asertarQueUnMarsRover: marsRoverConOrientacionInicialNorteYPosicionInicial00 alRealizarComandos: 'f' suOrientacionEs: [marsRoverConOrientacionInicialNorteYPosicionInicial00 laOrientacionActualEsNorte] ySuPosicionEs: posicionFinal.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 11:58:23'!
test03UnMarsRoverConOrientacionNorteSeMueveCorrectamenteHaciaAtras
	| posicionFinal |
	
	posicionFinal := 0@-1.

	 self asertarQueUnMarsRover: marsRoverConOrientacionInicialNorteYPosicionInicial00 alRealizarComandos: 'b' suOrientacionEs: [marsRoverConOrientacionInicialNorteYPosicionInicial00 laOrientacionActualEsNorte] ySuPosicionEs: posicionFinal.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 11:58:42'!
test04UnMarsRoverConOrientacionNorteCambiaSuOrientacionCorrectamenteHaciaLaIzquierda
	
	
	 
	 self asertarQueUnMarsRover: marsRoverConOrientacionInicialNorteYPosicionInicial00 alRealizarComandos: 'l' suOrientacionEs: [marsRoverConOrientacionInicialNorteYPosicionInicial00 laOrientacionActualEsOeste] ySuPosicionEs: posicionInicial.
	
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 11:59:00'!
test05UnMarsRoverConOrientacionNorteCambiaSuOrientacionCorrectamenteHaciaLaDerecha
	
	

	
	 self asertarQueUnMarsRover: marsRoverConOrientacionInicialNorteYPosicionInicial00 alRealizarComandos: 'r' suOrientacionEs: [marsRoverConOrientacionInicialNorteYPosicionInicial00 laOrientacionActualEsEste] ySuPosicionEs: posicionInicial.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:57:35'!
test06UnMarsRoverConOrientacionEsteSeMueveCorrectamenteHaciaAdelante
	| posicionFinal |
	
	posicionFinal := 1@0.
	
	
	 self asertarQueUnMarsRover: marsRoverConOrientacionInicialEsteYPosicionInicial00 alRealizarComandos: 'f' suOrientacionEs: [marsRoverConOrientacionInicialEsteYPosicionInicial00 laOrientacionActualEsEste] ySuPosicionEs: posicionFinal.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:57:35'!
test07UnMarsRoverConOrientacionEsteSeMueveCorrectamenteHaciaAtras
	| posicionFinal |
	
	posicionFinal := -1@0.
	
	
	 self asertarQueUnMarsRover: marsRoverConOrientacionInicialEsteYPosicionInicial00 alRealizarComandos: 'b' suOrientacionEs: [marsRoverConOrientacionInicialEsteYPosicionInicial00 laOrientacionActualEsEste] ySuPosicionEs: posicionFinal.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:57:35'!
test08UnMarsRoverConOrientacionEsteCambiaSuOrientacionCorrectamenteHaciaLaIzquierda
	
	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialEsteYPosicionInicial00 alRealizarComandos: 'l' suOrientacionEs: [marsRoverConOrientacionInicialEsteYPosicionInicial00 laOrientacionActualEsNorte] ySuPosicionEs: posicionInicial.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:57:35'!
test09UnMarsRoverConOrientacionEsteCambiaSuOrientacionCorrectamenteHaciaLaDerecha
	
	

	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialEsteYPosicionInicial00 alRealizarComandos: 'r' suOrientacionEs: [marsRoverConOrientacionInicialEsteYPosicionInicial00 laOrientacionActualEsSur] ySuPosicionEs: posicionInicial.

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:00:21'!
test10UnMarsRoverConOrientacionSurSeMueveCorrectamenteHaciaAdelante
	| posicionFinal |
	

	posicionFinal := 0@-1.
	
	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialSurYPosicionInicial00 alRealizarComandos: 'f' suOrientacionEs: [marsRoverConOrientacionInicialSurYPosicionInicial00 laOrientacionActualEsSur] ySuPosicionEs: posicionFinal.

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:00:36'!
test11UnMarsRoverConOrientacionSurSeMueveCorrectamenteHaciaAtras
	| posicionFinal |
	
	posicionFinal := 0@1.

	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialSurYPosicionInicial00 alRealizarComandos: 'b' suOrientacionEs: [marsRoverConOrientacionInicialSurYPosicionInicial00 laOrientacionActualEsSur] ySuPosicionEs: posicionFinal.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:00:53'!
test12UnMarsRoverConOrientacionSurCambiaSuOrientacionCorrectamenteHaciaLaIzquierda
	
	

	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialSurYPosicionInicial00 alRealizarComandos: 'l' suOrientacionEs: [marsRoverConOrientacionInicialSurYPosicionInicial00 laOrientacionActualEsEste] ySuPosicionEs: posicionInicial.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:01:12'!
test13UnMarsRoverConOrientacionSurCambiaSuOrientacionCorrectamenteHaciaLaDerecha
	
	
	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialSurYPosicionInicial00 alRealizarComandos: 'r' suOrientacionEs: [marsRoverConOrientacionInicialSurYPosicionInicial00 laOrientacionActualEsOeste] ySuPosicionEs: posicionInicial.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:01:44'!
test14UnMarsRoverConOrientacionOesteSeMueveCorrectamenteHaciaAdelante
	| posicionFinal |
	

	posicionFinal := -1@0.

	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialOesteYPosicionInicial00 alRealizarComandos: 'f' suOrientacionEs: [marsRoverConOrientacionInicialOesteYPosicionInicial00 laOrientacionActualEsOeste] ySuPosicionEs: posicionFinal.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:01:59'!
test15UnMarsRoverConOrientacionOesteSeMueveCorrectamenteHaciaAtras
	| posicionFinal |
	
	posicionFinal := 1@0.
	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialOesteYPosicionInicial00 alRealizarComandos: 'b' suOrientacionEs: [marsRoverConOrientacionInicialOesteYPosicionInicial00 laOrientacionActualEsOeste] ySuPosicionEs: posicionFinal.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:02:14'!
test16UnMarsRoverConOrientacionOesteCambiaSuOrientacionCorrectamenteHaciaLaIzquierda
	
	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialOesteYPosicionInicial00 alRealizarComandos: 'l' suOrientacionEs: [marsRoverConOrientacionInicialOesteYPosicionInicial00 laOrientacionActualEsSur] ySuPosicionEs: posicionInicial.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:02:31'!
test17UnMarsRoverConOrientacionOesteCambiaSuOrientacionCorrectamenteHaciaLaDerecha

	
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialOesteYPosicionInicial00 alRealizarComandos: 'r' suOrientacionEs: [marsRoverConOrientacionInicialOesteYPosicionInicial00 laOrientacionActualEsNorte] ySuPosicionEs: posicionInicial.
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 11:47:38'!
test18UnMarsRoverNoEjecutaUnComandoInvalido
	
	
	self should: [marsRoverConOrientacionInicialNorteYPosicionInicial00 realizarComandos: 'j']
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: MarsRover comandoInvalidoError].! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:03:02'!
test19unMarsRoverPuedeProcesarUnaLineaDeComandos
	| posicionFinal |

	posicionFinal := 0@1.
		
	self asertarQueUnMarsRover: marsRoverConOrientacionInicialNorteYPosicionInicial00 alRealizarComandos: 'fffbbr' suOrientacionEs: [marsRoverConOrientacionInicialNorteYPosicionInicial00 laOrientacionActualEsEste] ySuPosicionEs: posicionFinal.

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'b 11/4/2022 12:03:39'!
test20unMarsRoverEjecutaUnaLineaDeComandosHastaQueUnComandoEsInvalido
	| posicionFinal |
	
	
	posicionFinal := 0@1.	
	
	self should: [marsRoverConOrientacionInicialNorteYPosicionInicial00 realizarComandos: 'ffbxff']
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: MarsRover comandoInvalidoError].
	self assert: (marsRoverConOrientacionInicialNorteYPosicionInicial00 laPosicionActualEs: posicionFinal).
	self assert: (marsRoverConOrientacionInicialNorteYPosicionInicial00 laOrientacionActualEsNorte).
	

	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion orientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialize' stamp: 'b 11/3/2022 14:35:17'!
initializeConPosicion: unaPosicion yOrientacion: unaOrientacion
	posicion := unaPosicion.
	orientacion := unaOrientacion.! !


!MarsRover methodsFor: 'validacion' stamp: 'b 11/3/2022 14:54:22'!
chequearSiComandoValido: unComando
	((unComando = $f) or: (unComando = $b) or: (unComando = $l) or: (unComando = $r)) ifFalse: [self error: self class comandoInvalidoError]! !

!MarsRover methodsFor: 'validacion' stamp: 'b 11/4/2022 11:25:21'!
chequearSiLineaDeComandosEsVacia: unaLineaDeComandos
	(unaLineaDeComandos isEmpty) ifTrue: [^self]. ! !


!MarsRover methodsFor: 'posicion' stamp: 'ro 10/31/2022 17:09:29'!
laPosicionActualEs: unaPosicion
	^unaPosicion = posicion! !


!MarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 16:04:54'!
realizarComando: unComando
		
		(unComando = $f ) ifTrue: [posicion:= posicion + orientacion posicionHaciaAdelante] .
		(unComando = $b) ifTrue: [posicion:= posicion + orientacion posicionHaciaAtras].
		(unComando = $l) ifTrue: [orientacion :=  orientacion rotacionHaciaLaIzquierda].
		(unComando = $r) ifTrue: [orientacion:= orientacion rotacionHaciaLaDerecha].! !

!MarsRover methodsFor: 'operaciones' stamp: 'b 11/4/2022 11:42:36'!
realizarComandos: unaLineaDeComandos
	
	self chequearSiLineaDeComandosEsVacia: unaLineaDeComandos.
	
	unaLineaDeComandos do: [:unComando |
		
		self chequearSiComandoValido: unComando.
		self realizarComando: unComando.
	].
! !


!MarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:02:56'!
laOrientacionActualEsEste
	^orientacion esEste.! !

!MarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:02:40'!
laOrientacionActualEsNorte
	^orientacion esNorte.! !

!MarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:02:13'!
laOrientacionActualEsOeste
	^orientacion esOeste.! !

!MarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:01:48'!
laOrientacionActualEsSur
	^orientacion esSur.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'creacion de instancia' stamp: 'b 11/3/2022 14:35:04'!
conPosicion: unaPosicion yOrientacion: unaOrientacion

	^self new initializeConPosicion: unaPosicion yOrientacion: unaOrientacion! !


!MarsRover class methodsFor: 'error' stamp: 'ro 11/2/2022 12:49:10'!
comandoInvalidoError
	^'Movimiento Invalido'! !


!classDefinition: #OrientacionDelMarsRover category: 'MarsRover'!
Object subclass: #OrientacionDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionDelMarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:04:19'!
esEste
	^false. ! !

!OrientacionDelMarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:04:12'!
esNorte
	^false. ! !

!OrientacionDelMarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:04:05'!
esOeste
	^false.! !

!OrientacionDelMarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:03:57'!
esSur
	^false. ! !


!OrientacionDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:14'!
posicionHaciaAdelante
	self subclassResponsibility ! !

!OrientacionDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:29'!
posicionHaciaAtras
	self subclassResponsibility ! !

!OrientacionDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:24:19'!
rotacionHaciaLaDerecha
	self subclassResponsibility ! !

!OrientacionDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:24:16'!
rotacionHaciaLaIzquierda
	self subclassResponsibility ! !


!classDefinition: #OrientacionEsteDelMarsRover category: 'MarsRover'!
OrientacionDelMarsRover subclass: #OrientacionEsteDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionEsteDelMarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:04:45'!
esEste
	^true.! !


!OrientacionEsteDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:14'!
posicionHaciaAdelante
	^1@0! !

!OrientacionEsteDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:29'!
posicionHaciaAtras
	^-1@0! !

!OrientacionEsteDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:28:26'!
rotacionHaciaLaDerecha
	^OrientacionSurDelMarsRover new! !

!OrientacionEsteDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:29:48'!
rotacionHaciaLaIzquierda
	^OrientacionNorteDelMarsRover new! !


!classDefinition: #OrientacionNorteDelMarsRover category: 'MarsRover'!
OrientacionDelMarsRover subclass: #OrientacionNorteDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionNorteDelMarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:05:20'!
esNorte
	^true.! !


!OrientacionNorteDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:14'!
posicionHaciaAdelante
	^0@1! !

!OrientacionNorteDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:29'!
posicionHaciaAtras
	^0@-1! !

!OrientacionNorteDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:28:43'!
rotacionHaciaLaDerecha
	^OrientacionEsteDelMarsRover new! !

!OrientacionNorteDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:30:05'!
rotacionHaciaLaIzquierda
	^OrientacionOesteDelMarsRover new! !


!classDefinition: #OrientacionOesteDelMarsRover category: 'MarsRover'!
OrientacionDelMarsRover subclass: #OrientacionOesteDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionOesteDelMarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:05:36'!
esOeste
	^true.! !


!OrientacionOesteDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:14'!
posicionHaciaAdelante
	^-1@0! !

!OrientacionOesteDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:30'!
posicionHaciaAtras
	^1@0! !

!OrientacionOesteDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:29:04'!
rotacionHaciaLaDerecha
	^OrientacionNorteDelMarsRover new! !

!OrientacionOesteDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:30:20'!
rotacionHaciaLaIzquierda
	^OrientacionSurDelMarsRover new! !


!classDefinition: #OrientacionSurDelMarsRover category: 'MarsRover'!
OrientacionDelMarsRover subclass: #OrientacionSurDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionSurDelMarsRover methodsFor: 'direccion' stamp: 'b 11/3/2022 15:05:50'!
esSur
	^true.! !


!OrientacionSurDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:14'!
posicionHaciaAdelante
	^0@-1! !

!OrientacionSurDelMarsRover methodsFor: 'operaciones' stamp: 'b 11/3/2022 15:16:30'!
posicionHaciaAtras
	^0@1! !

!OrientacionSurDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:29:17'!
rotacionHaciaLaDerecha
	^OrientacionOesteDelMarsRover new! !

!OrientacionSurDelMarsRover methodsFor: 'operaciones' stamp: 'ro 11/2/2022 12:30:38'!
rotacionHaciaLaIzquierda
	^OrientacionEsteDelMarsRover new ! !
