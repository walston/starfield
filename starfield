#! /usr/bin/env node

console.time('timer')

const seed = process.argv[2]
const dev = process.argv[3]
const write = process.stdout.write.bind(process.stdout)
const columns = 27 
const rows = 9
const stumble = require('./stumble')(columns, rows)
const moveSet = require('./moveSet')(seed)
const symbols = " .~+=*!oxOYHX0M&8#".split('')
// const symbols = " ⠐⠌⠕⠭⠮⠽⠿⡷⢿⣿".split('')

var board = (new Array(columns * rows)).fill(0)
var position = Math.floor(board.length / 2)

board[position]++
for(let i = 0; i < moveSet.length; i++) {
  position += stumble(position, moveSet[i])
  if (board[position] < symbols.length) {
    board[position] += 1
  }
}

let printout = board
  .map((n, i) => {
    const sym = symbols[n] || symbols[0]
    const newline = i % columns === columns - 1 ? '\n' : ''
    return sym + newline
  })
  .join('')

if (dev) {
  write("DEBUGGING INFORMATION:\n")

  write(`Dimension   : ${rows}x${columns}\n`)
  write(`Area        : ${rows * columns}\n`)
  write(`board.length: ${board.length}\n`)
  write(`prinout     : ${printout.length}\n`)
  console.timeEnd('timer')
  for(let i = columns; i > 0; i--) {
    write('=')
  }
  write('\n')
}
write(printout)
