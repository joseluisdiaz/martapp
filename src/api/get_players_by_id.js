const Boom = require('boom')

module.exports = {
  method: 'GET',
  path: '/players/{id}',
  config: {
    handler: async function getPlayerById (request, h) {
      console.log('inside getPlayerById handler')
      const queryText = `SELECT * FROM "Players" WHERE "Players"."PlayerID" = $1`
      const values = [request.params.id]
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
