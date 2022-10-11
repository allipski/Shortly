import { connection } from "../database/database.js";

async function postNewUser(req, res) {
  const {
    name: name,
    email: email,
    password: password,
    confirmPassword: confirmPassword,
  } = req.body;

  console.log('deu certo');

//   try {
//     await connection
//       .query(
//         `INSERT INTO customers (name, email, cpf, birthday) VALUES($1, $2, $3, $4);`,
//         [name, phone, cpf, birthday]
//       )
//       .then((result) => {
//         return res.sendStatus(201);
//       });
//   } catch (error) {
//     return res.status(500).send(error.message);
//   }
}

export { postNewUser };
