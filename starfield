#! /usr/bin/env node
const seed = process.argv[2]
const write = process.stdout.write.bind(process.stdout)
const columns = process.stdout.columns
const rows = 7
const stumble = require('./stumble')(columns, rows)
const moveSet = require('./moveSet')(seed)
const symbols = " .~+=*!oxOYHX0M&8#".split('')

var board = (new Array(process.stdout.columns * rows)).fill(0)
var position = Math.floor(board.length / 2)

board[position]++
for(let i = 0; i < moveSet.length; i++) {
  position += stumble(position, moveSet[i])
  if (board[position] < symbols.length) {
    board[position] += 1
  }
}

let printout = board.map(n => (symbols[n] || symbols[0]) ).join('')

if (process.env.DEV) {
  write("DEBUGGING INFORMATION:\n")

  write(`Dimension   : ${rows}x${columns}\n`)
  write(`Area        : ${rows * columns}\n`)
  write(`board.length: ${board.length}\n`)
  write(`prinout     : ${printout.length}\n`)
  for(let i = columns; i > 0; i--) {
    write('=')
  }
  write('\n')
}
write(printout)
