const { Router } = require("express");
const jwt = require("jsonwebtoken")
const router =  Router()
const mysqlConnection = require('../config/mysql')
const verifyToken = require('./auth/auth')

// transactions
router.post('/transactions', verifyToken,  (req, res) => {

    let { type } = req.query
    let query = '';

    if(type !== undefined){
        query = `SELECT * FROM transactions WHERE tipo_tarjeta LIKE '%${type}%'`        
    }else{
        query = `SELECT * FROM transactions`
    }

    jwt.verify(req.token, 'secretkey', (error, authData) => {
        if(error){
            res.sendStatus(403);
        }else{            
            mysqlConnection.query(query, (err, rows, fields) => {
                if(!err){
                    res.status(200).json({
                        restaurants: rows
                    })
                }
            })
        }
    });
})


module.exports = router