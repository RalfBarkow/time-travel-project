Class {
	#name : #NavigationTest,
	#superclass : #TestCase,
	#category : #TimeTravel
}

{ #category : #tests }
NavigationTest >> testNaivePayToday [

	| contract |
	contract := Contract pay: 1000.
	self assert: contract pay equals: 1000
]

{ #category : #accessing }
NavigationTest >> testPayLastMonth [

	| contract firstVersion secondVersion |
	contract := Contract new.
	firstVersion := ContractVersion pay: 1000.
	contract versionAt: '1/1/99' asDate put: firstVersion.
	secondVersion := ContractVersion pay: 2000.
	contract versionAt: '2/1/99' asDate put: secondVersion.
	self assert: (contract versionAt: '1/1/99' asDate) pay equals: 1000.
	self assert: (contract versionAt: '2/1/99' asDate) pay equals: 2000
]

{ #category : #tests }
NavigationTest >> testPayToday [

	| contract version |
	contract := Contract new.
	version := ContractVersion pay: 1000.
	contract versionAt: '2/1/99' asDate put: version.
	self assert: (contract versionAt: '2/1/99' asDate) pay equals: 1000
]

{ #category : #accessing }
NavigationTest >> testWhereIsMyRaise [

	| contract firstVersion secondVersion correction |
	contract := Contract new.
	firstVersion := ContractVersion pay: 1000.
	contract versionAt: '1/1/99' asDate put: firstVersion.
	secondVersion := ContractVersion pay: 2000.
	correction := Perspective
		              posting: '3/1/99' asDate
		              effective: '2/1/99' asDate.
	contract versionAt: correction put: secondVersion.
	self assert: (contract versionAt: '2/1/99' asDate) pay equals: 1000.
	self assert: (contract versionAt: '3/1/99' asDate) pay equals: 2000.
	self assert: (contract versionAt: correction) pay equals: 2000
]
