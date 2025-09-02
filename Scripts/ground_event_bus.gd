## Autoloaded singleton for managing internal Ground scene signals.
extends Node
class_name _GroundEventBus

## Emitted when the ground dimensions change.[br]
## [param rows] New number of rows.[br]
## [param columns] New number of columns.
signal ground_dimensions_changed(rows: int, columns: int)
