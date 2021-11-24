const express = require('express');
const { getItems, deleteItem, addItem, songList } = require('../controllers/funky');

const router = express.Router();

router.get('/shop', getItems);
router.delete('/shop/:id', deleteItem);
router.post('/shop', addItem);
router.get('/shop/song/:titel', songList);

module.exports = router;
