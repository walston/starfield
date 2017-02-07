#! /usr/bin/env node

const write = process.stdout.write.bind(process.stdout)
const columns = process.stdout.columns
const rows = 7
const symbols = [
  ' ', '.', 'o', '+',
  '=', '*', 'B', 'O',
  'X', '@', '%', '&',
  '#', '/', '^'
]

let moves = new Array(1024)
for (let i = 0; i < moves.length; i++) {
  moves[i] = Math.floor(Math.random() * 4)
}
var board = (new Array(process.stdout.columns * rows)).fill(0)
var position = Math.floor(board.length / 2)

board[position]++
for(let i = 0; i < moves.length; i++) {
  position += movement(position, moves[i])
  board[position] <= symbols.length ? board[position]++ : null
}

function movement(origin, direction) {
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

write(columns + 'x' + rows + '\n')
write(board.map( n => symbols[n] ).join(''))
return write('\n')
