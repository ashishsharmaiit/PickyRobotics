
"use strict";

let ultraArmSetAngles = require('./ultraArmSetAngles.js');
let ultraArmAngles = require('./ultraArmAngles.js');
let ultraArmSetCoords = require('./ultraArmSetCoords.js');
let ultraArmCoords = require('./ultraArmCoords.js');
let ultraArmPumpStatus = require('./ultraArmPumpStatus.js');
let ultraArmGripperStatus = require('./ultraArmGripperStatus.js');

module.exports = {
  ultraArmSetAngles: ultraArmSetAngles,
  ultraArmAngles: ultraArmAngles,
  ultraArmSetCoords: ultraArmSetCoords,
  ultraArmCoords: ultraArmCoords,
  ultraArmPumpStatus: ultraArmPumpStatus,
  ultraArmGripperStatus: ultraArmGripperStatus,
};
