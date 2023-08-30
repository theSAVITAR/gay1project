const express = require('express')
const categoryRoute = express.Router()

categoryRoute.get('/',(req,res)=>{
    res.send("Category route get method")
})
categoryRoute.put('/',(req,res)=>{
    res.send("SUP Adhamboy")
})
categoryRoute.delete('/',(req,res)=>{
    res.send("SUP Adhamboy")
})
categoryRoute.post('/',(req,res)=>{
    res.send("SUP Adhamboy")
})
categoryRoute.get('//:id',(req,res)=>{
    res.send("SUP Adhamboy")
})

module.exports = categoryRoute