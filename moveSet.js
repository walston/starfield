const crypto = require('crypto')

module.exports = (seed) => {
  seed = seed || crypto.randomBytes(8).toString('hex')

  var buffer = Buffer.concat([
    crypto.createHash('whirlpool').update(seed).digest(),
    crypto.createHash('whirlpool').update(seed + " ").digest()
  ])
  let moveSet = [];

  for (let i = 0; i < buffer.length; i++) {
    let n = buffer[i]
    // pull bits[0-1]
    moveSet.push(Number((n >> 0) & 3))
    // pull bits[2-3]
    moveSet.push(Number((n >> 2) & 3))
    // pull bits[4-5]
    moveSet.push(Number((n >> 4) & 3))
    // pull bits[6-7]
    moveSet.push(Number((n >> 6) & 3))
  }

  return moveSet
}
