import express from 'express';
import { newurlValidation } from '../middlewares/newurlValidation.js';
import { authValidation } from '../middlewares/authValidation.js';
import { postUrl, getUrl, openUrl } from '../controllers/urlsController.js';

const urlsRouter = express.Router();

urlsRouter.post('/urls/shorten', authValidation, newurlValidation, postUrl);
urlsRouter.get('/urls/:id', getUrl);
urlsRouter.get('/urls/open/:shortUrl', openUrl);

export default urlsRouter;