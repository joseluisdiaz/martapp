const Boom = require('boom')

module.exports = {
  method: 'GET',
  path: '/players/{id}',
  config: {
    handler: async function getPlayerById (request, h) {
      console.log('inside getPlayerById handler')
      const queryText = `SELECT * FROM "Players" WHERE "Players"."PlayerID" = ${encodeURIComponent(request.params.id)}`
      const values = []
      try {
        let results = await request.pg.query(queryText, values)
        return results.rows
      } catch (err) {
        console.log(err.stack)
        throw new Boom(err)
      }
    },
    description: 'Get player by playerID'
  }
}
