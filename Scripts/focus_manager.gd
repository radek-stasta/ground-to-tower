## Manages currently focused [Tile] and focus changes
extends TileMapLayer
class_name FocusManager

## Currently focused [Tile] under mouse cursor (or null if no [Tile] is focused)
var focused_tile: Tile = null
