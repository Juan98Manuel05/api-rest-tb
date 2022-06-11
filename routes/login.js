const { Router } = require("express");
const jwt = require("jsonwebtoken")
const mysqlConnection = require('../config/mysql')
const router =  Router()

// route login
router.post('/login', (req, res) => {
    let { nameuser, password } = req.body

    const user = { 
        nameuser,   
        password 
    }

    const query = `SELECT usuario, clave FROM users WHERE usuario = '${nameuser}' AND clave = MD5('${password}')`

    mysqlConnection.query(query, (err, rows, fields) => {
        if(!err){
            if(rows.length == 0){
                res.status(200).json({
                    token: null,
                    message: "User no exist!"
                })
            }else if(rows){
                jwt.sign({user}, 'secretKey', {expiresIn: '1h'}, (err, token) => {        
                    res.json({
                        token
                    })
                })
            }
        }else{
            res.status(200).json({
                error: true,
                message: 'Bad request'
            })
        }
    })
    
})

module.exports = router