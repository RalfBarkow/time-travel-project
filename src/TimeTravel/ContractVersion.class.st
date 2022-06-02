"
Split one conceptual object – here: Contract – into two parts, one part that doesn’t change, the History, and one
part that does change, the Version. Give the History messages to store and retrieve versions
similar to keyed access to a collection.
"
Class {
	#name : #ContractVersion,
	#superclass : #Object,
	#instVars : [
		'pay',
		'date'
	],
	#classInstVars : [
		'pay'
	],
	#category : #TimeTravel
}

{ #category : #tests }
ContractVersion class >> pay: aPay [
	pay := aPay.
]
