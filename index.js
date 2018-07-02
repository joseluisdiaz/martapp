const Hapi = require('hapi')
const glob = require('glob')
const path = require('path')
const dbPlugin = require('./src/lib/db')

const server = Hapi.server({
  host: 'localhost',
  port: Number(process.argv[2] || 8000)
})

async function start () {
  const apiRoutes = glob.sync('src/api/*.js', { root: __dirname }).map(
    (file) => require(path.join(__dirname, file))
  )
  server.route(apiRoutes)

  try {
    await server.register([dbPlugin])
    await server.start()
  } catch (err) {
    console.log(err)
    process.exit(1)
  }

  console.log(`Server running at: ${server.info.uri}`)
};

start();
