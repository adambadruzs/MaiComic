const express = require('express')
const multer  = require('multer')
const path  = require('path')

const app = express()

var storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, __dirname + '/assets/images/cover');
        },
        filename: function (req, file, cb) {
            cb(null, Date.now() + path.extname(file.originalname));
        },
    });

const upload = multer({ storage: storage });

app.post('/upload', upload.single('image'), (req, res) => {
    if (req.file === undefined || req.file === null) {
        return res.status(422).send("No image was uploaded.");
    } 
    let file = req.file;
    return res.status(200).send({name: file.filename});
});

app.listen(3000, () => console.log('Server is running on port 3000'));