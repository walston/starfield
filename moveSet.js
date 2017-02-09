const crypto = require('crypto')

module.exports = (seed) => {
  seed = seed || crypto.randomBytes(8).toString('hex')

  var buffer = Buffer.concat([
    crypto.createHash('whirlpool').update(seed).digest(),
    crypto.createHash('whirlpool').update(seed + " ").digest()
  ])

  return Array.from(buffer).reduce((accumulator, current) => (
    accumulator.concat([
      (current >> 0) & 3,
      (current >> 2) & 3,
      (current >> 4) & 3,
      (current >> 6) & 3
    ])
  ), [])
}
