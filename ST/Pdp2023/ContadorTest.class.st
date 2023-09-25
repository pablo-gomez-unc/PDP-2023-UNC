Class {
	#name : #ContadorTest,
	#superclass : #TestCase,
	#category : #Pdp2023
}

{ #category : #tests }
ContadorTest >> testCounterStartingAt5 [ 
	self assert:(Contador startingAt:5) contador equals:5
]

{ #category : #tests }
ContadorTest >> testDecrementar [
|c| 
c := Contador new. 
c contador:2 ; decrementar; decrementar. 
self assert: c contador equals:0
]

{ #category : #tests }
ContadorTest >> testIncrementar [ 
|c| 
c := Contador new. 
c contador:0 ; incrementar; incrementar. 
self assert: c contador equals:2
]

{ #category : #tests }
ContadorTest >> testInicializar [ 
self assert:Contador new contador equals:0
]

{ #category : #tests }
ContadorTest >> testSetterYGetter [
| c |
c := Contador new.
c contador: 4.
self assert: c contador equals: 4.
]
