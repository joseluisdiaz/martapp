const { Pool } = require('pg')
const env = require('./env')

function register (server, options) {
  const pool = new Pool({
    host: env.DB_HOST,
    port: env.DB_PORT,
    user: env.DB_USER,
    password: env.DB_PASS,
    database: env.DB_NAME
  })
  server.ext({
    type: 'onPreHandler',
    method: async (req, h) => {
      console.log('getting a new connection')
      req.pg = await pool.connect()
      return h.continue
    }
  })

  server.ext({
    type: 'onPostHandler',
    method: async (req, h) => {
      await req.pg.release()
      console.log('releasing a connection')
      return h.continue
    }
  })
}

module.exports = {
  register,
  name: 'metrics',
  version: '0.0.1'
}
