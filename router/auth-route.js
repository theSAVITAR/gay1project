const express = require('express')
const authRoute = express.Router()
const jwt = require('jsonwebtoken')
const pool = require('../db/db.config.js')


const accessSecret = process.env.ACCESS_TOKEN_SECRET
const refreshSecret = process.env.REFRESH_TOKEN_SECRET


authRoute.post('/login', (req, res) => {
    try {
        const { phone, password } = req.body
        const accessToken = jwt.sign({ username, role: 'admin' }, accessSecret, { expiresIn: '30m' })
        const refreshToken = jwt.sign({ username, role: 'admin' }, refreshSecret, { expiresIn: '30d' })
        res.send({accessToken, refreshToken})
    } catch (error) {
        res.send({message: error.message})
    }
})

authRoute.post('/register',async (req, res) => {
    try {
        const {name,phone, image, password} = req.body
        const result = await pool.query('SELECT * FROM user WHERE phone = ?', phone)
        console.log(result);
        res.send({result})

    } catch (error) {
        res.send({message: error.message})
    }

})

authRoute.post('/refresh', async (req, res) => {
    try {
        const refereshTokenFromClient = req.body.refreshToken
        const {username, role} = jwt.verify(refereshTokenFromClient,refreshSecret)
        console.log(username, role);
        const accessToken = jwt.sign({username, role},accessSecret,{expiresIn:'30m'})
        const refreshToken = jwt.sign({username, role}, refreshSecret, { expiresIn:'30d'})
        res.send({accessToken, refreshToken})
    } catch (error) {
        res.send({message: error.message})
    }
})


module.exports = authRoute