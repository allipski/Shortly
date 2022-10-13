import express from 'express';
import { newurlValidation } from '../middlewares/newurlValidation.js';
import { authValidation } from '../middlewares/authValidation.js';
import { postUrl, getUrl } from '../controllers/urlsController.js';

const urlsRouter = express.Router();

urlsRouter.post('/urls/shorten', authValidation, newurlValidation, postUrl);
urlsRouter.get('/urls/:id', getUrl);

export default urlsRouter;