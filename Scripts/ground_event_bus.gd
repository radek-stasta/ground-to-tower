## Autoloaded singleton for managing internal Ground scene signals.
extends Node
class_name _GroundEventBus

## Emitted when the ground dimensions change.[br]
## [param rows] New number of rows.[br]
## [param columns] New number of columns.[br][br]
## [b][u]Emiters:[/u][/b][br]
## [Ground]: When ground dimensions are initialized.[br][br]
## [b][u]Subscribers:[/u][/b][br]
## [TileManager]: Updates its [member TileManager.rows] and [member TileManager.columns] and generates new [member TileManager.grid].[br][br]
signal ground_dimensions_changed(rows: int, columns: int)

## Emitted when ground tile grid has been generated.[br]
## [param rows] Number of rows in new grid.[br]
## [param columns] Number of columns in new grid.[br][br]
## [b][u]Emiters:[/u][/b][br]
## [TileManager]: When ground grid has been generated.[br][br]
## [b][u]Subscribers:[/u][/b][br]
## [TileMapLayerGrass]: Updates graphics of newly generated grid[br]
## [TileMapLayerGrid]: Updates graphics of newly generated grid[br]
## [TileMapLayerHighlights]: Updates graphics of newly generated grid[br]
signal tile_grid_generated(rows: int, columns: int)
