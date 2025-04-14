const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const PORT = 3000;


app.use(cors());
app.use(express.json());

// Adatbázis kapcsolat
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'luxuryscents'
});

db.connect((err) => {
  if (err) throw err;
  console.log('Csatlakozva az adatbázishoz');
});

// GET: Összes parfüm
app.get('/parfumok', (req, res) => {
  const query = `
    SELECT p.*, r.* 
    FROM parfumok p 
    JOIN reszletes r ON p.id = r.id
  `;
  db.query(query, (err, results) => {
    if (err) return res.status(500).send('Hiba');
    res.json(results);
  });
});

// GET: Parfüm ID alapján
app.get('/parfumok/:id', (req, res) => {
  const query = `
    SELECT p.*, r.* 
    FROM parfumok p 
    JOIN reszletes r ON p.id = r.id 
    WHERE p.id = ?
  `;
  db.query(query, [req.params.id], (err, results) => {
    if (err) return res.status(500).send('Hiba');
    if (!results[0]) return res.status(404).send('Nem található');
    res.json(results[0]);
  });
});

// POST: Új parfüm
app.post('/parfumok', (req, res) => {
  const { marka, szeria, rovid_leiras, ar, ertekeles, reszletes_leiras, tipus, nem, illatcsalad, megjelenes_eve, raktaron } = req.body;
  db.query('INSERT INTO parfumok (marka, szeria, rovid_leiras, ar, ertekeles) VALUES (?, ?, ?, ?, ?)', 
    [marka, szeria, rovid_leiras, ar, ertekeles], (err, result) => {
      if (err) return res.status(500).send('Hiba');
      const id = result.insertId;
      db.query('INSERT INTO reszletes (id, reszletes_leiras, tipus, nem, illatcsalad, megjelenes_eve, raktaron) VALUES (?, ?, ?, ?, ?, ?, ?)', 
        [id, reszletes_leiras, tipus, nem, illatcsalad, megjelenes_eve, raktaron], (err) => {
          if (err) return res.status(500).send('Hiba');
          res.status(201).send('Létrehozva');
        });
    });
});

// PUT: Parfüm frissítése
app.put('/parfumok/:id', (req, res) => {
  const { marka, szeria, rovid_leiras, ar, ertekeles, reszletes_leiras, tipus, nem, illatcsalad, megjelenes_eve, raktaron } = req.body;
  db.query('UPDATE parfumok SET marka = ?, szeria = ?, rovid_leiras = ?, ar = ?, ertekeles = ? WHERE id = ?', 
    [marka, szeria, rovid_leiras, ar, ertekeles, req.params.id], (err) => {
      if (err) return res.status(500).send('Hiba');
      db.query('UPDATE reszletes SET reszletes_leiras = ?, tipus = ?, nem = ?, illatcsalad = ?, megjelenes_eve = ?, raktaron = ? WHERE id = ?', 
        [reszletes_leiras, tipus, nem, illatcsalad, megjelenes_eve, raktaron, req.params.id], (err) => {
          if (err) return res.status(500).send('Hiba');
          res.send('Frissítve');
        });
    });
});

// DELETE: Parfüm törlése
app.delete('/parfumok/:id', (req, res) => {
  db.query('DELETE FROM parfumok WHERE id = ?', [req.params.id], (err) => {
    if (err) return res.status(500).send('Hiba');
    res.send('Törölve');
  });
});

// Szerver indítása
app.listen(PORT, () => {
  console.log(`Szerver fut a ${PORT} porton`);
});