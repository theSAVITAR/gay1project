const express = require('express')
const {config} = require('dotenv')
config()
const categoryRoute = require('./router/category-route.js')    
const productRoute = require('./router/product-route.js')                                                                                                        
const authRoute = require('./router/auth-route.js')
const app = express()
const port = process.env.PORT || 3001

app.use(express.json())

app.use('/category',categoryRoute)
app.use('/product',productRoute)
app.use('/auth',authRoute)





app.listen(port, ()=> console.log('Server running on port '+ port))