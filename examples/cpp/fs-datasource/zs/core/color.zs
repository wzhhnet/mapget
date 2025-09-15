/*!

# Colors

This package defines colors. Colors are used for display purposes and for the
attribution of map features.

**Dependencies**

!*/

package core.color;

import core.types.*;

/** Color defined by reg, blue, and green values. */
struct ColorRgb
{
  /** RGB value for red. */
  uint8 red;

  /** RGB value for green. */
  uint8 green;

  /** RGB value for blue. */
  uint8 blue;
};

/** Color defined by red, green, blue, and alpha values. */
struct ColorRgba
{
  /** RGBA value for red. */
  uint8 red;

  /** RGBA value for green. */
  uint8 green;

  /** RGBA value for blue. */
  uint8 blue;

  /** RGBA value for opacity. */
  uint8 alpha;
};
