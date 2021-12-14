const express = require('express');
const { getItems, deleteItem, addItem, songList, searchAlbum, purchase } = require('../controllers/funky');

const router = express.Router();

router.get('/shop', getItems);
router.get('/shop/:id', searchAlbum);
router.delete('/shop/:id', deleteItem);
router.post('/shop', addItem);
router.get('/shop/song/:id', songList);
router.patch('/shop/:id', purchase);

module.exports = router;
