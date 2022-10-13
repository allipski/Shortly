import { connection } from "../database/database.js";
import Joi from "joi";

async function authValidation(req, res, next) {
  const { authorization: bearerToken } = req.headers;
  const token = bearerToken.slice(7);

  const headerSchema = Joi.object({
    authorization: Joi.string().required()
  });

  const validation = headerSchema.validate({ authorization: bearerToken }, { abortEarly: false });

  const existSession = await connection.query(`SELECT * FROM sessions WHERE token = $1`, [token]);

  if (existSession.rows[0] === undefined || validation.error) {
    return res.status(401).send("Authorization token invalid or not found.");
  }

  next();
}

export { authValidation };
