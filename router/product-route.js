const express = require('express')
const productRoute = express.Router()


productRoute.get('/',(req,res)=>{
    res.send("product route get method")
})
productRoute.put('/',(req,res)=>{
    res.send("SUP Adhamboy")
})
productRoute.delete('/',(req,res)=>{
    res.send("SUP Adhamboy")
})
productRoute.post('/',(req,res)=>{
    res.send("SUP Adhamboy")
})
productRoute.get('//:id',(req,res)=>{
    res.send("SUP Adhamboy")
})

module.exports = productRoute