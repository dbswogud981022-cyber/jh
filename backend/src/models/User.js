import { DataTypes } from "sequelize";
import { sequelize } from "../db.js";

export const User = sequelize.define("User", {
  provider: { type: DataTypes.ENUM("kakao", "apple", "email"), allowNull: false },
  name: { type: DataTypes.STRING, allowNull: false },
  phone: DataTypes.STRING,
  email: DataTypes.STRING,
  password_hash: DataTypes.STRING,
  status: {
    type: DataTypes.ENUM("active", "suspended", "deleted"),
    defaultValue: "active",
  },
});
