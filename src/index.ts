import { Request, Response } from "express";

const express = require("express");
const app = express();
const port = parseInt(process.env.PORT || "3000");

app.get("/", (req: Request, res: Response) => {
  res.send("Hello World! Typescript");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
