"
I am an abstract class with common behaviour for list and table adapters.
See my subclasses for more details.
"
Class {
	#name : #SpAbstractMorphicListAdapter,
	#superclass : #SpAbstractMorphicAdapter,
	#category : #'Spec2-Adapters-Morphic-List'
}

{ #category : #testing }
SpAbstractMorphicListAdapter class >> isAbstract [

	^ self == SpAbstractMorphicListAdapter
]

{ #category : #scrolling }
SpAbstractMorphicListAdapter >> configureScrolling [

	self presenter verticalAlignment whenChangedDo: [ 
		widget scrollToIndex: self presenter verticalAlignment desiredVisibleRow ].
	self presenter whenDisplayDo: [ 
		widget scrollToIndex: self presenter verticalAlignment desiredVisibleRow.
		self scrollingChanged ].
	widget onAnnouncement: FTScrollingChanged send: #scrollingChanged to: self.
]

{ #category : #scrolling }
SpAbstractMorphicListAdapter >> scrollingChanged [

	widget container updateAllRows.
	self presenter verticalAlignment
		firstVisibleRowIndex: widget firstVisibleRowIndex;
		lastVisibleRowIndex: widget lastVisibleRowIndex
]
