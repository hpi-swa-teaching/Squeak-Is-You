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
	#'squeak_changestamp' : 'LK 1/4/2024 00:38'
}
SIYTextureManager >> assetLoader [

	^ assetLoader ifNil: [assetLoader := GitAssetLoader for: self repositoryName basePath: self basePath.]
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureManager >> basePath [

	^  'textures'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LK 1/4/2024 00:37'
}
SIYTextureManager >> getTexture: aFilename [

	^ self assetLoader loadForm: aFilename
]

{
	#category : #configuration,
	#'squeak_changestamp' : 'LK 1/4/2024 00:38'
}
SIYTextureManager >> repositoryName [

	^ 'swa23-24-group16'
]
