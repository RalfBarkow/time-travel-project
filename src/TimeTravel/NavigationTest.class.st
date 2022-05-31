Class {
	#name : #NavigationTest,
	#superclass : #TestCase,
	#category : #TimeTravel
}

{ #category : #tests }
NavigationTest >> testNaivePayToday [
	| contract |
	contract := Contract pay: 1000.
	self assert: contract pay = 1000
]

{ #category : #tests }
NavigationTest >> testPayToday [
	| contract version |
	contract := Contract new.
	version := ContractVersion pay: 1000.
	contract versionAt: '2/1/99' asDate put: version.
	self assert: (contract versionAt: '2/1/99' asDate) pay = 1000
]
