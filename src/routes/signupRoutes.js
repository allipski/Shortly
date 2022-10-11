import express from 'express';
import { signupValidation } from '../middlewares/signupValidation.js';
import { postNewUser } from '../controllers/usersController.js';

const signupRouter = express.Router();

signupRouter.post('/categories', signupValidation, postNewUser);

export default signupRouter;