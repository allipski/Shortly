import express from 'express';
import { authValidation } from '../middlewares/authValidation.js';
import { getUserInfo } from '../controllers/usersController.js';

const usersRouter = express.Router();

usersRouter.get('/users/me', authValidation, getUserInfo);

export default usersRouter;