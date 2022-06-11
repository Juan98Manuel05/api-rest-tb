const { Router } = require("express");
const router =  Router()
const jwt = require("jsonwebtoken")
const mysqlConnection = require('../config/mysql')
const verifyToken = require('./auth/auth')

// parameters verify token than allows access at route
router.post('/restaurants', verifyToken, (req, res) => {

    let { city } = req.query
    let query = '';

    if(city !== undefined){
        query = `SELECT * FROM restaurants WHERE city LIKE '%${city}%'`        
    }else{
        query = `SELECT * FROM restaurants`
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