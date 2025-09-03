import { DataTypes } from "sequelize";
import { sequelize } from "../db.js";
import { User } from "./User.js";

export const Contract = sequelize.define("Contract", {
  file_url: { type: DataTypes.STRING, allowNull: false },
  status: {
    type: DataTypes.ENUM("pending", "approved", "rejected"),
    defaultValue: "pending",
  },
});

Contract.belongsTo(User, { foreignKey: "user_id" });
User.hasMany(Contract, { foreignKey: "user_id" });
