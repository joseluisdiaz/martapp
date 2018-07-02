const defaults = {
  DB_HOST: 'localhost',
  DB_USER: 'postgres',
  DB_PASS: 'password',
  DB_PORT: '5432',
  DB_NAME: 'marta'
}
module.exports = Object.assign({}, process.env, defaults)
