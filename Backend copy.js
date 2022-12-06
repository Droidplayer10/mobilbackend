const express = require('express')
const app = express()
const port = 24007

app.use(express.static('kepek'))
app.use(express.json())

app.get('/', (req, res) => {
  res.send('Hello World!')
})

//------------------------ országok lekérdezése
app.get('/orszagok', (req, res) => {
    const mysql = require('mysql')
    const connection = mysql.createConnection({
      host: '192.168.0.200',
      user: 'u65_t8lXdWlwJn',
      password: 'J==ECdAAr0ON!!=k7WZo!XY8',
      database: 's65_db'
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
      user: 'boros.tamas.attila.597@dszcbaross.edu.hu',
      password: 'Covid-19',
      database: 's65_db'
    })
    
    connection.connect()
    
    connection.query('SELECT * from nyaralas', (err, rows, fields) => {
      if (err) throw err
    
      res.send(rows)
    })
    
    connection.end()
  })




app.listen(port, () => {
  console.log(`Example app listening on port 192.168.0.200:${port}`)
})