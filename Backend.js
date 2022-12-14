const express = require('express')
const app = express()
const port = 3000

//app.use(express.static('kepek'))
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

//------KERES
  app.post('/keres', (req, res) => {
    kapcsolat()
	let parancs="select * from nyaralas like '"+req.body.bevitel1+"'"
    connection.query(parancs, (err, rows, fields) => {
      if (err) console.log(err)
		else
			res.send(rows)
    })
    
    connection.end()
  })



app.listen(port, () => {
  console.log(`Example app listening on port${port}`)
})