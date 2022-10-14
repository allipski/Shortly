import './setup.js'
import express from "express";
import cors from "cors";
import signupRouter from './routes/signupRoutes.js';
import signinRouter from './routes/signinRoutes.js';
import urlsRouter from './routes/urlsRoutes.js';
import usersRouter from './routes/usersRoutes.js';
import rankingRouter from './routes/rankingRoutes.js';

const app = express();
app.use(cors());
app.use(express.json());

app.use(signupRouter);
app.use(signinRouter);
app.use(urlsRouter);
app.use(usersRouter);
app.use(rankingRouter);

app.listen(process.env.PORT, () => console.log(`Server is listening on port ${process.env.PORT}!`));