import './setup.js'
import express from "express";
import cors from "cors";
import signupRouter from './routes/signupRoutes.js';

const app = express();
app.use(cors());
app.use(express.json());

app.use(signupRouter);

app.listen(process.env.PORT, () => console.log(`Server is listening on port ${process.env.PORT}!`));