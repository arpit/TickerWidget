# TickerWidget for Flutter

A ticker widget for Flutter. The widget accepts any `Tile`, repeats it just enough times to span the width of the containing widget and then scrolls it. Once one tile-length is scrolled, the widget resets the positions thereby creating an endless seamless effect.

The animation duration field is the speed at which one tile scrolls across. This means the speed will change based on the length of the tile

[TODO] Allow fixed speed regardless of tile length

## Current Tiles:

* `SineWaveTile`: Creates a repeating wave pattern. Uses some of the code from Sam Ruston's [SquigglySpans](https://github.com/samruston/squigglyspans)  library

* `TextTile`: Creates a scrolling text ticker