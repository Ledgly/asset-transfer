
// initialize variables //
const express 	= require('express')
const Truffle 	= require('truffle-contract')
const Web3 		= require('web3')
const fs 		= require('fs')
const path 		= require('path')
const app 		= express()
const port 		= 12345

const contractJSON = path.join(__dirname, '../build/contracts/Asset.json');

// set view engines //
app.set('view engine', 'pug')
app.set('views', path.join(__dirname, "pages"))

// get pages //
app.get('/', function(req, res){
	res.render('index')
})

app.get('/Asset.json', function(req, res){
	var readable = fs.createReadStream(contractJSON)
    readable.pipe(res)
})

// start server //
app.listen(port, function() {
	console.log('App started @ http://localhost:' + port)
})
