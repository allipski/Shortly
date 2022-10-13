import { connection } from "../database/database.js";
import { customAlphabet } from "nanoid";
import { stringify } from "uuid";

async function postUrl(req, res) {
  const url = req.body.url;
  const { authorization: bearerToken } = req.headers;
  const token = bearerToken.slice(7);

  const getUser = await connection.query(
    `SELECT "userId" FROM sessions WHERE token = $1;`,
    [token]
  );

  const userId = getUser.rows[0].userId;

  const nanoid = customAlphabet("1234567890abcdef", 10);
  let shortUrl = nanoid();

  let checkUniqueness = await connection.query(
    `SELECT "shortUrl" FROM urls WHERE "shortUrl" = $1;`,
    [shortUrl]
  );

  while (checkUniqueness.rows[0] !== undefined) {
    shortUrl = nanoid();
    checkUniqueness = await connection.query(
      `SELECT "shortUrl" FROM urls WHERE shortUrl = $1;`,
      [shortUrl]
    );
  }

  try {
    await connection
      .query(
        `INSERT INTO urls ("shortUrl", url, "userId", "viewCount") VALUES($1, $2, $3, $4);`,
        [shortUrl, url, userId, 0]
      )
      .then((result) => {
        return res.status(201).send({ shortUrl: shortUrl });
      });
  } catch (error) {
    return res.status(500).send(error.message);
  }
}

async function getUrl(req, res) {
  const id = req.params.id;

  const existId = await connection.query(`SELECT * FROM urls WHERE id = $1;`, [
    id,
  ]);

  if (existId.rows[0] === undefined) {
    return res.status(404).send("URL not found.");
  } else {
    const response = {
      id: existId.rows[0].id,
      shortUrl: existId.rows[0].shortUrl,
      url: existId.rows[0].url,
    };
    return res.status(200).send(response);
  }
}

async function openUrl(req, res) {
  const shortUrl = req.params.shortUrl;

  const existShort = await connection.query(
    `SELECT * FROM urls WHERE "shortUrl" = $1;`,
    [shortUrl]
  );

  if (existShort.rows[0] === undefined) {
    return res.status(404).send("URL not found.");
  } else {
    const viewCount = existShort.rows[0].viewCount;
    const url = existShort.rows[0].url;

    await connection.query(
      `UPDATE urls SET "viewCount"=$1 WHERE "shortUrl"=$2`,
      [viewCount + 1, shortUrl]
    );

    return res.redirect(200, url);
  }
}

async function deleteUrl(req, res) {
  const id = req.params.id;

  try {
    await connection
      .query(
        `DELETE FROM urls WHERE id = $1`,
        [id]
      )
      .then((result) => {
        return res.sendStatus(204);
      });
  } catch (error) {
    return res.status(500).send(error.message);
  }

}

export { postUrl, getUrl, openUrl, deleteUrl };
