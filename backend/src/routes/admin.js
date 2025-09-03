import express from "express";
import { Admin } from "../models/Admin.js";
const router = express.Router();

router.get("/", async (_, res) => {
  const admins = await Admin.findAll();
  res.json(admins);
});

router.post("/", async (req, res) => {
  const admin = await Admin.create(req.body);
  res.json(admin);
});

export default router;
