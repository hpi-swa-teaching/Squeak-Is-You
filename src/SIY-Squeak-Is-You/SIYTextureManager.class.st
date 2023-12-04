Class {
	#name : #SIYTextureManager,
	#superclass : #Object,
	#instVars : [
		'assetLoader'
	],
	#category : #'SIY-Squeak-Is-You'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 12/4/2023 17:42'
}
SIYTextureManager >> getTexture: aFilename [

	^ assetLoader loadForm: aFilename
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LK 12/4/2023 17:36'
}
SIYTextureManager >> initialize [

	assetLoader := GitAssetLoader for: 'swa23-24-group16'.

]
