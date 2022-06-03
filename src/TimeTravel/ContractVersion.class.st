"
Split one conceptual object – here: Contract – into two parts, one part that doesn’t change, the History, and one part that does change, the Version. Give the History messages to store and retrieve versions similar to keyed access to a collection.
"
Class {
	#name : #ContractVersion,
	#superclass : #Object,
	#instVars : [
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

{ #category : #accessing }
ContractVersion class >> date: aDate [
	^(self new)
		date: aDate.
]

{ #category : #tests }
ContractVersion class >> pay: aPay [
	pay := aPay.
]

{ #category : #accessing }
ContractVersion >> date: aData [
	^date := aData 
]

{ #category : #accessing }
ContractVersion >> pay [
	^ self
]
