const crypto = require('crypto')

module.exports = (seed) => {
  seed = seed || crypto.randomBytes(8).toString('hex')

  var buffer = Buffer.concat([
    crypto.createHash('whirlpool').update(seed).digest(),
    crypto.createHash('whirlpool').update(seed + " ").digest()
  ])

  return Array.from(buffer).reduce((accumulator, current) => (
    accumulator.concat([
      Number((current >> 0) & 3),
      Number((current >> 2) & 3),
      Number((current >> 4) & 3),
      Number((current >> 6) & 3)
    ])
  ), [])
}
