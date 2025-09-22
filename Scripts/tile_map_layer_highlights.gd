## Tile map layer containing highlighting graphics.
extends TileMapLayer
class_name TileMapLayerHighlights

## Enum containing possible types of highlights. Corresponds to graphics position in TileSet.[br][br]
## [member HighlightType.FOCUSED] currently focused [Tile] under mouse cursor.[br]
## [member HighlightType.SELECTED] selected [Tile].[br]
## [member HighlightType.ADDING] [Tile] that will be added to selection.[br]
## [member HighlightType.REMOVING] [Tile] that will be removed from selection.
enum HighlightType {
	FOCUSED = 0,
	SELECTED = 1,
	ADDING = 2,
	REMOVING = 3
}
