## Class maintains currently focused [Tile] under cursor and signals its changes.
extends Node2D
class_name FocusManager

## Whether the focus manager is enabled.
var enabled: bool = true

## Currently focused [Tile] under mouse cursor (or null if no [Tile] is focused).
var focused_tile: Tile = null

## Subscribes to [GroundEventBus] signals.
func _ready() -> void:
	GroundEventBus.mouse_tile_event_move.connect(_on_mouse_tile_event_move)
	GroundEventBus.mouse_tile_event_action_pressed.connect(_on_mouse_tile_event_action_pressed)
	GroundEventBus.mouse_tile_event_action_released.connect(_on_mouse_tile_event_action_released)

## Resolves what [Tile] under mouse cursor is currently focused.[br]
## Emits [signal _GroundEventBus.focus_changed] when [Tile] under mouse cursor changes.[br]
## [param tile] [Tile] currently under mouse cursor (or null if no [Tile] is focused).
func _on_mouse_tile_event_move(tile: Tile) -> void:
	if not enabled:
		return

	var previous_tile = focused_tile
	focused_tile = tile

	if previous_tile != focused_tile:
		GroundEventBus.focus_changed.emit(focused_tile, previous_tile)

## Disables focus manager when action mouse button is pressed and unsets focused [Tile].[br]
## [param _tile] [Tile] currently under mouse cursor (or null if no [Tile] is focused).
func _on_mouse_tile_event_action_pressed(_tile: Tile) -> void:
	_on_mouse_tile_event_move(null)
	enabled = false

## Enables focus manager when action mouse button is released and sets focused [Tile] under mouse cursor.[br]
## [param tile] [Tile] currently under mouse cursor (or null if no [Tile] is focused).
func _on_mouse_tile_event_action_released(tile: Tile) -> void:
	enabled = true
	_on_mouse_tile_event_move(tile)
