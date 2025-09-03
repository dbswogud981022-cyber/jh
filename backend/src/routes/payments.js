import express from "express";
import { Payment } from "../models/Payment.js";
const router = express.Router();

router.get("/", async (_, res) => {
  const payments = await Payment.findAll();
  res.json(payments);
});

router.post("/", async (req, res) => {
  const payment = await Payment.create(req.body);
  res.json(payment);
});

export default router;
