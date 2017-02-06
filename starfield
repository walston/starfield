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

function movement(position, direction) {
  let shift = 0;
  direction = ["NE", "NW", "SW", "SE"][direction]

  // only shift horizontally if not side edges
  if (position % columns !== 0 && direction[1] !== "W") {
    shift += 1
  }
  else if (position % columns !== columns - 1 && direction[1] !== "E") {
    shift -= 1
  }

  // only shift vertically if not near top || bottom edge
  if ((position / columns) > 1 && direction[0] !== "N") {
    shift -= columns
  }
  else if (position / columns < rows && direction[0] !== "S") {
    shift += columns
  }

  return shift;
}

return write(board.map( n => symbols[n] ).join(''))
