import { DataTypes } from "sequelize";
import { sequelize } from "../db.js";

export const Admin = sequelize.define("Admin", {
  email: { type: DataTypes.STRING, allowNull: false },
  role: {
    type: DataTypes.ENUM("super", "staff"),
    defaultValue: "staff",
  },
});
