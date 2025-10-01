## Class maintains currently focused [Tile] under cursor and signals its changes.
extends Node2D
class_name FocusManager

## Currently focused [Tile] under mouse cursor (or null if no [Tile] is focused).
var focused_tile: Tile = null

## Subscribes to [GroundEventBus] signals.
func _ready() -> void:
	GroundEventBus.mouse_tile_event_move.connect(_on_mouse_tile_event_move)

## Resolves what [Tile] under mouse cursor is currently focused.[br]
## Emits [signal _GroundEventBus.focus_changed] when [Tile] under mouse cursor changes.
func _on_mouse_tile_event_move(tile: Tile) -> void:
	var previous_tile = focused_tile
	focused_tile = tile

	if previous_tile != focused_tile:
		GroundEventBus.focus_changed.emit(focused_tile, previous_tile)
