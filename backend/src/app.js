import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import { sequelize } from "./db.js";
import userRoutes from "./routes/users.js";
import contractRoutes from "./routes/contracts.js";
import paymentRoutes from "./routes/payments.js";
import adminRoutes from "./routes/admin.js";

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

// routes
app.use("/api/users", userRoutes);
app.use("/api/contracts", contractRoutes);
app.use("/api/payments", paymentRoutes);
app.use("/api/admin", adminRoutes);

const PORT = process.env.PORT || 4000;

sequelize.sync().then(() => {
  console.log("✅ DB Synced");
  app.listen(PORT, () => console.log(`🚀 OLPAY backend running on port ${PORT}`));
});
