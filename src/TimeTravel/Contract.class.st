"
The naïve object model of a contract, for example, contains a single object to represent the contract.
However, contracts change over time. The business relationship remains the same, somehow, but the
details change.

#Navigation Story
ARNOLDI, Massimo, BECK, Kent, BIERI, Markus and LANGE, Manfred, [no date]. Time Travel: A Pattern Language for Values That Change. [pdf](http://www.manfred-lange.com/publications/TimeTravel.pdf), [wayback](https://web.archive.org/web/20211230084553/https://www.manfred-lange.com/publications/TimeTravel.pdf)

Imagine we are working with a payroll system. An employee is paid based on a daily rate recorded in
their contract. The pay rate changes from time to time. Periodically, the employee is actually paid
based on the days worked and the pay rates in force when those days were worked.

The first story is that of a payroll employee who has to answer questions about paychecks.

“Hello, payroll support here.”
“I just got my paycheck, and I want to know why I received $1500 this month and only $1000
last month.”
“Well, sir, I see that you got a raise on the first of this month.”
“I got that raise last month.”
“I’m sorry about that. I see that the raise wasn’t recorded in our system until this month. We
adjusted your paycheck to reflect the increase. You should receive $1250 per month from
now on.”

The next step is turning these vague ideas into concrete code. We will do this by first presenting a set
of test cases that, if they can be satisfied, will enable us to build the system implied by the stories.
Then we will show, with patterns and with code, how the test cases can be satisfied.

You get a raise on 1 March but the system doesn’t find out about it until mid-May. In the meantime,
who knows what happens? Reconciling these two time lines, world time and system time, is one of
the most difficult problems to solve in writing information systems. Many of the actions in business
are irreversible. It is complicated and expensive to take an incorrect check back. To “make the check
right”, you must discover what happened and to fix the situation.

To help answer the questions posed by the employee, the system must keep track of changes and
when they happened. The simplest test case that helps reach this goal allows us to look up the pay rate
on a particular date. Before we can write the test case, though, we must first introduce the pattern that
transforms an immutable Contract to a Contract that can have changing pay rates:

#Version History
Things change. You’d like to know what happened when. But people (and processes and
organizations) are imperfect. Put these three facts together and you are faced with a
challenge. How do you construct objects that can record and compute correctly in spite of
imperfect recording of change?

Split one conceptual object into two parts, one part that doesn’t change, the History, and one
part that does change, the Version. Give the History messages to store and retrieve versions
similar to keyed access to a collection.

• History>>versionAt: aTime put: aVersion - Says that from the point of view of aTime, the Version
in force is now aVersion
• History>>versionAt: aTime – Returns the version visible from aTime

Using Time Travel, we can refactor the naïve test case into one that can remember changing pay rates.
For now we can use simple Dates as the lookup key.
NavigationTest>>#testPayToday
```
| contract version |
contract := Contract new.
version := ContractVersion pay: 1000.
contract versionAt: '2/1/99' asDate put: version.
self assert: (contract versionAt: '2/1/99' asDate) pay = 1000
```
"
Class {
	#name : #Contract,
	#superclass : #Object,
	#instVars : [
		'versions',
		'aPerspective'
	],
	#classInstVars : [
		'pay'
	],
	#category : #TimeTravel
}

{ #category : #'as yet unclassified' }
Contract class >> pay [
	^ pay
]

{ #category : #constructing }
Contract class >> pay: aPay [
	pay := aPay. 
]

{ #category : #accessing }
Contract >> date: aDate [
	^ '12/1/1999'
]

{ #category : #accessing }
Contract >> versionAt: aDate [
	^ self versions detect: [:each | aDate > each date]
]

{ #category : #accessing }
Contract >> versionAt: aDate put: aVersion [
	aVersion date: aDate.
	self versions add: aVersion
]

{ #category : #accessing }
Contract >> versions [
	versions isNil ifTrue: [versions := SortedCollection sortBlock: [:a :b | a date > b date]].
	^ versions
]
