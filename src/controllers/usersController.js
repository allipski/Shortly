import { connection } from "../database/database.js";
import bcrypt from "bcrypt";

async function postNewUser(req, res) {
  const {
    name: name,
    email: email,
    password: password,
    confirmPassword: confirmPassword,
  } = req.body;

  const passwordHash = bcrypt.hashSync(password, 10);

  try {
    await connection
      .query(
        `INSERT INTO users (name, email, password) VALUES($1, $2, $3);`,
        [name, email, passwordHash]
      )
      .then((result) => {
        return res.sendStatus(201);
      });
  } catch (error) {
    return res.status(500).send(error.message);
  }
}

export { postNewUser };
