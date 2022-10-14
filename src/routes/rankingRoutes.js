import express from 'express';
import { getRanking } from '../controllers/usersController.js';

const rankingRouter = express.Router();

rankingRouter.get('/ranking', getRanking);

export default rankingRouter;