'use strict';

const express = require('express');
const app = express();

app.get('/', (req, res) => {
	console.log('GET /');
	res.send('HELLO WORLD!');
});

app.listen(3000, () => {
	console.log('Listening to port 3000');
});
