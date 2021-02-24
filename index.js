const express = require('express');
const app = express();

app.get('/', (req, res) => res.json({hello: 'world'}));

app.listen(3000, '0.0.0.0', () => console.log('Listening at 0.0.0.0:3000'));
