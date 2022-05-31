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
