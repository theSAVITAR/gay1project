const mysql = require('mysql2')
const {config} = require('dotenv')
config()

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
}).promise()

module.exports = pool
