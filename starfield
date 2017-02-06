#! /usr/bin/env node

const write = process.stdout.write.bind(process.stdout)
const columns = process.stdout.columns
const symbols = [
  ' ', '.', 'o', '+',
  '=', '*', 'B', 'O',
  'X', '@', '%', '&',
  '#', '/', '^', 'S', 'E'
]

let moves = new Array(64)
for (let i = 0; i < moves.length; i++) {
  moves[i] = Math.floor(Math.random() * 4)
}
var board = (new Array(process.stdout.columns * 5)).fill(0)
var position = Math.floor(board.length / 2)

board[position]++
for(let i = 0; i < moves.length; i++) {
  position += movement(moves[i])
  board[position]++
}

function movement (direction) {
  let shift = 0;
  switch (direction) {
    case 0:
      shift = -1 - columns
      break
    case 1:
      shift = 1 - columns
      break
    case 2:
      shift = columns + 1
      break
    case 3:
      shift = columns - 1
      break
    default:
      shift = 0
      break
  }
  return shift;
}

return write(board.map( n => symbols[n] ).join(''))
