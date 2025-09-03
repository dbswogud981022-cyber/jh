import express from "express";
import { Contract } from "../models/Contract.js";
const router = express.Router();

router.get("/", async (_, res) => {
  const contracts = await Contract.findAll();
  res.json(contracts);
});

router.post("/", async (req, res) => {
  const contract = await Contract.create(req.body);
  res.json(contract);
});

export default router;
