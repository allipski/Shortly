import { connection } from "../database/database.js";
import Joi from "joi";

async function authValidation(req, res, next) {
  const { authorization: bearerToken } = req.headers;
  
  if (bearerToken === undefined) {
    return res.status(401).send("Authorization token not found.");
  }

  const token = bearerToken.slice(7);

  const headerSchema = Joi.object({
    authorization: Joi.string().required()
  });

  const validation = headerSchema.validate({ authorization: bearerToken }, { abortEarly: false });

  const existSession = await connection.query(`SELECT * FROM sessions WHERE token = $1`, [token]);

  if (existSession.rows[0] === undefined || validation.error) {
    return res.status(401).send("Authorization token invalid");
  }

  const existUser = await connection.query(`SELECT users.id, sessions.token FROM users JOIN sessions ON users.id = sessions."userId" WHERE sessions.token = $1;
  `, [token]);

  if (existUser.rows[0] === undefined) {
    return res.status(404).send("User does not exist.");
  }

  res.locals.user = existUser;

  next();
}

export { authValidation };
