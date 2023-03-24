const express = require('express')
const mysql = require('mysql')
const app = express()
const port = 3000


function Kapcsolat (){
  connection  = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'utazas1'
  })
  connection.connect()
}


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

  app.post('/felvitel', (req, res) => {
    const mysql = require('mysql')
  
    const connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'utazas1'
    })
  
    connection.connect()
  
    connection.query("INSERT INTO felhasznaloutazas VALUES (NULL,'"+req.body.felhasznaloId+"' ,'"+req.body.ajanlathonnanvaros+"', '"+req.body.itemajanlatvarosnev+"', '"+req.body.selectedDate+"', '"+req.body.returnDate+"', '"+req.body.selectedValue+"') ",
    (err, rows, fields) => {
      if (err) {
        res.status(500).send(err)
        throw err
      }
      
      res.send('Sikeresen hozzáadva')
    })
    connection.end()
  })
  


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
  
  connection.query('SELECT * from ajanlat_varos', (err, rows, fields) => {
    if (err) throw err
  
    res.send(rows)
  })
  
  connection.end()
})


//------------------Peti része:-------------------
//------------------------     Autó lekérdezése
app.get('/auto', (req, res) => {
    
  Kapcsolat()  
  connection.query('SELECT * from auto', (err, rows, fields) => {
    if (err) throw err
  
    res.send(rows)
  })
  
  connection.end()
})
//------------------------     Autó akció lekérdezése
app.get('/auto_akcio', (req, res) => {
  
Kapcsolat()  
connection.query('SELECT * from auto where auto_akcio=1', (err, rows, fields) => {
  if (err) throw err

  res.send(rows)
})

connection.end()
})
//------------------------     Autó napi ára
app.get('/auto_napiar', (req, res) => {
  
Kapcsolat()  
connection.query('SELECT * from auto where auto_napiar=1', (err, rows, fields) => {
  if (err) throw err

  res.send(rows)
})

connection.end()
})
//------------------------     Autó akciós ár
app.get('/auto_akcios_ar', (req, res) => {
  
Kapcsolat()  
connection.query('SELECT * from auto where auto_akcios_ar=1', (err, rows, fields) => {
  if (err) throw err

  res.send(rows)
})

connection.end()
})
//------------------------     Autó_évjárat lekérdezése
app.get('/auto_evjarat', (req, res) => {

Kapcsolat()
connection.query('SELECT * from auto_evjarat', (err, rows, fields) => {
  if (err) throw err

  res.send(rows)
})

connection.end()
})
//------------------------     Szalloda lekérdezése
app.get('/szalloda', (req, res) => {
  
Kapcsolat()  
connection.query('SELECT * from szalloda', (err, rows, fields) => {
  if (err) throw err

  res.send(rows)
})

connection.end()
})
//------------------------Elérhetőség lekérdezése
app.get('/elerhetoseg', (req, res) => {
  
Kapcsolat()  
connection.query('SELECT * from elerhetoseg', (err, rows, fields) => {
  if (err) throw err

  res.send(rows)
})

connection.end()
})
//------------------------     Látványoságok lekérdezése
app.get('/latvanyosag', (req, res) => {
  
Kapcsolat()  
connection.query('SELECT * from latvanyosag', (err, rows, fields) => {
  if (err) throw err

  res.send(rows)
})

connection.end()
})
//-----Keres
app.post('/keres', (req, res) => {
kapcsolat()
let parancs="select * from nyaralas where film.cim like '%"+req.body.bevitel1+"%'"
connection.query(parancs, (err, rows, fields) => {
  if (err) console.log(err)
else
  res.send(rows)
})

connection.end()
})
//------------------------Kölcsönzési nap
app.get('/kolcsonzes', (req, res) => {
  
Kapcsolat()  
connection.query('SELECT * FROM kolcsonzes inner JOIN auto ON auto.auto_id=kolcsonzes.auto_id', (err, rows, fields) => {
  if (err) throw err

  res.send(rows)
})

connection.end()
})



app.get('/auto_adatok', (req, res) => {
  
Kapcsolat()  
connection.query('SELECT * from auto_adatok', (err, rows, fields) => {
  if (err) throw err

  res.send(rows)
})

connection.end()
})


app.listen(port, () => {
  console.log(`Example app listening on port${port}`)
})