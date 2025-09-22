## Class maintains currently focused [Tile] under cursor and signals its changes.
extends Node2D
class_name FocusManager

## [TileManager] for getting [Tile] object based on mouse position.
@onready var tile_manager: TileManager = $"../../TileManager"

## [TileMapLayerHighlights](parent) for [TileMapLayer] functions.
@onready var tile_map_layer_highlights: TileMapLayerHighlights = $".."

## Currently focused [Tile] under mouse cursor (or null if no [Tile] is focused).
var focused_tile: Tile = null;

## Resolves what [Tile] under mouse cursor is currently selected.[br]
## Emits [signal _GroundEventBus.focus_changed] when [Tile] under mouse cursor changes.
func _process(delta: float) -> void:
	var tile_under_cursor_position: Vector2i = tile_map_layer_highlights.local_to_map(get_local_mouse_position())
	var tile_under_cursor: Tile = tile_manager.get_tile(tile_under_cursor_position.y, tile_under_cursor_position.x)
	
	if tile_under_cursor != null && (focused_tile == null or focused_tile != tile_under_cursor):
		GroundEventBus.focus_changed.emit(tile_under_cursor, focused_tile)
		focused_tile = tile_under_cursor
		focused_tile.highlight_state = Tile.HighlightState.FOCUSED
