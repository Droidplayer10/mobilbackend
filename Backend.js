const express = require('express')
const app = express()
const port = 3000

app.use(express.static('kepek'))
app.use(express.json())

app.get('/', (req, res) => {
  res.send('Hello World!')
})

//------------------------ országok lekérdezése
app.get('/orszagok', (req, res) => {
    const mysql = require('mysql')
    const connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'utazas'
    })
    
    connection.connect()
    
    connection.query('SELECT * from orszagok', (err, rows, fields) => {
      if (err) throw err
    
      res.send(rows)
    })
    
    connection.end()
  })


//-------------------------------
//------------------------ országok lekérdezése
app.get('/nyaralas', (req, res) => {
    const mysql = require('mysql')
    const connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'utazas'
    })
    
    connection.connect()
    
    connection.query('SELECT * from nyaralas', (err, rows, fields) => {
      if (err) throw err
    
      res.send(rows)
    })
    
    connection.end()
  })




app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})