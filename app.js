require('dotenv').config()
const express = require("express")
const app = express();

// settings
app.set('port', process.env.PORT)
app.set('json spaces', 2)

//middlewares
app.use(express.json()) 

// routes
app.use('/api/v1', require('./routes/create-account')) // createuser
app.use('/api/v1', require('./routes/login')) // route principal login
app.use('/api/v1', require('./routes/restaurants')) // route restaurants
app.use('/api/v1', require('./routes/transactions')) // route restaurants

// starting the server
app.listen(process.env.PORT, () => {
    console.log(`Server on port ${process.env.PORT}`)
})