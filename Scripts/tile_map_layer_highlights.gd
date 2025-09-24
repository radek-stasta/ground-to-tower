## Tile map layer containing highlighting graphics.
extends TileMapLayer
class_name TileMapLayerHighlights

## Enum corresponding to graphics position in this layer's TileSet
enum HighlightState {
	NONE = -1,
	FOCUSED = 0,
	SELECTED = 1,
	ADDED = 2,
	REMOVED = 3
}

## Connects to the [signal _GroundEventBus.focus_changed] signal to update new and previous focused [Tile] graphics
func _ready() -> void:
	GroundEventBus.focus_changed.connect(_on_focus_changed)
	
## Removes focus graphics of previously focused [Tile] and adds focus graphics to newly focused [Tile].[br]
## [param new_focused_tile] Newly focused [Tile] under mouse cursor.[br]
## [param previous_focused_tile] Previously focused [Tile] under mouse cursor.[br]
func _on_focus_changed(new_focused_tile: Tile, previous_focused_tile: Tile):
	if previous_focused_tile != null:
		erase_cell(Vector2i(previous_focused_tile.column, previous_focused_tile.row))
	
	if new_focused_tile != null:
		set_cell(Vector2i(new_focused_tile.column, new_focused_tile.row), 0, Vector2i(HighlightState.FOCUSED, 0))
	
