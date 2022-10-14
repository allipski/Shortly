import { connection } from "../database/database.js";

async function deleteurlValidation(req, res, next) {
  const id = req.params.id;
  const { authorization: bearerToken } = req.headers;
  const token = bearerToken.slice(7);

  const existSession = await connection.query(
    `SELECT * FROM sessions WHERE token = $1`,
    [token]
  );

  const urlOwnership = await connection.query(
    `SELECT * FROM urls WHERE id = $1`,
    [id]
  );

  if (urlOwnership.rows[0] === undefined) {
    return res.status(404).send("URL does not exist.");
  }

  if (existSession.rows[0].userId !== urlOwnership.rows[0].userId) {
    return res.status(401).send("This URL does not belong to this user. Cannot delete.");
  }

  console.log(existSession.rows[0].userId, urlOwnership.rows[0].userId)

  next();
}

export { deleteurlValidation };
