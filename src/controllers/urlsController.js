import { connection } from "../database/database.js";
import { customAlphabet } from "nanoid";

async function postUrl(req, res) {
  const url = req.body.url;
  const { authorization: bearerToken } = req.headers;
  const token = bearerToken.slice(7);

  const getUser = await connection.query(
    `SELECT "userId" FROM sessions WHERE token = $1`,
    [token]
  );

  const userId = getUser.rows[0].userId;

  const nanoid = customAlphabet("1234567890abcdef", 10);
  let shortUrl = nanoid();

  let checkUniqueness = await connection.query(
    `SELECT "shortUrl" FROM urls WHERE "shortUrl" = $1`,
    [shortUrl]
  );

  while (checkUniqueness.rows[0] !== undefined) {
    shortUrl = nanoid();
    checkUniqueness = await connection.query(
      `SELECT "shortUrl" FROM urls WHERE shortUrl = $1`,
      [shortUrl]
    );
  }

  console.log(shortUrl, url, userId);

    try {
      await connection
        .query(`INSERT INTO urls ("shortUrl", url, "userId", "viewCount") VALUES($1, $2, $3, $4);`, [shortUrl, url, userId, 0])
        .then((result) => {
          return res.status(201).send({ shortUrl: shortUrl });
        });
    } catch (error) {
      return res.status(500).send(error.message);
    }
}

async function getUrl(req, res) {
  const id = req.params.id;

  const existId = await connection.query(`SELECT * FROM urls WHERE id = $1`, [id]);

  if (existId.rows[0] === undefined) {
    return res.status(401).send("URL not found.");
  } else {
    const response = {
      id: existId.rows[0].id,
      shortUrl: existId.rows[0].shortUrl,
      url: existId.rows[0].url
    }
    return res.status(200).send(response);
  }
}

export { postUrl, getUrl };
