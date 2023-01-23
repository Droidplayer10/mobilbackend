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
      database: 'utazas1'
    })
    
    connection.connect()
    
    connection.query('SELECT * from orszagok', (err, rows, fields) => {
      if (err) throw err
    
      res.send(rows)
    })
    
    connection.end()
  })


/*
  app.post('/felhasznalok', (req, res) => {
    const mysql = require('mysql')
    
    const connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'utazas1'
    })
    
    connection.connect()
    
    connection.query('SELECT * from felhasznalok', (err, rows, fields) => {
      if (err) throw err
    
      res.send(rows)
    })
    
    connection.end()
  })
*/


app.post('/felhasznalok', (req, res) => {
  const mysql = require('mysql')
  
  const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'utazas1'
  })
  
  connection.connect()
  
  connection.query('SELECT * from felhasznalok where felhasznalo_id =?',
  [req.body.felhasznalo_id],
  (err, rows, fields) => {
    if (err){
    //throw err
  res.status(500).send(err)
  return
    }
  //  res.send(rows)
   if(rows.length ===0){
    res.status(401).send({succes: false, message: 'Helytelen felhasználó név'})
    return
  }
  if(req.body.password !==rows[0].password){
    res.status(401).send({
    succes: false, message: 'Helytelen jelszó'})
    return
  }
  res.send({
    succes: true, message: 'Sikeres bejelentkezés!'})
  })
  
  connection.end()
})



  //------------------------ Ajánlatok lekérdezése
app.get('/ajanlat', (req, res) => {
  const mysql = require('mysql')
  const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'utazas1'
  })
  
  connection.connect()
  
  connection.query('SELECT * from ajanlat', (err, rows, fields) => {
    if (err) throw err
  
    res.send(rows)
  })
  
  connection.end()
})



//------KERES
 /* app.post('/keres', (req, res) => {
    kapcsolat()
	let parancs="select * from nyaralas where '"+req.body.bevitel1+"' = "
    connection.query(parancs, (err, rows, fields) => {
      if (err) console.log(err)
		else
			res.send(rows)
    })
    
    connection.end()
  })
*/


app.listen(port, () => {
  console.log(`Example app listening on port${port}`)
})