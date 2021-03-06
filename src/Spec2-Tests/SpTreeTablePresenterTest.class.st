Class {
	#name : #SpTreeTablePresenterTest,
	#superclass : #SpTestCase,
	#category : #'Spec2-Tests-Core-Widgets'
}

{ #category : #running }
SpTreeTablePresenterTest >> classToTest [

	^ SpTreeTablePresenter
]

{ #category : #running }
SpTreeTablePresenterTest >> setUp [

	super setUp.
	presenter 
		roots: #(1 2 3);
		children: [ :aNumber | 
			aNumber < 100 
				ifTrue: [ ((aNumber * 10) to: (aNumber * 10) + 10) asArray ]
				ifFalse: [ #() ] ].
	
]

{ #category : #tests }
SpTreeTablePresenterTest >> testContextMenu [
	| menu changed |
	self assert: presenter contextMenu isNil.
	menu := SpMenuPresenter new.
	changed := false.
	presenter whenMenuChangedDo: [ 
		changed := true. ].
	presenter contextMenu: menu.
	self assert: presenter contextMenu equals: menu.
	self assert: changed
]

{ #category : #tests }
SpTreeTablePresenterTest >> testUnselectAll [

	presenter beMultipleSelection.
	presenter 
		selectPath: #(1);
		selectPath: #(2).
	self assert: presenter selection selectedPaths equals: #((1) (2)).
	presenter unselectAll.
	self assertEmpty: presenter selection selectedPaths.
	

]
