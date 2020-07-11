/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MariaDB
 Source Server Version : 100413
 Source Host           : localhost:3306
 Source Schema         : seiscomp

 Target Server Type    : MariaDB
 Target Server Version : 100413
 File Encoding         : 65001

 Date: 11/07/2020 15:01:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Access
-- ----------------------------
DROP TABLE IF EXISTS `Access`;
CREATE TABLE `Access`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `streamCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` datetime(0) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `networkCode`, `stationCode`, `locationCode`, `streamCode`, `user`, `start`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `access_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Access
-- ----------------------------

-- ----------------------------
-- Table structure for Amplitude
-- ----------------------------
DROP TABLE IF EXISTS `Amplitude`;
CREATE TABLE `Amplitude`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `type` char(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `amplitude_value` double NULL DEFAULT NULL,
  `amplitude_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `amplitude_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `amplitude_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `amplitude_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `amplitude_pdf_variable_content` blob NULL DEFAULT NULL,
  `amplitude_pdf_probability_content` blob NULL DEFAULT NULL,
  `amplitude_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `amplitude_used` tinyint(1) NOT NULL DEFAULT 0,
  `timeWindow_reference` datetime(0) NULL DEFAULT NULL,
  `timeWindow_reference_ms` int(11) NULL DEFAULT NULL,
  `timeWindow_begin` double NULL DEFAULT NULL,
  `timeWindow_end` double NULL DEFAULT NULL,
  `timeWindow_used` tinyint(1) NOT NULL DEFAULT 0,
  `period_value` double NULL DEFAULT NULL,
  `period_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `period_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `period_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `period_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `period_pdf_variable_content` blob NULL DEFAULT NULL,
  `period_pdf_probability_content` blob NULL DEFAULT NULL,
  `period_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `period_used` tinyint(1) NOT NULL DEFAULT 0,
  `snr` double NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `pickID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_channelCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_used` tinyint(1) NOT NULL DEFAULT 0,
  `filterID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `methodID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `scalingTime_value` datetime(0) NULL DEFAULT NULL,
  `scalingTime_value_ms` int(11) NULL DEFAULT NULL,
  `scalingTime_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `scalingTime_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `scalingTime_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `scalingTime_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `scalingTime_pdf_variable_content` blob NULL DEFAULT NULL,
  `scalingTime_pdf_probability_content` blob NULL DEFAULT NULL,
  `scalingTime_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `scalingTime_used` tinyint(1) NOT NULL DEFAULT 0,
  `magnitudeHint` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `evaluationMode` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `pickID`(`pickID`) USING BTREE,
  INDEX `Amplitude_timeWindow_reference`(`timeWindow_reference`, `timeWindow_reference_ms`) USING BTREE,
  CONSTRAINT `amplitude_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Amplitude
-- ----------------------------

-- ----------------------------
-- Table structure for AmplitudeReference
-- ----------------------------
DROP TABLE IF EXISTS `AmplitudeReference`;
CREATE TABLE `AmplitudeReference`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `amplitudeID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `amplitudeID`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `amplitudeID`(`amplitudeID`) USING BTREE,
  CONSTRAINT `amplitudereference_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AmplitudeReference
-- ----------------------------

-- ----------------------------
-- Table structure for ArclinkRequest
-- ----------------------------
DROP TABLE IF EXISTS `ArclinkRequest`;
CREATE TABLE `ArclinkRequest`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `requestID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userID` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userIP` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `clientID` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `clientIP` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime(0) NOT NULL,
  `created_ms` int(11) NOT NULL,
  `status` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `message` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `label` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `header` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `summary_okLineCount` int(10) UNSIGNED NULL DEFAULT NULL,
  `summary_totalLineCount` int(10) UNSIGNED NULL DEFAULT NULL,
  `summary_averageTimeWindow` int(10) UNSIGNED NULL DEFAULT NULL,
  `summary_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `created`, `created_ms`, `requestID`, `userID`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `arclinkrequest_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ArclinkRequest
-- ----------------------------

-- ----------------------------
-- Table structure for ArclinkRequestLine
-- ----------------------------
DROP TABLE IF EXISTS `ArclinkRequestLine`;
CREATE TABLE `ArclinkRequestLine`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NOT NULL,
  `end_ms` int(11) NOT NULL,
  `streamID_networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `streamID_stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `streamID_locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `streamID_channelCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `streamID_resourceURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `restricted` tinyint(1) NULL DEFAULT NULL,
  `shared` tinyint(1) NULL DEFAULT NULL,
  `netClass` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `constraints` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status_type` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status_status` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status_size` int(10) UNSIGNED NULL DEFAULT NULL,
  `status_message` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status_volumeID` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `start`, `start_ms`, `end`, `end_ms`, `streamID_networkCode`, `streamID_stationCode`, `streamID_locationCode`, `streamID_channelCode`, `streamID_resourceURI`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `arclinkrequestline_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ArclinkRequestLine
-- ----------------------------

-- ----------------------------
-- Table structure for ArclinkStatusLine
-- ----------------------------
DROP TABLE IF EXISTS `ArclinkStatusLine`;
CREATE TABLE `ArclinkStatusLine`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `size` int(10) UNSIGNED NULL DEFAULT NULL,
  `message` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `volumeID` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `volumeID`, `type`, `status`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `arclinkstatusline_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ArclinkStatusLine
-- ----------------------------

-- ----------------------------
-- Table structure for ArclinkUser
-- ----------------------------
DROP TABLE IF EXISTS `ArclinkUser`;
CREATE TABLE `ArclinkUser`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`, `email`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `arclinkuser_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ArclinkUser
-- ----------------------------

-- ----------------------------
-- Table structure for Arrival
-- ----------------------------
DROP TABLE IF EXISTS `Arrival`;
CREATE TABLE `Arrival`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `pickID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phase_code` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `timeCorrection` double NULL DEFAULT NULL,
  `azimuth` double NULL DEFAULT NULL,
  `distance` double UNSIGNED NULL DEFAULT NULL,
  `takeOffAngle` double NULL DEFAULT NULL,
  `timeResidual` double NULL DEFAULT NULL,
  `horizontalSlownessResidual` double NULL DEFAULT NULL,
  `backazimuthResidual` double NULL DEFAULT NULL,
  `timeUsed` tinyint(1) NULL DEFAULT NULL,
  `horizontalSlownessUsed` tinyint(1) NULL DEFAULT NULL,
  `backazimuthUsed` tinyint(1) NULL DEFAULT NULL,
  `weight` double UNSIGNED NULL DEFAULT NULL,
  `earthModelID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `preliminary` tinyint(1) NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `pickID`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `pickID`(`pickID`) USING BTREE,
  CONSTRAINT `arrival_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Arrival
-- ----------------------------

-- ----------------------------
-- Table structure for AuxDevice
-- ----------------------------
DROP TABLE IF EXISTS `AuxDevice`;
CREATE TABLE `AuxDevice`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `model` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `manufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `auxdevice_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AuxDevice
-- ----------------------------

-- ----------------------------
-- Table structure for AuxSource
-- ----------------------------
DROP TABLE IF EXISTS `AuxSource`;
CREATE TABLE `AuxSource`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `conversion` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sampleRateNumerator` int(10) UNSIGNED NULL DEFAULT NULL,
  `sampleRateDenominator` int(10) UNSIGNED NULL DEFAULT NULL,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `auxsource_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AuxSource
-- ----------------------------

-- ----------------------------
-- Table structure for AuxStream
-- ----------------------------
DROP TABLE IF EXISTS `AuxStream`;
CREATE TABLE `AuxStream`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `code` char(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `device` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `deviceSerialNumber` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `source` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `format` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flags` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `restricted` tinyint(1) NULL DEFAULT NULL,
  `shared` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `code`, `start`, `start_ms`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `auxstream_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AuxStream
-- ----------------------------

-- ----------------------------
-- Table structure for Comment
-- ----------------------------
DROP TABLE IF EXISTS `Comment`;
CREATE TABLE `Comment`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `text` blob NOT NULL,
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `start` datetime(0) NULL DEFAULT NULL,
  `start_ms` int(11) NULL DEFAULT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `id`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Comment
-- ----------------------------

-- ----------------------------
-- Table structure for CompositeTime
-- ----------------------------
DROP TABLE IF EXISTS `CompositeTime`;
CREATE TABLE `CompositeTime`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `year_value` int(11) NULL DEFAULT NULL,
  `year_uncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `year_lowerUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `year_upperUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `year_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `year_used` tinyint(1) NOT NULL DEFAULT 0,
  `month_value` int(11) NULL DEFAULT NULL,
  `month_uncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `month_lowerUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `month_upperUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `month_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `month_used` tinyint(1) NOT NULL DEFAULT 0,
  `day_value` int(11) NULL DEFAULT NULL,
  `day_uncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `day_lowerUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `day_upperUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `day_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `day_used` tinyint(1) NOT NULL DEFAULT 0,
  `hour_value` int(11) NULL DEFAULT NULL,
  `hour_uncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `hour_lowerUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `hour_upperUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `hour_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `hour_used` tinyint(1) NOT NULL DEFAULT 0,
  `minute_value` int(11) NULL DEFAULT NULL,
  `minute_uncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `minute_lowerUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `minute_upperUncertainty` int(10) UNSIGNED NULL DEFAULT NULL,
  `minute_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `minute_used` tinyint(1) NOT NULL DEFAULT 0,
  `second_value` double NULL DEFAULT NULL,
  `second_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `second_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `second_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `second_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `second_pdf_variable_content` blob NULL DEFAULT NULL,
  `second_pdf_probability_content` blob NULL DEFAULT NULL,
  `second_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `second_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `compositetime_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CompositeTime
-- ----------------------------

-- ----------------------------
-- Table structure for ConfigModule
-- ----------------------------
DROP TABLE IF EXISTS `ConfigModule`;
CREATE TABLE `ConfigModule`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parameterSetID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `parameterSetID`(`parameterSetID`) USING BTREE,
  CONSTRAINT `configmodule_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ConfigModule
-- ----------------------------

-- ----------------------------
-- Table structure for ConfigStation
-- ----------------------------
DROP TABLE IF EXISTS `ConfigStation`;
CREATE TABLE `ConfigStation`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `networkCode`, `stationCode`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `configstation_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ConfigStation
-- ----------------------------

-- ----------------------------
-- Table structure for DataAttributeExtent
-- ----------------------------
DROP TABLE IF EXISTS `DataAttributeExtent`;
CREATE TABLE `DataAttributeExtent`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NOT NULL,
  `end_ms` int(11) NOT NULL,
  `sampleRate` double NOT NULL,
  `quality` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `updated` datetime(0) NOT NULL,
  `updated_ms` int(11) NOT NULL,
  `segmentCount` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `sampleRate`, `quality`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `start`(`start`, `start_ms`) USING BTREE,
  INDEX `end`(`end`, `end_ms`) USING BTREE,
  INDEX `updated`(`updated`, `updated_ms`) USING BTREE,
  CONSTRAINT `dataattributeextent_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DataAttributeExtent
-- ----------------------------

-- ----------------------------
-- Table structure for DataExtent
-- ----------------------------
DROP TABLE IF EXISTS `DataExtent`;
CREATE TABLE `DataExtent`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `waveformID_networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_channelCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NOT NULL,
  `end_ms` int(11) NOT NULL,
  `updated` datetime(0) NOT NULL,
  `updated_ms` int(11) NOT NULL,
  `lastScan` datetime(0) NOT NULL,
  `lastScan_ms` int(11) NOT NULL,
  `segmentOverflow` tinyint(1) NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `waveformID_networkCode`, `waveformID_stationCode`, `waveformID_locationCode`, `waveformID_channelCode`, `waveformID_resourceURI`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `waveformID_resourceURI`(`waveformID_resourceURI`) USING BTREE,
  INDEX `start`(`start`, `start_ms`) USING BTREE,
  INDEX `end`(`end`, `end_ms`) USING BTREE,
  INDEX `updated`(`updated`, `updated_ms`) USING BTREE,
  INDEX `lastScan`(`lastScan`, `lastScan_ms`) USING BTREE,
  CONSTRAINT `dataextent_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DataExtent
-- ----------------------------

-- ----------------------------
-- Table structure for DataSegment
-- ----------------------------
DROP TABLE IF EXISTS `DataSegment`;
CREATE TABLE `DataSegment`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NOT NULL,
  `end_ms` int(11) NOT NULL,
  `updated` datetime(0) NOT NULL,
  `updated_ms` int(11) NOT NULL,
  `sampleRate` double NOT NULL,
  `quality` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `outOfOrder` tinyint(1) NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `start`, `start_ms`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `start`(`start`, `start_ms`) USING BTREE,
  INDEX `end`(`end`, `end_ms`) USING BTREE,
  INDEX `updated`(`updated`, `updated_ms`) USING BTREE,
  CONSTRAINT `datasegment_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DataSegment
-- ----------------------------

-- ----------------------------
-- Table structure for DataUsed
-- ----------------------------
DROP TABLE IF EXISTS `DataUsed`;
CREATE TABLE `DataUsed`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `waveType` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stationCount` int(10) UNSIGNED NOT NULL,
  `componentCount` int(10) UNSIGNED NOT NULL,
  `shortestPeriod` double NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `dataused_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DataUsed
-- ----------------------------

-- ----------------------------
-- Table structure for Datalogger
-- ----------------------------
DROP TABLE IF EXISTS `Datalogger`;
CREATE TABLE `Datalogger`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `digitizerModel` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `digitizerManufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `recorderModel` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `recorderManufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `clockModel` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `clockManufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `clockType` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gain` double NULL DEFAULT NULL,
  `maxClockDrift` double UNSIGNED NULL DEFAULT NULL,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `datalogger_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Datalogger
-- ----------------------------

-- ----------------------------
-- Table structure for DataloggerCalibration
-- ----------------------------
DROP TABLE IF EXISTS `DataloggerCalibration`;
CREATE TABLE `DataloggerCalibration`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `serialNumber` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `channel` int(10) UNSIGNED NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `gain` double NULL DEFAULT NULL,
  `gainFrequency` double UNSIGNED NULL DEFAULT NULL,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `serialNumber`, `channel`, `start`, `start_ms`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `dataloggercalibration_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of DataloggerCalibration
-- ----------------------------

-- ----------------------------
-- Table structure for Decimation
-- ----------------------------
DROP TABLE IF EXISTS `Decimation`;
CREATE TABLE `Decimation`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `sampleRateNumerator` int(10) UNSIGNED NOT NULL,
  `sampleRateDenominator` int(10) UNSIGNED NOT NULL,
  `analogueFilterChain_content` blob NULL DEFAULT NULL,
  `analogueFilterChain_used` tinyint(1) NOT NULL DEFAULT 0,
  `digitalFilterChain_content` blob NULL DEFAULT NULL,
  `digitalFilterChain_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `sampleRateNumerator`, `sampleRateDenominator`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `decimation_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Decimation
-- ----------------------------

-- ----------------------------
-- Table structure for Event
-- ----------------------------
DROP TABLE IF EXISTS `Event`;
CREATE TABLE `Event`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `preferredOriginID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `preferredMagnitudeID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `preferredFocalMechanismID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `typeCertainty` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `preferredOriginID`(`preferredOriginID`) USING BTREE,
  INDEX `preferredMagnitudeID`(`preferredMagnitudeID`) USING BTREE,
  INDEX `preferredFocalMechanismID`(`preferredFocalMechanismID`) USING BTREE,
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Event
-- ----------------------------

-- ----------------------------
-- Table structure for EventDescription
-- ----------------------------
DROP TABLE IF EXISTS `EventDescription`;
CREATE TABLE `EventDescription`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `text` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `type`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `eventdescription_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of EventDescription
-- ----------------------------

-- ----------------------------
-- Table structure for FocalMechanism
-- ----------------------------
DROP TABLE IF EXISTS `FocalMechanism`;
CREATE TABLE `FocalMechanism`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `triggeringOriginID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_value` double NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_pdf_variable_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_pdf_probability_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_strike_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `nodalPlanes_nodalPlane1_dip_value` double NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_pdf_variable_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_pdf_probability_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_dip_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `nodalPlanes_nodalPlane1_rake_value` double NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_pdf_variable_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_pdf_probability_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane1_rake_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `nodalPlanes_nodalPlane1_used` tinyint(1) NOT NULL DEFAULT 0,
  `nodalPlanes_nodalPlane2_strike_value` double NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_pdf_variable_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_pdf_probability_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_strike_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `nodalPlanes_nodalPlane2_dip_value` double NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_pdf_variable_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_pdf_probability_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_dip_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `nodalPlanes_nodalPlane2_rake_value` double NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_pdf_variable_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_pdf_probability_content` blob NULL DEFAULT NULL,
  `nodalPlanes_nodalPlane2_rake_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `nodalPlanes_nodalPlane2_used` tinyint(1) NOT NULL DEFAULT 0,
  `nodalPlanes_preferredPlane` int(11) NULL DEFAULT NULL,
  `nodalPlanes_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_tAxis_azimuth_value` double NULL DEFAULT NULL,
  `principalAxes_tAxis_azimuth_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_azimuth_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_azimuth_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_azimuth_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_azimuth_pdf_variable_content` blob NULL DEFAULT NULL,
  `principalAxes_tAxis_azimuth_pdf_probability_content` blob NULL DEFAULT NULL,
  `principalAxes_tAxis_azimuth_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_tAxis_plunge_value` double NULL DEFAULT NULL,
  `principalAxes_tAxis_plunge_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_plunge_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_plunge_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_plunge_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_plunge_pdf_variable_content` blob NULL DEFAULT NULL,
  `principalAxes_tAxis_plunge_pdf_probability_content` blob NULL DEFAULT NULL,
  `principalAxes_tAxis_plunge_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_tAxis_length_value` double NULL DEFAULT NULL,
  `principalAxes_tAxis_length_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_length_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_length_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_length_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_tAxis_length_pdf_variable_content` blob NULL DEFAULT NULL,
  `principalAxes_tAxis_length_pdf_probability_content` blob NULL DEFAULT NULL,
  `principalAxes_tAxis_length_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_pAxis_azimuth_value` double NULL DEFAULT NULL,
  `principalAxes_pAxis_azimuth_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_azimuth_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_azimuth_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_azimuth_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_azimuth_pdf_variable_content` blob NULL DEFAULT NULL,
  `principalAxes_pAxis_azimuth_pdf_probability_content` blob NULL DEFAULT NULL,
  `principalAxes_pAxis_azimuth_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_pAxis_plunge_value` double NULL DEFAULT NULL,
  `principalAxes_pAxis_plunge_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_plunge_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_plunge_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_plunge_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_plunge_pdf_variable_content` blob NULL DEFAULT NULL,
  `principalAxes_pAxis_plunge_pdf_probability_content` blob NULL DEFAULT NULL,
  `principalAxes_pAxis_plunge_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_pAxis_length_value` double NULL DEFAULT NULL,
  `principalAxes_pAxis_length_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_length_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_length_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_length_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_pAxis_length_pdf_variable_content` blob NULL DEFAULT NULL,
  `principalAxes_pAxis_length_pdf_probability_content` blob NULL DEFAULT NULL,
  `principalAxes_pAxis_length_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_nAxis_azimuth_value` double NULL DEFAULT NULL,
  `principalAxes_nAxis_azimuth_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_azimuth_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_azimuth_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_azimuth_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_azimuth_pdf_variable_content` blob NULL DEFAULT NULL,
  `principalAxes_nAxis_azimuth_pdf_probability_content` blob NULL DEFAULT NULL,
  `principalAxes_nAxis_azimuth_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_nAxis_plunge_value` double NULL DEFAULT NULL,
  `principalAxes_nAxis_plunge_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_plunge_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_plunge_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_plunge_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_plunge_pdf_variable_content` blob NULL DEFAULT NULL,
  `principalAxes_nAxis_plunge_pdf_probability_content` blob NULL DEFAULT NULL,
  `principalAxes_nAxis_plunge_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_nAxis_length_value` double NULL DEFAULT NULL,
  `principalAxes_nAxis_length_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_length_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_length_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_length_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `principalAxes_nAxis_length_pdf_variable_content` blob NULL DEFAULT NULL,
  `principalAxes_nAxis_length_pdf_probability_content` blob NULL DEFAULT NULL,
  `principalAxes_nAxis_length_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_nAxis_used` tinyint(1) NOT NULL DEFAULT 0,
  `principalAxes_used` tinyint(1) NOT NULL DEFAULT 0,
  `azimuthalGap` double UNSIGNED NULL DEFAULT NULL,
  `stationPolarityCount` int(10) UNSIGNED NULL DEFAULT NULL,
  `misfit` double UNSIGNED NULL DEFAULT NULL,
  `stationDistributionRatio` double UNSIGNED NULL DEFAULT NULL,
  `methodID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `evaluationMode` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `evaluationStatus` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `triggeringOriginID`(`triggeringOriginID`) USING BTREE,
  CONSTRAINT `focalmechanism_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of FocalMechanism
-- ----------------------------

-- ----------------------------
-- Table structure for FocalMechanismReference
-- ----------------------------
DROP TABLE IF EXISTS `FocalMechanismReference`;
CREATE TABLE `FocalMechanismReference`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `focalMechanismID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `focalMechanismID`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `focalMechanismID`(`focalMechanismID`) USING BTREE,
  CONSTRAINT `focalmechanismreference_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of FocalMechanismReference
-- ----------------------------

-- ----------------------------
-- Table structure for JournalEntry
-- ----------------------------
DROP TABLE IF EXISTS `JournalEntry`;
CREATE TABLE `JournalEntry`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime(0) NULL DEFAULT NULL,
  `created_ms` int(11) NULL DEFAULT NULL,
  `objectID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sender` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `action` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parameters` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `objectID`(`objectID`) USING BTREE,
  CONSTRAINT `journalentry_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of JournalEntry
-- ----------------------------

-- ----------------------------
-- Table structure for Magnitude
-- ----------------------------
DROP TABLE IF EXISTS `Magnitude`;
CREATE TABLE `Magnitude`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `magnitude_value` double NOT NULL,
  `magnitude_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `magnitude_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `magnitude_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `magnitude_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `magnitude_pdf_variable_content` blob NULL DEFAULT NULL,
  `magnitude_pdf_probability_content` blob NULL DEFAULT NULL,
  `magnitude_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `type` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `originID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `methodID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `stationCount` int(10) UNSIGNED NULL DEFAULT NULL,
  `azimuthalGap` double UNSIGNED NULL DEFAULT NULL,
  `evaluationStatus` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `magnitude_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Magnitude
-- ----------------------------

-- ----------------------------
-- Table structure for Meta
-- ----------------------------
DROP TABLE IF EXISTS `Meta`;
CREATE TABLE `Meta`  (
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Meta
-- ----------------------------
INSERT INTO `Meta` VALUES ('Creation-Time', '2020-07-11 06:58:10');
INSERT INTO `Meta` VALUES ('Schema-Version', '0.11');

-- ----------------------------
-- Table structure for MomentTensor
-- ----------------------------
DROP TABLE IF EXISTS `MomentTensor`;
CREATE TABLE `MomentTensor`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `derivedOriginID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `momentMagnitudeID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `scalarMoment_value` double NULL DEFAULT NULL,
  `scalarMoment_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `scalarMoment_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `scalarMoment_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `scalarMoment_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `scalarMoment_pdf_variable_content` blob NULL DEFAULT NULL,
  `scalarMoment_pdf_probability_content` blob NULL DEFAULT NULL,
  `scalarMoment_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `scalarMoment_used` tinyint(1) NOT NULL DEFAULT 0,
  `tensor_Mrr_value` double NULL DEFAULT NULL,
  `tensor_Mrr_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrr_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrr_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrr_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrr_pdf_variable_content` blob NULL DEFAULT NULL,
  `tensor_Mrr_pdf_probability_content` blob NULL DEFAULT NULL,
  `tensor_Mrr_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `tensor_Mtt_value` double NULL DEFAULT NULL,
  `tensor_Mtt_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mtt_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mtt_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mtt_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mtt_pdf_variable_content` blob NULL DEFAULT NULL,
  `tensor_Mtt_pdf_probability_content` blob NULL DEFAULT NULL,
  `tensor_Mtt_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `tensor_Mpp_value` double NULL DEFAULT NULL,
  `tensor_Mpp_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mpp_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mpp_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mpp_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mpp_pdf_variable_content` blob NULL DEFAULT NULL,
  `tensor_Mpp_pdf_probability_content` blob NULL DEFAULT NULL,
  `tensor_Mpp_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `tensor_Mrt_value` double NULL DEFAULT NULL,
  `tensor_Mrt_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrt_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrt_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrt_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrt_pdf_variable_content` blob NULL DEFAULT NULL,
  `tensor_Mrt_pdf_probability_content` blob NULL DEFAULT NULL,
  `tensor_Mrt_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `tensor_Mrp_value` double NULL DEFAULT NULL,
  `tensor_Mrp_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrp_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrp_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrp_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mrp_pdf_variable_content` blob NULL DEFAULT NULL,
  `tensor_Mrp_pdf_probability_content` blob NULL DEFAULT NULL,
  `tensor_Mrp_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `tensor_Mtp_value` double NULL DEFAULT NULL,
  `tensor_Mtp_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mtp_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mtp_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mtp_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `tensor_Mtp_pdf_variable_content` blob NULL DEFAULT NULL,
  `tensor_Mtp_pdf_probability_content` blob NULL DEFAULT NULL,
  `tensor_Mtp_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `tensor_used` tinyint(1) NOT NULL DEFAULT 0,
  `variance` double NULL DEFAULT NULL,
  `varianceReduction` double NULL DEFAULT NULL,
  `doubleCouple` double NULL DEFAULT NULL,
  `clvd` double NULL DEFAULT NULL,
  `iso` double NULL DEFAULT NULL,
  `greensFunctionID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `filterID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sourceTimeFunction_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sourceTimeFunction_duration` double NULL DEFAULT NULL,
  `sourceTimeFunction_riseTime` double NULL DEFAULT NULL,
  `sourceTimeFunction_decayTime` double NULL DEFAULT NULL,
  `sourceTimeFunction_used` tinyint(1) NOT NULL DEFAULT 0,
  `methodID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `method` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cmtName` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cmtVersion` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `derivedOriginID`(`derivedOriginID`) USING BTREE,
  CONSTRAINT `momenttensor_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MomentTensor
-- ----------------------------

-- ----------------------------
-- Table structure for MomentTensorComponentContribution
-- ----------------------------
DROP TABLE IF EXISTS `MomentTensorComponentContribution`;
CREATE TABLE `MomentTensorComponentContribution`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `phaseCode` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `component` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `weight` double NOT NULL,
  `timeShift` double NOT NULL,
  `dataTimeWindow` blob NOT NULL,
  `misfit` double NULL DEFAULT NULL,
  `snr` double NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `phaseCode`, `component`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `momenttensorcomponentcontribution_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MomentTensorComponentContribution
-- ----------------------------

-- ----------------------------
-- Table structure for MomentTensorPhaseSetting
-- ----------------------------
DROP TABLE IF EXISTS `MomentTensorPhaseSetting`;
CREATE TABLE `MomentTensorPhaseSetting`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `code` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lowerPeriod` double NOT NULL,
  `upperPeriod` double NOT NULL,
  `minimumSNR` double NULL DEFAULT NULL,
  `maximumTimeShift` double NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `code`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `momenttensorphasesetting_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MomentTensorPhaseSetting
-- ----------------------------

-- ----------------------------
-- Table structure for MomentTensorStationContribution
-- ----------------------------
DROP TABLE IF EXISTS `MomentTensorStationContribution`;
CREATE TABLE `MomentTensorStationContribution`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL,
  `waveformID_networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_channelCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_used` tinyint(1) NOT NULL DEFAULT 0,
  `weight` double NULL DEFAULT NULL,
  `timeShift` double NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `momenttensorstationcontribution_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of MomentTensorStationContribution
-- ----------------------------

-- ----------------------------
-- Table structure for Network
-- ----------------------------
DROP TABLE IF EXISTS `Network`;
CREATE TABLE `Network`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `code` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `institutions` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `netClass` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `archive` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `restricted` tinyint(1) NULL DEFAULT NULL,
  `shared` tinyint(1) NULL DEFAULT NULL,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `code`, `start`, `start_ms`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `network_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Network
-- ----------------------------

-- ----------------------------
-- Table structure for Object
-- ----------------------------
DROP TABLE IF EXISTS `Object`;
CREATE TABLE `Object`  (
  `_oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `_timestamp` timestamp(0) NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`_oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Object
-- ----------------------------
INSERT INTO `Object` VALUES (1, '2020-07-11 06:58:10');
INSERT INTO `Object` VALUES (2, '2020-07-11 06:58:10');
INSERT INTO `Object` VALUES (3, '2020-07-11 06:58:10');
INSERT INTO `Object` VALUES (4, '2020-07-11 06:58:10');
INSERT INTO `Object` VALUES (5, '2020-07-11 06:58:10');
INSERT INTO `Object` VALUES (6, '2020-07-11 06:58:10');
INSERT INTO `Object` VALUES (7, '2020-07-11 06:58:10');
INSERT INTO `Object` VALUES (8, '2020-07-11 06:58:10');

-- ----------------------------
-- Table structure for Origin
-- ----------------------------
DROP TABLE IF EXISTS `Origin`;
CREATE TABLE `Origin`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `time_value` datetime(0) NOT NULL,
  `time_value_ms` int(11) NOT NULL,
  `time_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `time_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `time_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `time_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `time_pdf_variable_content` blob NULL DEFAULT NULL,
  `time_pdf_probability_content` blob NULL DEFAULT NULL,
  `time_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `latitude_value` double NOT NULL,
  `latitude_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `latitude_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `latitude_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `latitude_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `latitude_pdf_variable_content` blob NULL DEFAULT NULL,
  `latitude_pdf_probability_content` blob NULL DEFAULT NULL,
  `latitude_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `longitude_value` double NOT NULL,
  `longitude_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `longitude_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `longitude_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `longitude_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `longitude_pdf_variable_content` blob NULL DEFAULT NULL,
  `longitude_pdf_probability_content` blob NULL DEFAULT NULL,
  `longitude_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `depth_value` double NULL DEFAULT NULL,
  `depth_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `depth_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `depth_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `depth_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `depth_pdf_variable_content` blob NULL DEFAULT NULL,
  `depth_pdf_probability_content` blob NULL DEFAULT NULL,
  `depth_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `depth_used` tinyint(1) NOT NULL DEFAULT 0,
  `depthType` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `timeFixed` tinyint(1) NULL DEFAULT NULL,
  `epicenterFixed` tinyint(1) NULL DEFAULT NULL,
  `referenceSystemID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `methodID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `earthModelID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `quality_associatedPhaseCount` int(10) UNSIGNED NULL DEFAULT NULL,
  `quality_usedPhaseCount` int(10) UNSIGNED NULL DEFAULT NULL,
  `quality_associatedStationCount` int(10) UNSIGNED NULL DEFAULT NULL,
  `quality_usedStationCount` int(10) UNSIGNED NULL DEFAULT NULL,
  `quality_depthPhaseCount` int(10) UNSIGNED NULL DEFAULT NULL,
  `quality_standardError` double UNSIGNED NULL DEFAULT NULL,
  `quality_azimuthalGap` double UNSIGNED NULL DEFAULT NULL,
  `quality_secondaryAzimuthalGap` double UNSIGNED NULL DEFAULT NULL,
  `quality_groundTruthLevel` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `quality_maximumDistance` double UNSIGNED NULL DEFAULT NULL,
  `quality_minimumDistance` double UNSIGNED NULL DEFAULT NULL,
  `quality_medianDistance` double UNSIGNED NULL DEFAULT NULL,
  `quality_used` tinyint(1) NOT NULL DEFAULT 0,
  `uncertainty_horizontalUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `uncertainty_minHorizontalUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `uncertainty_maxHorizontalUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `uncertainty_azimuthMaxHorizontalUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_semiMajorAxisLength` double NULL DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_semiMinorAxisLength` double NULL DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_semiIntermediateAxisLength` double NULL DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_majorAxisPlunge` double NULL DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_majorAxisAzimuth` double NULL DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_majorAxisRotation` double NULL DEFAULT NULL,
  `uncertainty_confidenceEllipsoid_used` tinyint(1) NOT NULL DEFAULT 0,
  `uncertainty_preferredDescription` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `uncertainty_used` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `evaluationMode` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `evaluationStatus` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `time_value`(`time_value`, `time_value_ms`) USING BTREE,
  CONSTRAINT `origin_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Origin
-- ----------------------------

-- ----------------------------
-- Table structure for OriginReference
-- ----------------------------
DROP TABLE IF EXISTS `OriginReference`;
CREATE TABLE `OriginReference`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `originID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `originID`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `originID`(`originID`) USING BTREE,
  CONSTRAINT `originreference_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of OriginReference
-- ----------------------------

-- ----------------------------
-- Table structure for Outage
-- ----------------------------
DROP TABLE IF EXISTS `Outage`;
CREATE TABLE `Outage`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `waveformID_networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_channelCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creatorID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime(0) NOT NULL,
  `created_ms` int(11) NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `waveformID_networkCode`, `waveformID_stationCode`, `waveformID_locationCode`, `waveformID_channelCode`, `waveformID_resourceURI`, `start`, `start_ms`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `outage_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Outage
-- ----------------------------

-- ----------------------------
-- Table structure for Parameter
-- ----------------------------
DROP TABLE IF EXISTS `Parameter`;
CREATE TABLE `Parameter`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` blob NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `parameter_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Parameter
-- ----------------------------

-- ----------------------------
-- Table structure for ParameterSet
-- ----------------------------
DROP TABLE IF EXISTS `ParameterSet`;
CREATE TABLE `ParameterSet`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `baseID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `moduleID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `created_ms` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `baseID`(`baseID`) USING BTREE,
  CONSTRAINT `parameterset_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ParameterSet
-- ----------------------------

-- ----------------------------
-- Table structure for Pick
-- ----------------------------
DROP TABLE IF EXISTS `Pick`;
CREATE TABLE `Pick`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `time_value` datetime(0) NOT NULL,
  `time_value_ms` int(11) NOT NULL,
  `time_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `time_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `time_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `time_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `time_pdf_variable_content` blob NULL DEFAULT NULL,
  `time_pdf_probability_content` blob NULL DEFAULT NULL,
  `time_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `waveformID_networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_channelCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `filterID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `methodID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `horizontalSlowness_value` double NULL DEFAULT NULL,
  `horizontalSlowness_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `horizontalSlowness_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `horizontalSlowness_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `horizontalSlowness_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `horizontalSlowness_pdf_variable_content` blob NULL DEFAULT NULL,
  `horizontalSlowness_pdf_probability_content` blob NULL DEFAULT NULL,
  `horizontalSlowness_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `horizontalSlowness_used` tinyint(1) NOT NULL DEFAULT 0,
  `backazimuth_value` double NULL DEFAULT NULL,
  `backazimuth_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `backazimuth_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `backazimuth_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `backazimuth_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `backazimuth_pdf_variable_content` blob NULL DEFAULT NULL,
  `backazimuth_pdf_probability_content` blob NULL DEFAULT NULL,
  `backazimuth_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `backazimuth_used` tinyint(1) NOT NULL DEFAULT 0,
  `slownessMethodID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `onset` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phaseHint_code` char(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `phaseHint_used` tinyint(1) NOT NULL DEFAULT 0,
  `polarity` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `evaluationMode` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `evaluationStatus` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `time_value`(`time_value`, `time_value_ms`) USING BTREE,
  CONSTRAINT `pick_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Pick
-- ----------------------------

-- ----------------------------
-- Table structure for PickReference
-- ----------------------------
DROP TABLE IF EXISTS `PickReference`;
CREATE TABLE `PickReference`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `pickID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `pickID`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `pickID`(`pickID`) USING BTREE,
  CONSTRAINT `pickreference_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PickReference
-- ----------------------------

-- ----------------------------
-- Table structure for PublicObject
-- ----------------------------
DROP TABLE IF EXISTS `PublicObject`;
CREATE TABLE `PublicObject`  (
  `_oid` bigint(20) NOT NULL,
  `publicID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `publicID`(`publicID`) USING BTREE,
  CONSTRAINT `publicobject_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of PublicObject
-- ----------------------------
INSERT INTO `PublicObject` VALUES (7, 'ArclinkLog');
INSERT INTO `PublicObject` VALUES (2, 'Config');
INSERT INTO `PublicObject` VALUES (8, 'DataAvailability');
INSERT INTO `PublicObject` VALUES (1, 'EventParameters');
INSERT INTO `PublicObject` VALUES (4, 'Inventory');
INSERT INTO `PublicObject` VALUES (6, 'Journaling');
INSERT INTO `PublicObject` VALUES (3, 'QualityControl');
INSERT INTO `PublicObject` VALUES (5, 'Routing');

-- ----------------------------
-- Table structure for QCLog
-- ----------------------------
DROP TABLE IF EXISTS `QCLog`;
CREATE TABLE `QCLog`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `waveformID_networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_channelCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creatorID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime(0) NOT NULL,
  `created_ms` int(11) NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NOT NULL,
  `end_ms` int(11) NOT NULL,
  `message` blob NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `start`, `start_ms`, `waveformID_networkCode`, `waveformID_stationCode`, `waveformID_locationCode`, `waveformID_channelCode`, `waveformID_resourceURI`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `qclog_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QCLog
-- ----------------------------

-- ----------------------------
-- Table structure for Reading
-- ----------------------------
DROP TABLE IF EXISTS `Reading`;
CREATE TABLE `Reading`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `reading_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Reading
-- ----------------------------

-- ----------------------------
-- Table structure for ResponseFAP
-- ----------------------------
DROP TABLE IF EXISTS `ResponseFAP`;
CREATE TABLE `ResponseFAP`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gain` double NULL DEFAULT NULL,
  `gainFrequency` double UNSIGNED NULL DEFAULT NULL,
  `numberOfTuples` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `tuples_content` blob NULL DEFAULT NULL,
  `tuples_used` tinyint(1) NOT NULL DEFAULT 0,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `responsefap_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ResponseFAP
-- ----------------------------

-- ----------------------------
-- Table structure for ResponseFIR
-- ----------------------------
DROP TABLE IF EXISTS `ResponseFIR`;
CREATE TABLE `ResponseFIR`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gain` double NULL DEFAULT NULL,
  `gainFrequency` double UNSIGNED NULL DEFAULT NULL,
  `decimationFactor` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `delay` double UNSIGNED NULL DEFAULT NULL,
  `correction` double NULL DEFAULT NULL,
  `numberOfCoefficients` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `symmetry` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `coefficients_content` blob NULL DEFAULT NULL,
  `coefficients_used` tinyint(1) NOT NULL DEFAULT 0,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `responsefir_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ResponseFIR
-- ----------------------------

-- ----------------------------
-- Table structure for ResponseIIR
-- ----------------------------
DROP TABLE IF EXISTS `ResponseIIR`;
CREATE TABLE `ResponseIIR`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gain` double NULL DEFAULT NULL,
  `gainFrequency` double UNSIGNED NULL DEFAULT NULL,
  `decimationFactor` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `delay` double UNSIGNED NULL DEFAULT NULL,
  `correction` double NULL DEFAULT NULL,
  `numberOfNumerators` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `numberOfDenominators` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `numerators_content` blob NULL DEFAULT NULL,
  `numerators_used` tinyint(1) NOT NULL DEFAULT 0,
  `denominators_content` blob NULL DEFAULT NULL,
  `denominators_used` tinyint(1) NOT NULL DEFAULT 0,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `responseiir_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ResponseIIR
-- ----------------------------

-- ----------------------------
-- Table structure for ResponsePAZ
-- ----------------------------
DROP TABLE IF EXISTS `ResponsePAZ`;
CREATE TABLE `ResponsePAZ`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gain` double NULL DEFAULT NULL,
  `gainFrequency` double UNSIGNED NULL DEFAULT NULL,
  `normalizationFactor` double UNSIGNED NULL DEFAULT NULL,
  `normalizationFrequency` double UNSIGNED NULL DEFAULT NULL,
  `numberOfZeros` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `numberOfPoles` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `zeros_content` blob NULL DEFAULT NULL,
  `zeros_used` tinyint(1) NOT NULL DEFAULT 0,
  `poles_content` blob NULL DEFAULT NULL,
  `poles_used` tinyint(1) NOT NULL DEFAULT 0,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  `decimationFactor` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `delay` double UNSIGNED NULL DEFAULT NULL,
  `correction` double NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `responsepaz_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ResponsePAZ
-- ----------------------------

-- ----------------------------
-- Table structure for ResponsePolynomial
-- ----------------------------
DROP TABLE IF EXISTS `ResponsePolynomial`;
CREATE TABLE `ResponsePolynomial`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gain` double NULL DEFAULT NULL,
  `gainFrequency` double UNSIGNED NULL DEFAULT NULL,
  `frequencyUnit` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `approximationType` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `approximationLowerBound` double NULL DEFAULT NULL,
  `approximationUpperBound` double NULL DEFAULT NULL,
  `approximationError` double UNSIGNED NULL DEFAULT NULL,
  `numberOfCoefficients` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `coefficients_content` blob NULL DEFAULT NULL,
  `coefficients_used` tinyint(1) NOT NULL DEFAULT 0,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `responsepolynomial_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ResponsePolynomial
-- ----------------------------

-- ----------------------------
-- Table structure for Route
-- ----------------------------
DROP TABLE IF EXISTS `Route`;
CREATE TABLE `Route`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `streamCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `networkCode`, `stationCode`, `locationCode`, `streamCode`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Route
-- ----------------------------

-- ----------------------------
-- Table structure for RouteArclink
-- ----------------------------
DROP TABLE IF EXISTS `RouteArclink`;
CREATE TABLE `RouteArclink`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` datetime(0) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `priority` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `address`, `start`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `routearclink_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of RouteArclink
-- ----------------------------

-- ----------------------------
-- Table structure for RouteSeedlink
-- ----------------------------
DROP TABLE IF EXISTS `RouteSeedlink`;
CREATE TABLE `RouteSeedlink`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `priority` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `address`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `routeseedlink_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of RouteSeedlink
-- ----------------------------

-- ----------------------------
-- Table structure for Sensor
-- ----------------------------
DROP TABLE IF EXISTS `Sensor`;
CREATE TABLE `Sensor`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `model` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `manufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `lowFrequency` double UNSIGNED NULL DEFAULT NULL,
  `highFrequency` double UNSIGNED NULL DEFAULT NULL,
  `response` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Sensor
-- ----------------------------

-- ----------------------------
-- Table structure for SensorCalibration
-- ----------------------------
DROP TABLE IF EXISTS `SensorCalibration`;
CREATE TABLE `SensorCalibration`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `serialNumber` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `channel` int(10) UNSIGNED NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `gain` double NULL DEFAULT NULL,
  `gainFrequency` double UNSIGNED NULL DEFAULT NULL,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `serialNumber`, `channel`, `start`, `start_ms`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `sensorcalibration_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SensorCalibration
-- ----------------------------

-- ----------------------------
-- Table structure for SensorLocation
-- ----------------------------
DROP TABLE IF EXISTS `SensorLocation`;
CREATE TABLE `SensorLocation`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `code` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `latitude` double NULL DEFAULT NULL,
  `longitude` double NULL DEFAULT NULL,
  `elevation` double NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `code`, `start`, `start_ms`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `sensorlocation_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of SensorLocation
-- ----------------------------

-- ----------------------------
-- Table structure for Setup
-- ----------------------------
DROP TABLE IF EXISTS `Setup`;
CREATE TABLE `Setup`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `parameterSetID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `name`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `parameterSetID`(`parameterSetID`) USING BTREE,
  CONSTRAINT `setup_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Setup
-- ----------------------------

-- ----------------------------
-- Table structure for Station
-- ----------------------------
DROP TABLE IF EXISTS `Station`;
CREATE TABLE `Station`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `code` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `latitude` double NULL DEFAULT NULL,
  `longitude` double NULL DEFAULT NULL,
  `elevation` double NULL DEFAULT NULL,
  `place` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `affiliation` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `archive` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `archiveNetworkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `restricted` tinyint(1) NULL DEFAULT NULL,
  `shared` tinyint(1) NULL DEFAULT NULL,
  `remark_content` blob NULL DEFAULT NULL,
  `remark_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `code`, `start`, `start_ms`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Station
-- ----------------------------

-- ----------------------------
-- Table structure for StationGroup
-- ----------------------------
DROP TABLE IF EXISTS `StationGroup`;
CREATE TABLE `StationGroup`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `code` char(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `start` datetime(0) NULL DEFAULT NULL,
  `start_ms` int(11) NULL DEFAULT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `latitude` double NULL DEFAULT NULL,
  `longitude` double NULL DEFAULT NULL,
  `elevation` double NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `code`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `stationgroup_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of StationGroup
-- ----------------------------

-- ----------------------------
-- Table structure for StationMagnitude
-- ----------------------------
DROP TABLE IF EXISTS `StationMagnitude`;
CREATE TABLE `StationMagnitude`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `originID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `magnitude_value` double NOT NULL,
  `magnitude_uncertainty` double UNSIGNED NULL DEFAULT NULL,
  `magnitude_lowerUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `magnitude_upperUncertainty` double UNSIGNED NULL DEFAULT NULL,
  `magnitude_confidenceLevel` double UNSIGNED NULL DEFAULT NULL,
  `magnitude_pdf_variable_content` blob NULL DEFAULT NULL,
  `magnitude_pdf_probability_content` blob NULL DEFAULT NULL,
  `magnitude_pdf_used` tinyint(1) NOT NULL DEFAULT 0,
  `type` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `amplitudeID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `methodID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_channelCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_used` tinyint(1) NOT NULL DEFAULT 0,
  `passedQC` tinyint(1) NULL DEFAULT NULL,
  `creationInfo_agencyID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_agencyURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_author` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_authorURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_creationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_creationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_modificationTime` datetime(0) NULL DEFAULT NULL,
  `creationInfo_modificationTime_ms` int(11) NULL DEFAULT NULL,
  `creationInfo_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creationInfo_used` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`_oid`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `amplitudeID`(`amplitudeID`) USING BTREE,
  CONSTRAINT `stationmagnitude_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of StationMagnitude
-- ----------------------------

-- ----------------------------
-- Table structure for StationMagnitudeContribution
-- ----------------------------
DROP TABLE IF EXISTS `StationMagnitudeContribution`;
CREATE TABLE `StationMagnitudeContribution`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `stationMagnitudeID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `residual` double NULL DEFAULT NULL,
  `weight` double UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `stationMagnitudeID`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `stationMagnitudeID`(`stationMagnitudeID`) USING BTREE,
  CONSTRAINT `stationmagnitudecontribution_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of StationMagnitudeContribution
-- ----------------------------

-- ----------------------------
-- Table structure for StationReference
-- ----------------------------
DROP TABLE IF EXISTS `StationReference`;
CREATE TABLE `StationReference`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `stationID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `stationID`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `stationID`(`stationID`) USING BTREE,
  CONSTRAINT `stationreference_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of StationReference
-- ----------------------------

-- ----------------------------
-- Table structure for Stream
-- ----------------------------
DROP TABLE IF EXISTS `Stream`;
CREATE TABLE `Stream`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `code` char(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `datalogger` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dataloggerSerialNumber` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dataloggerChannel` int(10) UNSIGNED NULL DEFAULT NULL,
  `sensor` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sensorSerialNumber` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sensorChannel` int(10) UNSIGNED NULL DEFAULT NULL,
  `clockSerialNumber` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sampleRateNumerator` int(10) UNSIGNED NULL DEFAULT NULL,
  `sampleRateDenominator` int(10) UNSIGNED NULL DEFAULT NULL,
  `depth` double NULL DEFAULT NULL,
  `azimuth` double NULL DEFAULT NULL,
  `dip` double NULL DEFAULT NULL,
  `gain` double NULL DEFAULT NULL,
  `gainFrequency` double UNSIGNED NULL DEFAULT NULL,
  `gainUnit` char(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `format` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flags` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `restricted` tinyint(1) NULL DEFAULT NULL,
  `shared` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `code`, `start`, `start_ms`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  CONSTRAINT `stream_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Stream
-- ----------------------------

-- ----------------------------
-- Table structure for WaveformQuality
-- ----------------------------
DROP TABLE IF EXISTS `WaveformQuality`;
CREATE TABLE `WaveformQuality`  (
  `_oid` bigint(20) NOT NULL,
  `_parent_oid` bigint(20) NOT NULL,
  `_last_modified` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `waveformID_networkCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_stationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `waveformID_locationCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_channelCode` char(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `waveformID_resourceURI` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `creatorID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` datetime(0) NOT NULL,
  `created_ms` int(11) NOT NULL,
  `start` datetime(0) NOT NULL,
  `start_ms` int(11) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `end_ms` int(11) NULL DEFAULT NULL,
  `type` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parameter` char(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` double NOT NULL,
  `lowerUncertainty` double NULL DEFAULT NULL,
  `upperUncertainty` double NULL DEFAULT NULL,
  `windowLength` double NULL DEFAULT NULL,
  PRIMARY KEY (`_oid`) USING BTREE,
  UNIQUE INDEX `composite_index`(`_parent_oid`, `start`, `start_ms`, `waveformID_networkCode`, `waveformID_stationCode`, `waveformID_locationCode`, `waveformID_channelCode`, `waveformID_resourceURI`, `type`, `parameter`) USING BTREE,
  INDEX `_parent_oid`(`_parent_oid`) USING BTREE,
  INDEX `start`(`start`, `start_ms`) USING BTREE,
  INDEX `end`(`end`, `end_ms`) USING BTREE,
  CONSTRAINT `waveformquality_ibfk_1` FOREIGN KEY (`_oid`) REFERENCES `Object` (`_oid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of WaveformQuality
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
