import { DataTypes } from "sequelize";
import { sequelize } from "../db.js";
import { User } from "./User.js";
import { Contract } from "./Contract.js";

export const Payment = sequelize.define("Payment", {
  amount: { type: DataTypes.INTEGER, allowNull: false },
  method: DataTypes.STRING,
  status: {
    type: DataTypes.ENUM("success", "fail", "pending"),
    defaultValue: "pending",
  },
});

Payment.belongsTo(User, { foreignKey: "user_id" });
User.hasMany(Payment, { foreignKey: "user_id" });

Payment.belongsTo(Contract, { foreignKey: "contract_id" });
Contract.hasMany(Payment, { foreignKey: "contract_id" });
