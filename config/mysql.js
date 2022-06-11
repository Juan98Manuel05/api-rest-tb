const mysql = require('mysql')

// variables enviroment in file .env
// create conecction
const mysqlConnection = mysql.createConnection({
    database: process.env.DB,
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
})

// connect database
mysqlConnection.connect((err)=>{

    if(err){
        console.log(err)
        return
    }else{
        console.log('Database is connected!')
    }
})

module.exports = mysqlConnection