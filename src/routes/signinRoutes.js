import express from 'express';
import { signinValidation } from '../middlewares/signinValidation.js';
import { postLogin } from '../controllers/sessionsController.js';

const signinRouter = express.Router();

signinRouter.post('/signin', signinValidation, postLogin);

export default signinRouter;