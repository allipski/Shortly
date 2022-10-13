import express from 'express';
import { newurlValidation } from '../middlewares/newurlValidation.js';
import { authValidation } from '../middlewares/authValidation.js';
import { deleteurlValidation } from '../middlewares/deleteurlValidation.js';
import { postUrl, getUrl, openUrl, deleteUrl } from '../controllers/urlsController.js';

const urlsRouter = express.Router();

urlsRouter.post('/urls/shorten', authValidation, newurlValidation, postUrl);
urlsRouter.get('/urls/:id', getUrl);
urlsRouter.delete('/urls/:id', authValidation, deleteurlValidation ,deleteUrl);
urlsRouter.get('/urls/open/:shortUrl', openUrl);

export default urlsRouter;