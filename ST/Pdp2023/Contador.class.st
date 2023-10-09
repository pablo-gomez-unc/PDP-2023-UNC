Class {
	#name : #Contador,
	#superclass : #Object,
	#instVars : [
		'contador'
	],
	#classVars : [
		'Cantidad'
	],
	#category : #Pdp2023
}

{ #category : #accessing }
Contador class >> startingAt: anInteger [ 
   Cantidad := Cantidad + 1.
	^ self new contador: anInteger.
]

{ #category : #'as yet unclassified' }
Contador >> contador [ 
	^ contador 
]

{ #category : #'as yet unclassified' }
Contador >> contador: aNumber [
	contador := aNumber 
]

{ #category : #'as yet unclassified' }
Contador >> decrementar [
	contador := contador - 1 
]

{ #category : #'as yet unclassified' }
Contador >> incrementar [
	contador := contador + 1 
]

{ #category : #initialization }
Contador >> initialize [ 
		contador := 0
]
