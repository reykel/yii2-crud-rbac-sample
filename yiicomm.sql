/*
Navicat MySQL Data Transfer

Source Server         : Kwanxa Corp
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : yiicomm

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-11-09 09:55:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('administrador', '1', '1629144825');
INSERT INTO `auth_assignment` VALUES ('administrador', '3', '1636349510');

-- ----------------------------
-- Table structure for `auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1636345215', '1636345215');
INSERT INTO `auth_item` VALUES ('/paises/*', '2', null, null, null, '1629145149', '1629145149');
INSERT INTO `auth_item` VALUES ('/paises/index', '2', null, null, null, '1629145280', '1629145280');
INSERT INTO `auth_item` VALUES ('administrador', '1', null, null, null, '1629144606', '1629144606');
INSERT INTO `auth_item` VALUES ('Paises Manager', '2', 'Administrar paises', null, null, '1629145374', '1629145374');

-- ----------------------------
-- Table structure for `auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('administrador', 'Paises Manager');
INSERT INTO `auth_item_child` VALUES ('Paises Manager', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('Paises Manager', '/paises/*');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1629142831');
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1629142836');
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', '1629143366');
INSERT INTO `migration` VALUES ('m160312_050000_create_user', '1629143366');
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', '1629142836');
INSERT INTO `migration` VALUES ('m180523_151638_rbac_updates_indexes_without_prefix', '1629142837');
INSERT INTO `migration` VALUES ('m200409_110543_rbac_update_mssql_trigger', '1629142837');

-- ----------------------------
-- Table structure for `tbl_areas`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_areas`;
CREATE TABLE `tbl_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_areas
-- ----------------------------
INSERT INTO `tbl_areas` VALUES ('1', 'AFRICA CENTRAL');
INSERT INTO `tbl_areas` VALUES ('2', 'AFRICA MERIDIONAL');
INSERT INTO `tbl_areas` VALUES ('3', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_areas` VALUES ('4', 'AFRICA ORIENTAL');
INSERT INTO `tbl_areas` VALUES ('5', 'AFRICA SEPTENTRIONAL');
INSERT INTO `tbl_areas` VALUES ('6', 'AMERICA CENTRAL');
INSERT INTO `tbl_areas` VALUES ('7', 'AMERICA SEPTENTRIONAL');
INSERT INTO `tbl_areas` VALUES ('8', 'AMERICA SUR');
INSERT INTO `tbl_areas` VALUES ('9', 'ASIA CENTRAL');
INSERT INTO `tbl_areas` VALUES ('10', 'ASIA MERIDIONAL');
INSERT INTO `tbl_areas` VALUES ('11', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_areas` VALUES ('12', 'ASIA ORIENTAL');
INSERT INTO `tbl_areas` VALUES ('13', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_areas` VALUES ('14', 'AUSTRALIA Y NUEVA ZELANDIA');
INSERT INTO `tbl_areas` VALUES ('15', 'EL CARIBE');
INSERT INTO `tbl_areas` VALUES ('16', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_areas` VALUES ('17', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_areas` VALUES ('18', 'EUROPA ORIENTAL');
INSERT INTO `tbl_areas` VALUES ('19', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_areas` VALUES ('20', 'MELANESIA');
INSERT INTO `tbl_areas` VALUES ('21', 'MICRONESIA');
INSERT INTO `tbl_areas` VALUES ('22', 'POLINESIA');

-- ----------------------------
-- Table structure for `tbl_paises`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_paises`;
CREATE TABLE `tbl_paises` (
  `CodPais` int(50) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(50) DEFAULT NULL,
  `DescPais` varchar(255) DEFAULT NULL,
  `Siglas` varchar(50) DEFAULT NULL,
  `Area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodPais`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_paises
-- ----------------------------
INSERT INTO `tbl_paises` VALUES ('6', '024', 'Angola', 'LATAM', '18');
INSERT INTO `tbl_paises` VALUES ('7', '028', 'Antigua y Barbuda', 'ATG', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('8', '031', 'Azerbaiyán', 'AZE', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('9', '032', 'Argentina', 'ARG', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('10', '036', 'Australia', 'AUS', 'AUSTRALIA Y NUEVA ZELANDIA');
INSERT INTO `tbl_paises` VALUES ('11', '040', 'Austria', 'AUT', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('12', '044', 'Bahamas', 'BHS', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('13', '048', 'Bahrein', 'BHR', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('14', '050', 'Bangladesh', 'BGD', 'ASIA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('15', '051', 'Armenia', 'ARM', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('16', '052', 'Barbados', 'LATAM', '17');
INSERT INTO `tbl_paises` VALUES ('17', '056', 'Bélgica', 'BEL', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('18', '060', 'Bermuda', 'BMU', 'AMERICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('19', '064', 'Bhutan', 'BTN', 'ASIA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('20', '068', 'Bolivia (Estado plurinacional de,)', 'BOL', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('21', '070', 'Bosnia y Herzegovina', 'BIH', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('22', '072', 'Botswana', 'BWA', 'AFRICA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('23', '076', 'Brasil', 'BRA', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('24', '084', 'Belice', 'BLZ', 'AMERICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('25', '090', 'Islas Salomón', 'SLB', 'MELANESIA');
INSERT INTO `tbl_paises` VALUES ('26', '092', 'Islas Vírgenes Británicas', 'VGB', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('27', '096', 'Brunei Darussalam', 'BRN', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('28', '100', 'Bulgaria', 'BGR', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('29', '104', 'Myanmar', 'MMR', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('30', '108', 'Burundi', 'BDI', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('31', '112', 'Belarús', 'BLR', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('32', '116', 'Camboya', 'KHM', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('33', '120', 'Camerún', 'CMR', 'AFRICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('34', '124', 'Canadá', 'CAN', 'AMERICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('35', '132', 'Cabo Verde', 'CPV', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('36', '136', 'Islas Caimán', 'CYM', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('37', '140', 'Republica Centro  Africana', 'CAF', 'AFRICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('38', '144', 'Sri Lanka', 'LKA', 'ASIA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('39', '148', 'Chad', 'TCD', 'AFRICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('40', '152', 'Chile', 'CHL', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('41', '156', 'China', 'CHN', 'ASIA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('42', '158', 'Provincia China de Taiwán', 'TWN', 'ASIA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('43', '170', 'Colombia', 'COL', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('44', '174', 'Comores', 'COM', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('45', '175', 'Mayotte', 'MYT', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('46', '178', 'Congo', 'COG', 'AFRICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('47', '180', 'República Democrática del Congo', 'COD', 'AFRICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('48', '184', 'Islas Cook', 'COK', 'POLINESIA');
INSERT INTO `tbl_paises` VALUES ('49', '188', 'Costa Rica', 'CRI', 'AMERICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('50', '191', 'Croacia', 'HRV', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('51', '192', 'Cuba', 'CUB', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('52', '196', 'Chipre', 'CYP', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('53', '203', 'República Checa', 'CZE', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('54', '204', 'Benin', 'BEN', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('55', '208', 'Dinamarca', 'DNK', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('56', '212', 'Dominica', 'DMA', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('57', '214', 'República Dominicana', 'DOM', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('58', '218', 'Ecuador', 'ECU', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('59', '222', 'El Salvador', 'SLV', 'AMERICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('60', '226', 'Guinea Ecuatorial', 'GNQ', 'AFRICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('61', '231', 'Etiopía', 'ETH', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('62', '232', 'Eritrea', 'ERI', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('63', '233', 'Estonia', 'EST', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('64', '234', 'Islas Feroe', 'FRO', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('65', '238', 'Islas Malvinas', 'FLK', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('66', '242', 'Fiji', 'FJI', 'MELANESIA');
INSERT INTO `tbl_paises` VALUES ('67', '246', 'Finlandia', 'FIN', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('68', '248', 'Islas Áland', 'ALA', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('69', '250', 'Francia', 'FRA', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('70', '254', 'Guayana Francesa', 'GUF', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('71', '258', 'Polinesia Francesa', 'PYF', 'POLINESIA');
INSERT INTO `tbl_paises` VALUES ('72', '262', 'Djibouti', 'DJI', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('73', '266', 'Gabon', 'GAB', 'AFRICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('74', '268', 'Georgia', 'GEO', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('75', '270', 'Gambia', 'GMB', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('76', '275', 'Estado de Palestina', 'PSE', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('77', '276', 'Alemania', 'DEU', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('78', '288', 'Ghana', 'GHA', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('79', '292', 'Gibraltar', 'GIB', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('80', '296', 'Kiribati', 'KIR', 'MICRONESIA');
INSERT INTO `tbl_paises` VALUES ('81', '300', 'Grecia', 'GRC', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('82', '304', 'Groenlandia', 'GRL', 'AMERICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('83', '308', 'Granada', 'GRD', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('84', '312', 'Guadalupe', 'GLP', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('85', '316', 'Guam', 'GUM', 'MICRONESIA');
INSERT INTO `tbl_paises` VALUES ('86', '320', 'Guatemala', 'GTM', 'AMERICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('87', '324', 'Guinea', 'GIN', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('88', '328', 'Guyana', 'GUY', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('89', '332', 'Haití', 'HTI', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('90', '336', 'Santa Sede', 'VAT', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('91', '340', 'Honduras', 'HND', 'AMERICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('92', '344', 'Hong Kong (región administrativa especial de China)', 'HKG', 'ASIA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('93', '348', 'Hungría', 'HUN', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('94', '352', 'Islandia', 'ISL', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('95', '356', 'India', 'IND', 'ASIA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('96', '360', 'Indonesia', 'IDN', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('97', '364', 'Iran, República Islámica de', 'IRN', 'ASIA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('98', '368', 'Iraq', 'IRQ', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('99', '372', 'Irlanda', 'IRL', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('100', '376', 'Israel', 'ISR', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('101', '380', 'Italia', 'ITA', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('102', '384', 'Cóte D\'Ivoire', 'CIV', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('103', '388', 'Jamaica', 'JSM', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('104', '392', 'Japón', 'JPN', 'ASIA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('105', '398', 'Kazajstán', 'KAZ', 'ASIA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('106', '400', 'Jordania', 'JOR', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('107', '404', 'Kenya', 'KEN', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('108', '408', 'República Popular Democrática de Corea', 'PRK', 'ASIA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('109', '410', 'República de Corea', 'KOR', 'ASIA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('110', '414', 'Kuwait', 'KWT', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('111', '417', 'Kirguizistán', 'KGZ', 'ASIA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('112', '418', 'República Democrática Popular Lao', 'LAO', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('113', '422', 'Líbano', 'LBN', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('114', '426', 'Lesotho', 'LSO', 'AFRICA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('115', '428', 'Letonia', 'LVA', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('116', '430', 'Liberia', 'LBR', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('117', '434', 'Jamahiriya Arabe de Libia', 'LBY', 'AFRICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('118', '438', 'Liechtenstein', 'LIE', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('119', '440', 'Lituania', 'LTU', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('120', '442', 'Luxemburgo', 'LUX', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('121', '446', 'Macao (región administrativa especial de China)', 'MAC', 'ASIA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('122', '450', 'Madagascar', 'MDG', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('123', '454', 'Malawi', 'MWI', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('124', '458', 'Malasia', 'MYS', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('125', '462', 'Maldivas', 'MDV', 'ASIA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('126', '466', 'Mali', 'MLI', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('127', '470', 'Malta', 'MLT', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('128', '474', 'Martinica', 'MTQ', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('129', '478', 'Mauritania', 'MRT', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('130', '480', 'Mauricio', 'MUS', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('131', '484', 'México', 'MEX', 'AMERICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('132', '492', 'Mónaco', 'MCO', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('133', '496', 'Mongolia', 'MNG', 'ASIA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('134', '498', 'República de Moldavia', 'MDA', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('135', '499', 'Montenegro', 'MNE', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('136', '500', 'Monserrat', 'MSR', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('137', '504', 'Marruecos', 'MAR', 'AFRICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('138', '508', 'Mozambique', 'MOZ', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('139', '512', 'Omán', 'OMN', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('140', '516', 'Namibia', 'NAM', 'AFRICA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('141', '520', 'Nauru', 'NRU', 'MICRONESIA');
INSERT INTO `tbl_paises` VALUES ('142', '524', 'Nepal', 'NPL', 'ASIA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('143', '528', 'Países Bajos', 'NLD', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('144', '530', 'Antillas Neerlandesas', 'ANT', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('145', '531', 'Curazao', 'CUW', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('146', '533', 'Aruba', 'ABW', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('147', '534', 'San Martín (parte holandesa)', 'SXM', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('148', '535', 'Bonaire, Saint Eustatius y Saba', 'BES', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('149', '540', 'Nueva Caledonia', 'NCL', 'MELANESIA');
INSERT INTO `tbl_paises` VALUES ('150', '548', 'Vanuatu', 'VUT', 'MELANESIA');
INSERT INTO `tbl_paises` VALUES ('151', '554', 'Nueva Zelanda', 'NZL', 'AUSTRALIA Y NUEVA ZELANDIA');
INSERT INTO `tbl_paises` VALUES ('152', '558', 'Nicaragua', 'NIC', 'AMERICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('153', '562', 'Níger', 'NER', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('154', '566', 'Nigeria', 'NGA', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('155', '570', 'Niue', 'NIU', 'POLINESIA');
INSERT INTO `tbl_paises` VALUES ('156', '574', 'Islas Norfolk', 'NFK', 'AUSTRALIA Y NUEVA ZELANDIA');
INSERT INTO `tbl_paises` VALUES ('157', '578', 'Noruega', 'NOR', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('158', '580', 'Islas Marianas Septentrionales', 'MNP', 'MICRONESIA');
INSERT INTO `tbl_paises` VALUES ('159', '583', 'Micronesia, Estados Federados de', 'FSM', 'MICRONESIA');
INSERT INTO `tbl_paises` VALUES ('160', '584', 'Islas Marshall', 'MHL', 'MICRONESIA');
INSERT INTO `tbl_paises` VALUES ('161', '585', 'Palau', 'PLW', 'MICRONESIA');
INSERT INTO `tbl_paises` VALUES ('162', '586', 'Pakistán', 'PAK', 'ASIA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('163', '591', 'Panamá', 'PAN', 'AMERICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('164', '598', 'Papua Nueva Guinea', 'PNG', 'MELANESIA');
INSERT INTO `tbl_paises` VALUES ('165', '600', 'Paraguay', 'PRY', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('166', '604', 'Perú', 'PER', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('167', '608', 'Filipinas', 'PHL', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('168', '612', 'Pitcairn', 'PCN', 'POLINESIA');
INSERT INTO `tbl_paises` VALUES ('169', '616', 'Polonia', 'POL', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('170', '620', 'Portugal', 'PRT', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('171', '624', 'Guinea-Bissau', 'GNB', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('172', '626', 'Timor Leste', 'TMP', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('173', '630', 'Puerto Rico', 'PRI', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('174', '634', 'Qatar', 'OAT', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('175', '638', 'Reunión', 'REU', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('176', '642', 'Rumania', 'ROM', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('177', '643', 'Federación Rusa', 'RUS', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('178', '646', 'Rwanda', 'RWA', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('179', '652', 'Saint-Bartolomé', 'BLM', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('180', '654', 'Santa Elena', 'SHN', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('181', '659', 'Saint Kitts y Nevis', 'KNA', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('182', '660', 'Anguila', 'AIA', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('183', '662', 'Santa Lucía', 'LCA', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('184', '663', 'Saint-Martín (parte Francesa)', 'MAF', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('185', '666', 'Saint Pierre y Miquelon', 'SPM', 'AMERICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('186', '670', 'San Vicente y las Granadinas', 'VCT', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('187', '674', 'San Marino', 'SMR', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('188', '678', 'Santo Tomé y Príncipe', 'STP', 'AFRICA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('189', '682', 'Arabia Saudita', 'SAU', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('190', '686', 'Senegal', 'SEN', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('191', '688', 'Servia', 'SRB', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('192', '690', 'Seychelles', 'SYC', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('193', '694', 'Sierra Leona', 'SLE', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('194', '702', 'Singapur', 'SGP', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('195', '703', 'Eslovaquia', 'SVK', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('196', '704', 'Viet Nam', 'VNM', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('197', '705', 'Eslovenia', 'SVN', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('198', '706', 'Somalia', 'SOM', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('199', '710', 'Sudáfrica', 'ZAF', 'AFRICA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('200', '716', 'Zimbabwe', 'ZWE', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('201', '724', 'España', 'ESP', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('202', '728', 'Sur de Sudán', 'SSD', 'AFRICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('203', '729', 'Sudán', 'SDN', 'AFRICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('204', '732', 'Sahara Occidental', 'ESH', 'AFRICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('205', '740', 'Surinam', 'SUR', 'AMERICA SUR');
INSERT INTO `tbl_paises` VALUES ('206', '744', 'Islas Svalbard y Jan Mayen', 'SJM', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('207', '748', 'Swazilandia', 'SWZ', 'AFRICA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('208', '752', 'Suecia', 'SWE', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('209', '756', 'Suiza', 'CHE', 'EUROPA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('210', '760', 'República Árabe Siria', 'SYR', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('211', '762', 'Tayikistán', 'TJK', 'ASIA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('212', '764', 'Tailandia', 'THA', 'ASIA SUDORIENTAL');
INSERT INTO `tbl_paises` VALUES ('213', '768', 'Togo', 'TGO', 'AFRICA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('214', '772', 'Tokelau', 'TKL', 'POLINESIA');
INSERT INTO `tbl_paises` VALUES ('215', '776', 'Tonga', 'TON', 'POLINESIA');
INSERT INTO `tbl_paises` VALUES ('216', '780', 'Trinidad y Tobago', 'TTO', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('217', '784', 'Emiratos Árabes Unidos', 'ARE', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('218', '788', 'Túnez', 'TUN', 'AFRICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('219', '792', 'Turquía', 'TUR', 'ASIA OCCIDENTAL');
INSERT INTO `tbl_paises` VALUES ('220', '795', 'Turkmenistán', 'TKM', 'ASIA CENTRAL');
INSERT INTO `tbl_paises` VALUES ('221', '796', 'Islas Turcas y Calcos', 'TCA', 'EL CARIBE');
INSERT INTO `tbl_paises` VALUES ('222', '798', 'Tuvalú', 'TUV', 'POLINESIA');
INSERT INTO `tbl_paises` VALUES ('223', '800', 'Uganda', 'UGA', 'AFRICA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('224', '804', 'Ucrania', 'UKR', 'EUROPA ORIENTAL');
INSERT INTO `tbl_paises` VALUES ('225', '807', 'Macedonia', 'MKD', 'EUROPA MERIDIONAL');
INSERT INTO `tbl_paises` VALUES ('226', '818', 'Egipto', 'EGY', 'AFRICA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('227', '826', 'Reino Unido', 'GBR', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('228', '831', 'Guernesey', 'GGY', 'EUROPA SEPTENTRIONAL');
INSERT INTO `tbl_paises` VALUES ('229', '832', 'Jersey', 'JEY', 'EUROPA SEPTENTRIONAL');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `names` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'root', 'root', '$2y$13$fq40t3b1QlxhrmtxqXlaKefsl7aIvGtLqY2kVmsk5jyMJelmbuPG6');
