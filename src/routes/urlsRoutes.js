import express from 'express';
import { newurlValidation } from '../middlewares/newurlValidation.js';
import { authValidation } from '../middlewares/authValidation.js';
import { postUrl } from '../controllers/urlsController.js';

const urlsRouter = express.Router();

urlsRouter.post('/urls/shorten', authValidation, newurlValidation, postUrl);

export default urlsRouter;