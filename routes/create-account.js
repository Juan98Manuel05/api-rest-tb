const { Router } = require("express");
const router =  Router()
const mysqlConnection = require('../config/mysql')

// route for create account
router.post('/create-account', (req, res) => {
    const { nameuser, password } = req.body

    // create user for sig in 
    if (nameuser !== undefined && password !== undefined){        
        mysqlConnection.query(`INSERT INTO users(usuario, clave) VALUES('${nameuser}', MD5('${password}'))`, (err, rows, fields) => {
            if(!err){
                res.status(200).json({message: "User created!"})
            }else{
                throw err
            }
        })        
    }else{
        res.status(200).json({message: "Data incompleted!"})
    }

    mysqlConnection.end();
    
})

module.exports = router
