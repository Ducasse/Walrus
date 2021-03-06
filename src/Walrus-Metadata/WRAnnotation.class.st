Class {
	#name : #WRAnnotation,
	#superclass : #Object,
	#instVars : [
		'pragma'
	],
	#category : #'Walrus-Metadata-Annotation'
}

{ #category : #'pragma helpers' }
WRAnnotation class >> allPragmaSelectors [
	^ {self pragmaSelector} , (self allSubclasses collect: [ :each | each pragmaSelector ])
]

{ #category : #'pragma helpers' }
WRAnnotation class >> collectFrom: startClass to: endClass [
	^ (Pragma allNamed: self pragmaSelector from: startClass to: endClass)
		collect: [ :each | self fromPragma: each ]
]

{ #category : #'instance creation' }
WRAnnotation class >> fromPragma: aPragma [
	^ self new
		pragma: aPragma;
		yourself
]

{ #category : #'pragma helpers' }
WRAnnotation class >> pragmaSelector [
	^ #walrus
]

{ #category : #accessing }
WRAnnotation >> mappingClass [
	^ pragma methodClass
]

{ #category : #accessing }
WRAnnotation >> metadata [
	^ pragma 	method valueWithReceiver: self mappingClass arguments: #()
]

{ #category : #accessing }
WRAnnotation >> metadataOn: aClass [
	^ (pragma method valueWithReceiver: aClass arguments: #())
		origin: pragma methodClass instanceSide name
]

{ #category : #accessing }
WRAnnotation >> pragma [
	^ pragma
]

{ #category : #accessing }
WRAnnotation >> pragma: anObject [
	pragma := anObject
]
