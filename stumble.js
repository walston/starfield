module.exports = function(columns, rows) {
  return (origin, direction) => {
    let delta = 0;
    direction = ["NE", "NW", "SW", "SE"][direction]

    // if DIRECTION is EAST and ORIGIN is NOT in last column
    if      (direction[1] === "E" && origin % columns !== columns - 1) {
      delta += 1
    }
    // if DIRECTION is WEST and ORIGIN is NOT in first column
    else if (direction[1] === "W" && origin % columns !== 0) {
      delta -= 1
    }

    // if DIRECTION is SOUTH and ORIGIN is NOT in last row
    if      (direction[0] === "S" && origin / columns < rows - 1) {
      delta += columns
    }
    // if DIRECTION is NORTH and ORIGIN is NOT in first row
    else if (direction[0] === "N" && origin / columns >= 1) {
      delta -= columns
    }

    return delta;
  }
}
