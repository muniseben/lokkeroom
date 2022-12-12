//TODO : modules added
import pkg from "pg"
const { Client } = pkg;


import express from "express";
import bcrypt from "bcrypt"
import JWT from "jsonwebtoken"
import * as dotenv from 'dotenv';
dotenv.config()
import { promisify } from 'util'
const app = express();

//TODO : connection created to posgresql database port 5432
const client = new Client ({
    user: 'postgres',
    password: '5565',
    database: 'mb',
    host: 'localhost', 
    port: 5432
})
await client.connect();

const sign = promisify(JWT.sign)
const verify = promisify(JWT.verify)

app.use(express.json())

//!why this is not working?
app.post('/register', (req, res) => {

let { username, email, password } = req.body

if ( !username || !email || !password)
    return res.status(400).send({ error: 'Invalid request' })

try {
    const encryptedPassword = bcrypt.hash(password, 10)
    client.query(
        'INSERT INTO users (username, email, password) VALUES ($1, $2, $3)',[ email, username, encryptedPassword])

    return res.redirect("/index")

} catch (err) {
    console.log(err)
    res.status(500).send({ error: 'Internal server error' })

}

})


//buna 200 ok dedi
app.get('/', (req, res) => {
    res.send({ info: 'Hello '  })
})

//buna 200 ok dedi
app.get('/users', async (req, res) => {
    const q = await client.query('SELECT username from nine_users')
    return res.send(q.rows)
})

//TODO connection created to port 3000
app.listen(3000,() => {
console.log(`Example app listening`)
})
