import { connection } from "../database/database.js";
import { v4 as uuid } from "uuid";

async function postLogin(req, res) {
  const email = req.body.email;
  const token = uuid();
  let userId;

  try {
    await connection
      .query(`SELECT id FROM users WHERE email = $1`, [email])
      .then((result) => (userId = result.rows[0].id));

    await connection
      .query(`INSERT INTO sessions ("userId", token) VALUES($1, $2);`, [
        userId,
        token,
      ])
      .then((result) => {
        return res.status(200).send({ token: token });
      });
  } catch (error) {
    return res.status(500).send(error.message);
  }
}

export { postLogin };
