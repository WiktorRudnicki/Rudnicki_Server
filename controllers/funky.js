const { getItemsDB, deleteItemDB, songlistDB, addItemDB, searchAlbumDB } = require('../model/funkyDB');

async function getItems(req, res) {
  const result = await getItemsDB();
  res.status(200).json(result);
}

async function deleteItem(req, res) {
  console.log(req.params.id);
  const result = await deleteItemDB(req.params.id);
  res.status(200).json(result);
}

async function addItem(req, res) {
  const result = await searchAlbumDB(req.params.id);
  if (result != null) {
    await addItemDB(result, req.body);
    res.status(200).json(result);
  }
}

async function songList(req, res) {
  const result = await songlistDB(req.params.id);
  res.status(200).json(result);
}

module.exports = { getItems, deleteItem, addItem, songList };
