const Boom = require('boom')

module.exports = {
  method: 'GET',
  path: '/matches/{id}',
  config: {
    handler: async function getMatchByID (request, h) {
      console.log('inside getMatchByID handler')
      const queryText = `SELECT * FROM "Matches" WHERE "Matches"."MatchID" = ${encodeURIComponent(request.params.id)}`
      const values = []
      try {
        let results = await request.pg.query(queryText, values)
        return results.rows
      } catch (err) {
        console.log(err.stack)
        throw new Boom(err)
      }
    },
    description: 'Get matches by MatchID'
  }
}
