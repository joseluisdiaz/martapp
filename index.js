const Hapi = require('hapi')
const { Client } = require('pg')
const Boom = require('boom')
require('env2')('.env')

const server = Hapi.server({
  host: 'localhost',
  port: Number(process.argv[2] || 8000)
})

const client = new Client({
  user: process.env.DB_USERNAME,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_CODE,
  port: process.env.DB_PORT
})
client.connect()

const initRoutes = () => {
  server.route({
    method: 'GET',
    path: '/players/{id}',
    config: {
      handler: async function getPlayerById (request, h) {
        console.log('inside getPlayerById handler')
        const queryText = `SELECT * FROM "Players" WHERE "Players"."PlayerID" = ${encodeURIComponent(request.params.id)}`
        const values = []
        try {
          let results = await client.query(queryText, values)
          return results.rows
        } catch (err) {
          console.log(err.stack)
          throw new Boom(err)
        }
      },
      description: 'Get player by playerID'
    }
  })
  server.route({
    method: 'GET',
    path: '/matches/{id}',
    config: {
      handler: async function getMatchByID (request, h) {
        console.log('inside getMatchByID handler')
        const queryText = `SELECT * FROM "Matches" WHERE "Matches"."MatchID" = ${encodeURIComponent(request.params.id)}`
        const values = []
        try {
          let results = await client.query(queryText, values)
          return results.rows
        } catch (err) {
          console.log(err.stack)
          throw new Boom(err)
        }
      },
      description: 'Get matches by MatchID'
    }
  })
}

async function start () {
  initRoutes()

  try {
    await server.start()
  } catch (err) {
    console.log(err)
    process.exit(1)
  }

  console.log(`Server running at: ${server.info.uri}`)
};

start()
