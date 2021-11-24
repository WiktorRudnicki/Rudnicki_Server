const db = require('../db/index');

async function getItemsDB() {
  const result = await db.query('SELECT * from album');
  return result.rows;
}

async function deleteItemDB(id) {
  await db.query('DELETE from album where id = $1', [id]);
  return true;
}

async function addItemDB() {
  await db.query('');
}

async function searchAlbumDB(titel) {
  await db.query('SELECT * from album where titel = $1', [titel]);
}

async function songlistDB(id) {
  const result = await db.query('SELECT * from lied where fk_album_id = $1', [id]);
  return result.rows;
}

module.exports = { getItemsDB, deleteItemDB, songlistDB, addItemDB, searchAlbumDB };
