"
Split one conceptual object – here: Contract – into two parts, one part that doesn’t change, the History, and one part that does change, the Version. Give the History messages to store and retrieve versions similar to keyed access to a collection.
"
Class {
	#name : #ContractVersion,
	#superclass : #Object,
	#instVars : [
		'date',
		'pay'
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

{ #category : #accessing }
ContractVersion class >> date: aDate [
	date := aDate
]

{ #category : #accessing }
ContractVersion class >> pay [
	^ pay
]

{ #category : #accessing }
ContractVersion class >> pay: anInteger [
	^ (self new)
	pay:anInteger.
]

{ #category : #accessing }
ContractVersion >> date [
	^ date
]

{ #category : #accessing }
ContractVersion >> date: aDate [
	date := aDate
]

{ #category : #accessing }
ContractVersion >> pay [
	^ pay
]

{ #category : #accessing }
ContractVersion >> pay: anInteger [ 
	pay := anInteger
]
