const db = require('../db/index');

async function getItemsDB() {
  const result = await db.query('SELECT * from album');
  return result.rows;
}

async function deleteItemDB(id) {
  await db.query('delete from cars where id = $1', [id]);
  return true;
}

async function addItemDB() {
  await db.query('');
}

async function searchAlbumDB(titel) {
  await db.query('SELECT * from album where titel = $1', [titel]);
}

async function songlistDB(titel) {
  await db.query('SELECT * from album where titel = $1'[titel]);
}

module.exports = { getItemsDB, deleteItemDB, songlistDB, addItemDB, searchAlbumDB };
