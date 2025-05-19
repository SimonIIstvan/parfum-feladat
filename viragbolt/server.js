const mysql = require('mysql2');
const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'viragbolt'
});

db.connect((err) => {
    if (err) {
        console.error('Adatbázis kapcsolat hiba:', err);
        return;
    }
    console.log('Kapcsolat sikeres!');
});

app.get('/api/virag', (req, res) => {
    db.query('SELECT aruk.*, k.nev AS kategoria_nev FROM aruk INNER JOIN kategoriak AS k ON aruk.kategoriaId = k.id', (err, results) => {
        if (err) {
            console.error('Adatbázis hiba:', err);
            res.status(500).send('Adatbázis hiba');
            return;
        }
        res.json(results);
    });
})

app.get('/api/virag/:id', (req, res) => {
    const id = req.params.id;
    db.query('SELECT aruk.*, k.nev AS kategoria_nev FROM aruk INNER JOIN kategoriak AS k ON aruk.kategoriaId = k.id WHERE aruk.id = ?', [id], (err, results) => {
        if (err) {
            console.error('Adatbázis hiba:', err);
            res.status(500).send('Adatbázis hiba');
            return;
        }
        res.json(results);
    });
})

app.put('/api/virag/:id', (req, res) => {
    const id = req.params.id;
    const adatok = req.body;
    db.query('UPDATE aruk SET keszlet = ? WHERE id = ?', [adatok, id], (err, results) => {
        if (err) {
            console.error('Adatbázis hiba:', err);
            res.status(500).send('Adatbázis hiba');
            return;
        }
        res.json(results);
    });
})

app.delete('/api/virag/:id', (req, res) => {
    const { id } = req.params
    const lekerdezes = 'DELETE FROM aruk WHERE id = ?'
    adatb.query(lekerdezes, [id], (err, results) => {
        if (err) {
            return res.status(404).json({ error : "A virág nem található!" })
        }
        res.json('Sikeres törlés')
    })
})


app.listen(3000, () => {
    console.log('A szerver fut a 3000-es localhoston!');
});