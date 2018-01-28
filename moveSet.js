const crypto = require('crypto')

module.exports = (seed = crypto.randomBytes(8).toString('hex')) => (
  Array.from(
    Buffer.concat([
      crypto.createHash('whirlpool').update(seed).digest(),
      crypto.createHash('whirlpool').update(seed + " ").digest()
    ])
  )
  .reduce((accumulator, current) => (
    accumulator.concat([
      (current >> 0) & 3,
      (current >> 2) & 3,
      (current >> 4) & 3,
      (current >> 6) & 3
    ])
  ), [])
)
