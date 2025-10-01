## Class that handles mouse events in context of [Tile]s.
## Changes of focused [Tile], clicked [Tile],...
extends Node2D
class_name MouseTileEvents

## Path to the [TileManager] node.
@export var tile_manager_path: NodePath

## Path to the [TileMapLayerHighlights] node.
@export var tile_map_layer_highlights_path: NodePath

## [TileManager] for getting [Tile] object based on mouse position.
@onready var tile_manager: TileManager = get_node(tile_manager_path)

## [TileMapLayerHighlights](parent) for [TileMapLayer] functions.
@onready var tile_map_layer_highlights: TileMapLayerHighlights = get_node(tile_map_layer_highlights_path)

## Called when the node enters the scene tree.[br]
## Checks that exported variables are set.
func _ready() -> void:
	assert(not tile_manager_path.is_empty(), "tile_manager_path is not set.")
	assert(not tile_map_layer_highlights_path.is_empty(), "tile_map_layer_highlights_path is not set.")

## Handles input events and emits respective signals.
## [param event] Input event to handle.
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var tile_under_cursor_position: Vector2i = tile_map_layer_highlights.local_to_map(tile_map_layer_highlights.get_local_mouse_position())

		# If position is out of bounds, set tile_under_cursor to null and emmit change signal if needed
		if tile_under_cursor_position.x < 0 or tile_under_cursor_position.x >= tile_manager.columns \
		  or tile_under_cursor_position.y < 0 or tile_under_cursor_position.y >= tile_manager.rows:
			GroundEventBus.mouse_tile_event_move.emit(null)
			return

		var tile_under_cursor: Tile = tile_manager.get_tile(tile_under_cursor_position.y, tile_under_cursor_position.x)
		GroundEventBus.mouse_tile_event_move.emit(tile_under_cursor)
