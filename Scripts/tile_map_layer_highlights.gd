## Tile map layer containing highlighting graphics.
extends TileMapLayer
class_name TileMapLayerHighlights

## Connects to the [signal _GroundEventBus.focus_changed] signal to update new and previous focused [Tile] graphics
func _ready() -> void:
	GroundEventBus.focus_changed.connect(_on_focus_changed)
	
func _on_focus_changed(new_focused_tile: Tile, previous_focused_tile: Tile):
	if previous_focused_tile != null:
		erase_cell(Vector2i(previous_focused_tile.column, previous_focused_tile.row))
	
	if new_focused_tile != null:
		set_cell(Vector2i(new_focused_tile.column, new_focused_tile.row), 0, Vector2i(Tile.HighlightState.FOCUSED, 0))
	
