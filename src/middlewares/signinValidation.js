import { connection } from "../database/database.js";
import bcrypt from "bcrypt";
import Joi from "joi";

async function signinValidation(req, res, next) {
  const { email: email, password: password } = req.body;

  const loginSchema = Joi.object({
    email: Joi.string().email().required().trim().min(1),
    password: Joi.string().required().trim().min(1),
  });

  const validation = loginSchema.validate(req.body, { abortEarly: false });

  if (validation.error) {
    const errors = validation.error.details.map((error) => error.message);
    return res.status(422).send(errors);
  }

  const existUser = await connection.query(
    `SELECT * FROM users WHERE email=$1;`,
    [email]
  );

  const checkPassword = bcrypt.compareSync(password, existUser.rows[0].password);

  if (existUser.rows[0] === undefined || !checkPassword) {
    return res.status(401).send("Wrong password or email address. Please try again.");
  }

  next();
}

export { signinValidation };
