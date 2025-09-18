## Manages the tiles in the grid.
extends Node
class_name TileManager

## Number of rows in the grid.
var rows: int = 0

## Number of columns in the grid.
var columns: int = 0

## Actual tile grid (for example position of Tile[row 2, column 3] = grid[2 * columns + 3]).
var grid: Array[Tile] = []

## Connects to the [signal _GroundEventBus.ground_dimensions_changed] signal to get actual ground dimensions.
func _ready() -> void:
	GroundEventBus.ground_dimensions_changed.connect(_on_ground_dimensions_changed)

## Updates the number of rows and columns when the ground dimensions change.[br]
## [param new_rows] New number of rows.[br]
## [param new_columns] New number of columns.
func _on_ground_dimensions_changed(new_rows: int, new_columns: int) -> void:
	self.rows = new_rows
	self.columns = new_columns

	# Clear the existing grid
	grid.clear()
	
	# Generate new grid
	for row: int in range(rows):
		for column: int in range(columns):
			grid.append(Tile.new(row, column))
	
## Returns Tile from the grid on specified position.[br]
## Returns null if grid is not yet initialized, rows or columns are invalid (0) or requested Tile is out of bounds of grid.[br]
## [param row] Tile row position.[br]
## [param column] Tile column position.[br]
func _get_tile(row: int, column: int) -> Tile:
	if rows <= 0 or columns <= 0 or grid.is_empty():
		push_warning("Grid is not yet initialized.")
		return null
	if row < 0 or row >= rows or column < 0 or column >= columns:
		push_warning("Requested tile out of bounds: row %d, column %d" % [row, column])
		return null
	return grid[row * columns + column]
