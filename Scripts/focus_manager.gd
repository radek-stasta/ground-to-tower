## Class maintains currently focused [Tile] under cursor and signals its changes.
extends Node2D
class_name FocusManager

## [TileManager] for getting [Tile] object based on mouse position.
@onready var tile_manager: TileManager = $"../../TileManager"

## [TileMapLayerHighlights](parent) for [TileMapLayer] functions.
@onready var tile_map_layer_highlights: TileMapLayerHighlights = $".."

## Currently focused [Tile] under mouse cursor (or null if no [Tile] is focused).
var focused_tile: Tile = null

## Handles input events for the focus manager and resolves focus on mouse motion.
## [param event] Input event to handle.
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_resolve_focus()

## Resolves what [Tile] under mouse cursor is currently selected.[br]
## Emits [signal _GroundEventBus.focus_changed] when [Tile] under mouse cursor changes or unfocuses current tile if mouse is out of bounds.
func _resolve_focus() -> void:
	var tile_under_cursor_position: Vector2i = tile_map_layer_highlights.local_to_map(tile_map_layer_highlights.get_local_mouse_position())

	# If position is out of bounds, unfocus current tile (if any) and return
	if tile_under_cursor_position.x < 0 or tile_under_cursor_position.x >= tile_manager.columns \
	  or tile_under_cursor_position.y < 0 or tile_under_cursor_position.y >= tile_manager.rows:
		if focused_tile != null:
			GroundEventBus.focus_changed.emit(null, focused_tile)
			focused_tile = null
		return

	var tile_under_cursor: Tile = tile_manager.get_tile(tile_under_cursor_position.y, tile_under_cursor_position.x)
	
	# Only change focus if the tiles are different
	if tile_under_cursor != focused_tile:
		var previous_tile = focused_tile		
		focused_tile = tile_under_cursor		
		GroundEventBus.focus_changed.emit(focused_tile, previous_tile)
