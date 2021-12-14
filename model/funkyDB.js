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

async function searchAlbumDB(id) {
  const result = await db.query('SELECT * from album where id = $1', [id]);
  return result.rows;
}

async function songlistDB(id) {
  const result = await db.query('SELECT * from lied where fk_album_id = $1', [id]);
  return result.rows;
}

async function purchaseDB(id) {
  let stueck = await db.query('SELECT stueckzahl from album where id = $1', [id]);
  stueck -= 1;
  await db.query('UPDATE album stueckzahl = $1 where id = $2', [stueck, id]);
}

module.exports = { getItemsDB, deleteItemDB, songlistDB, addItemDB, searchAlbumDB, purchaseDB };
