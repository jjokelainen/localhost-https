const fs = require('fs');
const https = require('https');

const path = require('path');
const express = require("express");
const app = express();
app.use(express.static(path.join(__dirname,'..','public')));

const httpsServer = https.createServer({
    cert: fs.readFileSync(path.join(__dirname,'..','certs','localhost.crt')),
    key: fs.readFileSync(path.join(__dirname,'..','certs','localhost.key'))
}, app);


httpsServer.listen(443,()=>{
    console.log("Server listening on https://localhost:443");
});

