import { connection } from "../database/database.js";
import Joi from "joi";

async function signupValidation(req, res, next) {
    const {
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      } = req.body;

    const userSchema = Joi.object({
        name: Joi.string().required().trim().min(1),
        email: Joi.string().email().required().trim().min(1),
        password: Joi.string().required().trim().min(1),
        confirmPassword: Joi.string().valid(password).required().trim().min(1)
      });
    
      const validation = userSchema.validate(
        req.body,
        { abortEarly: false }
      );
    
      if (validation.error) {
        const errors = validation.error.details.map((error) => error.message);
        return res.status(422).send(errors);
      }

      const existEmail = await connection.query(`SELECT * FROM users WHERE email=$1;`, [email]);

    if (existEmail.rows[0] !== undefined) {
        return res.status(409).send("There is already a user with that email address");
    }

next();

}

export { signupValidation };