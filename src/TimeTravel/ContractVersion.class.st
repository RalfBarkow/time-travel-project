"
Split one conceptual object – here: Contract – into two parts, one part that doesn’t change, the History, and one part that does change, the Version. Give the History messages to store and retrieve versions similar to keyed access to a collection.
"
Class {
	#name : #ContractVersion,
	#superclass : #Object,
	#instVars : [
		'pay',
		'date'
	],
	#classInstVars : [
		'pay',
		'date'
	],
	#category : #TimeTravel
}

{ #category : #accessing }
ContractVersion class >> date [
	^ date
]

{ #category : #'as yet unclassified' }
ContractVersion class >> date: aDate [
	^ '12/1/1999'.
]

{ #category : #tests }
ContractVersion class >> pay: aPay [
	pay := aPay.
]
