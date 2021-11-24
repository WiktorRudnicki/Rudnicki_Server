const express = require('express');
const morgan = require('morgan');
const helmet = require('helmet');
const path = require('path');
const cors = require('cors');
const router = require('./routes/cds');
require('colors');
require('dotenv').config();

const app = express();

app.use(morgan('dev'));

app.use(express.static(path.join(__dirname, '/public')));
app.use(helmet());

app.use(cors());

app.use(express.json());

app.use(router);

const PORT = process.env.PORT ?? 5000;

app.listen(PORT);
