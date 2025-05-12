/*
Navicat MySQL Data Transfer

Source Server         : VPS PLATAFORMA
Source Server Version : 50505
Source Host           : ec2-52-24-31-154.us-west-2.compute.amazonaws.com:3306
Source Database       : siip

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2025-04-24 11:06:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actas_entregas
-- ----------------------------
DROP TABLE IF EXISTS `actas_entregas`;
CREATE TABLE `actas_entregas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(100) DEFAULT NULL,
  `id_sucursal` int(100) DEFAULT NULL,
  `id_bodega` int(100) DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `ext` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `funcionario` varchar(250) DEFAULT NULL,
  `activo` int(1) DEFAULT NULL,
  `bimestre` varchar(100) DEFAULT NULL,
  `fecha_e` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for actas_inventario
-- ----------------------------
DROP TABLE IF EXISTS `actas_inventario`;
CREATE TABLE `actas_inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(100) DEFAULT NULL,
  `id_sucursal` int(100) DEFAULT NULL,
  `id_bodega` int(100) DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `ext` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `funcionario` varchar(250) DEFAULT NULL,
  `activo` int(1) DEFAULT NULL,
  `bimestre` varchar(100) DEFAULT NULL,
  `fecha_m` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1422 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for calendario
-- ----------------------------
DROP TABLE IF EXISTS `calendario`;
CREATE TABLE `calendario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` int(1) DEFAULT '3' COMMENT '1 ->tarea  2->llamada  3->cita',
  `icono` int(2) DEFAULT NULL,
  `fechai` date DEFAULT NULL,
  `horai` time DEFAULT NULL,
  `fechaf` date DEFAULT NULL,
  `horaf` time DEFAULT NULL,
  `tema` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `lugar` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `descripcion` varchar(5000) COLLATE latin1_general_ci DEFAULT NULL,
  `color` varchar(7) COLLATE latin1_general_ci DEFAULT '#FFF',
  `id_objetivo_crm` int(11) NOT NULL DEFAULT '0',
  `id_actividad_crm` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46506 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for calendario_notificaciones
-- ----------------------------
DROP TABLE IF EXISTS `calendario_notificaciones`;
CREATE TABLE `calendario_notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_calendario` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `tema` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `time_type` varchar(1) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `fecha_pospuesto` datetime DEFAULT NULL,
  `pospuesto` varchar(10) COLLATE latin1_general_ci DEFAULT 'false',
  `descartar` varchar(10) COLLATE latin1_general_ci DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2430 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for calendario_notificaciones_personas
-- ----------------------------
DROP TABLE IF EXISTS `calendario_notificaciones_personas`;
CREATE TABLE `calendario_notificaciones_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_notificacion` int(11) DEFAULT NULL,
  `id_asignado` int(11) DEFAULT NULL,
  `id_calendario` int(11) DEFAULT NULL,
  `asignado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1045 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for calendario_personas
-- ----------------------------
DROP TABLE IF EXISTS `calendario_personas`;
CREATE TABLE `calendario_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_calendario` int(11) DEFAULT NULL,
  `id_asignado` int(11) DEFAULT NULL,
  `asignado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4679 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for capacitaciones
-- ----------------------------
DROP TABLE IF EXISTS `capacitaciones`;
CREATE TABLE `capacitaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `hora_final` time DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` bit(1) DEFAULT b'0',
  `fecha_creacion` datetime DEFAULT NULL,
  `id_capacitador` int(11) DEFAULT NULL,
  `capacitador` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `detalle_capacitador` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `intensidad_horaria` int(10) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `capacitacion_individual` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_empleado` int(11) DEFAULT NULL,
  `nombre_empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `realizado` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for capacitaciones_documentos
-- ----------------------------
DROP TABLE IF EXISTS `capacitaciones_documentos`;
CREATE TABLE `capacitaciones_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_capacitacion` int(11) DEFAULT NULL,
  `nombre_documento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `randomico_archivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_capacitacion`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for capacitaciones_funcionarios
-- ----------------------------
DROP TABLE IF EXISTS `capacitaciones_funcionarios`;
CREATE TABLE `capacitaciones_funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_capacitacion` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `nombre_empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `asistencia` varchar(5) COLLATE latin1_general_ci DEFAULT 'true' COMMENT 'Si asistio o no a la capacitacion',
  `observacion_asistencia` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for cliente_final
-- ----------------------------
DROP TABLE IF EXISTS `cliente_final`;
CREATE TABLE `cliente_final` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(20) DEFAULT NULL,
  `nombre_comercial` varchar(250) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for compras_log
-- ----------------------------
DROP TABLE IF EXISTS `compras_log`;
CREATE TABLE `compras_log` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_documento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_documento` int(15) DEFAULT NULL,
  `consecutivo` int(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario` int(15) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(5) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(5) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `json_items` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=163622 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_maestros
-- ----------------------------
DROP TABLE IF EXISTS `compras_maestros`;
CREATE TABLE `compras_maestros` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `random` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `id_requisicion` int(15) DEFAULT NULL,
  `pendientes_facturar` double(15,2) DEFAULT '0.00' COMMENT 'items facturados de la remision',
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_bodega` int(11) DEFAULT NULL,
  `bodega` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `consecutivo` int(11) DEFAULT NULL,
  `consecutivo_requisicion` int(15) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `fecha_genera_maestro` datetime DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT '0',
  `documento_vendedor` bigint(20) DEFAULT NULL,
  `nombre_vendedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT '0',
  `documento_usuario` bigint(20) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_cliente` int(15) DEFAULT NULL,
  `cod_cliente` int(11) DEFAULT NULL,
  `nit` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal_cliente` int(11) DEFAULT NULL,
  `sucursal_cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `exento_iva` varchar(5) COLLATE latin1_general_ci DEFAULT '',
  `plantillas_id` int(15) DEFAULT NULL,
  `id_forma_pago` int(15) DEFAULT NULL,
  `forma_pago` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `referencia` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `estado` int(1) DEFAULT '0' COMMENT '0 -> nuevo, 1 -> guardado, 2 -> ingresado con factura, 3 -> cancelado, 4 -> ingresadas todas las unidades',
  `id_centro_costo` int(11) DEFAULT '0',
  `codigo_centro_costo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `centro_costo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `consecutivo_siip` varchar(30) COLLATE latin1_general_ci DEFAULT '',
  `activo` int(1) DEFAULT '1',
  `fecha_inicio_evento` date DEFAULT NULL,
  `hora_inicio_evento` time DEFAULT NULL,
  `fecha_final_evento` date DEFAULT NULL,
  `hora_final_evento` time DEFAULT NULL,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `codigo_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_evento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ciudad_montaje` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_montaje` date DEFAULT NULL,
  `hora_montaje` time DEFAULT NULL,
  `direccion_montaje` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_contacto` int(11) DEFAULT NULL,
  `contacto_plataforma` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `salon_evento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_empresa` (`id_empresa`) USING BTREE,
  KEY `id_sucursal` (`id_sucursal`) USING BTREE,
  KEY `id_bodega` (`id_bodega`) USING BTREE,
  KEY `id_vendedor` (`id_vendedor`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `id_cliente` (`id_cliente`) USING BTREE,
  KEY `id_sucursal_cliente` (`id_sucursal_cliente`) USING BTREE,
  KEY `plantillas_id` (`plantillas_id`) USING BTREE,
  KEY `id_forma_pago` (`id_forma_pago`) USING BTREE,
  KEY `id_centro_costo` (`id_centro_costo`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=52387 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_maestros_inventario
-- ----------------------------
DROP TABLE IF EXISTS `compras_maestros_inventario`;
CREATE TABLE `compras_maestros_inventario` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `id_maestro` int(15) DEFAULT NULL,
  `id_orden` int(15) DEFAULT NULL,
  `consecutivo_orden` int(11) DEFAULT NULL,
  `id_inventario` int(15) NOT NULL,
  `codigo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(600) COLLATE latin1_general_ci DEFAULT '',
  `cantidad` double(20,2) DEFAULT '0.00',
  `saldo_cantidad` double(20,2) DEFAULT '0.00',
  `costo_unitario` double(20,2) DEFAULT '0.00',
  `costo_compra` double(20,2) DEFAULT NULL,
  `costo_inventario` double(20,2) DEFAULT NULL,
  `tipo_descuento` varchar(20) COLLATE latin1_general_ci DEFAULT '',
  `descuento` double(20,2) DEFAULT '0.00',
  `id_impuesto` int(11) DEFAULT NULL,
  `impuesto` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `valor_impuesto` double(20,2) DEFAULT NULL,
  `observaciones` longtext COLLATE latin1_general_ci,
  `obs_proveedores` longtext COLLATE latin1_general_ci,
  `inventariable` varchar(6) COLLATE latin1_general_ci DEFAULT '',
  `activo` int(1) DEFAULT '1',
  `id_proveedor` int(15) DEFAULT NULL,
  `proveedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `dias_evento` int(10) DEFAULT NULL,
  `id_item_pedido` int(15) DEFAULT '0',
  `cant_item_pedido` int(11) DEFAULT NULL,
  `observacion_cortesia` longtext COLLATE latin1_general_ci,
  `requiere_obs_tecnica` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `obs_tecnica` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_remision_vernta` (`id_maestro`) USING BTREE,
  KEY `id_inventario` (`id_inventario`) USING BTREE,
  KEY `id_impuesto` (`id_impuesto`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=76371 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_ordenes
-- ----------------------------
DROP TABLE IF EXISTS `compras_ordenes`;
CREATE TABLE `compras_ordenes` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `random` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `id_requisicion` int(15) DEFAULT NULL,
  `pendientes_facturar` double(15,2) DEFAULT '0.00' COMMENT 'items facturados de la remision',
  `id_empresa` int(11) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_zona_oc` int(11) DEFAULT NULL,
  `zona_oc` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_bodega` int(11) DEFAULT NULL,
  `bodega` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `consecutivo` int(11) DEFAULT NULL,
  `consecutivo_maestro` int(15) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `fecha_genera_orden` datetime DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT '0',
  `documento_vendedor` bigint(20) DEFAULT NULL,
  `nombre_vendedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT '0',
  `documento_usuario` bigint(20) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_cliente` int(15) DEFAULT NULL,
  `cod_cliente` int(11) DEFAULT NULL,
  `nit` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal_cliente` int(11) DEFAULT NULL,
  `sucursal_cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `exento_iva` varchar(5) COLLATE latin1_general_ci DEFAULT '',
  `plantillas_id` int(15) DEFAULT NULL,
  `id_forma_pago` int(15) DEFAULT NULL,
  `forma_pago` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `referencia` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `estado` int(1) DEFAULT '0' COMMENT '0 -> nuevo, 1 -> guardado, 2 -> ingresado con factura, 3 -> cancelado, 4 -> ingresadas todas las unidades',
  `id_centro_costo` int(11) DEFAULT '0',
  `codigo_centro_costo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `centro_costo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `consecutivo_siip` varchar(30) COLLATE latin1_general_ci DEFAULT '',
  `activo` int(1) DEFAULT '1',
  `fecha_inicio_evento` date DEFAULT NULL,
  `hora_inicio_evento` time DEFAULT NULL,
  `fecha_final_evento` date DEFAULT NULL,
  `hora_final_evento` time DEFAULT NULL,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `codigo_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_remision_pedido` int(11) DEFAULT NULL,
  `remision_pedido` int(11) DEFAULT NULL,
  `factura_erp` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `numero_factura_erp` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_evento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ciudad_montaje` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_montaje` date DEFAULT NULL,
  `hora_montaje` time DEFAULT NULL,
  `direccion_montaje` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_contacto` int(11) DEFAULT NULL,
  `contacto_plataforma` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `salon_evento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_maestro` int(15) DEFAULT NULL,
  `id_proveedor` int(15) DEFAULT NULL,
  `nit_proveedor` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `id_zona` int(15) DEFAULT NULL,
  `zona` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `proveedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_forma_pago_proveedor` int(11) DEFAULT NULL,
  `forma_pago_proveedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cuenta_proveedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `encuesta` varchar(15) COLLATE latin1_general_ci DEFAULT 'no',
  `id_encuesta` int(11) DEFAULT NULL,
  `conforme_encuesta` varchar(10) COLLATE latin1_general_ci DEFAULT '',
  `pago_encuesta` varchar(10) COLLATE latin1_general_ci DEFAULT '',
  `verificacion` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `valor_descuento` double(20,0) DEFAULT NULL,
  `observacion_verificacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_encuesta` timestamp NULL DEFAULT NULL COMMENT 'fecha en que se realiza la encuesta',
  `fecha_validacion` timestamp NULL DEFAULT NULL COMMENT 'fecha en que compras valida la orden',
  `id_usuario_validacion` int(15) DEFAULT NULL,
  `usuario_validacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_orden_pedido` datetime DEFAULT NULL,
  `contabilizar` varchar(2) COLLATE latin1_general_ci DEFAULT 'no',
  `observacion_contabilidad` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_contabilidad` timestamp NULL DEFAULT NULL,
  `id_usuario_contabilidad` int(15) DEFAULT NULL,
  `usuario_contabilidad` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `prefijo_factura` varchar(10) COLLATE latin1_general_ci DEFAULT '',
  `numero_factura` int(15) DEFAULT NULL,
  `forma_contabilizacion` varchar(255) COLLATE latin1_general_ci DEFAULT 'manual' COMMENT 'si fue contabilizada por sistema o manualmente',
  `calificacion_proveedor` double(10,2) DEFAULT NULL,
  `calificacion_minima_proveedor` int(1) DEFAULT NULL,
  `tasa_cambio` double(10,2) DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `inconformidad_envio` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_usuario_envio` int(11) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `edicion_habilitada` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Se puede habilitar la OC para edicion o cancelacion',
  `aprobacion_proveedor` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `solicitud_cancelacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `oc_destiempo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Si la OC se hizo a destiempo',
  `id_orden_erp` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_orden_erp` int(11) DEFAULT NULL,
  `id_tipo_oc` int(11) DEFAULT NULL,
  `nombre_tipo_oc` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `id_area_oc` int(11) DEFAULT NULL,
  `nombre_area_oc` varchar(150) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_evento` int(1) DEFAULT '0' COMMENT '0->normal, 1->interno, 2->cortesia,3->montaje',
  `calificacion_solicitada` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `obs_solicitud_evaluacion` longtext COLLATE latin1_general_ci COMMENT 'la observacion de la solicitud',
  `usuario_solicitud_evaluacion` int(11) DEFAULT NULL COMMENT 'usuario solicitante',
  `nombre_solicitud_evaluacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_solicitud_evaluacion` datetime DEFAULT NULL COMMENT 'fecha solicitud evaluacion',
  `numero_solicitud_evaluacion` int(1) DEFAULT '0',
  `autorizado_compras` varchar(5) COLLATE latin1_general_ci DEFAULT '',
  `id_compras` int(11) DEFAULT NULL,
  `obs_compras` longtext COLLATE latin1_general_ci,
  `fecha_compras` datetime DEFAULT NULL,
  `autorizado_financiero` varchar(5) COLLATE latin1_general_ci DEFAULT '' COMMENT 'usuario que autoriza',
  `id_financiero` int(11) DEFAULT NULL,
  `obs_financiero` longtext COLLATE latin1_general_ci,
  `fecha_financiero` datetime DEFAULT NULL,
  `usuario_eliminacion` int(10) DEFAULT NULL,
  `fecha_eliminacion` datetime DEFAULT NULL,
  `obs_eliminacion` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_empresa` (`id_empresa`) USING BTREE,
  KEY `id_sucursal` (`id_sucursal`) USING BTREE,
  KEY `id_bodega` (`id_bodega`) USING BTREE,
  KEY `id_vendedor` (`id_vendedor`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `id_cliente` (`id_cliente`) USING BTREE,
  KEY `id_sucursal_cliente` (`id_sucursal_cliente`) USING BTREE,
  KEY `plantillas_id` (`plantillas_id`) USING BTREE,
  KEY `id_forma_pago` (`id_forma_pago`) USING BTREE,
  KEY `id_centro_costo` (`id_centro_costo`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=50885 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_ordenes_envios_log
-- ----------------------------
DROP TABLE IF EXISTS `compras_ordenes_envios_log`;
CREATE TABLE `compras_ordenes_envios_log` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `destinatarios` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `contenido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `adjunto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_proveedor` int(15) DEFAULT NULL,
  `proveedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(15) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_orden` int(15) DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `id_empresa` int(5) DEFAULT NULL,
  `id_sucursal` int(5) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16298 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_ordenes_maestros_cotizacion
-- ----------------------------
DROP TABLE IF EXISTS `compras_ordenes_maestros_cotizacion`;
CREATE TABLE `compras_ordenes_maestros_cotizacion` (
  `id_orden_maestro` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ext` varchar(100) DEFAULT NULL,
  `id_usuario` int(20) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for compras_ordenes_tipos
-- ----------------------------
DROP TABLE IF EXISTS `compras_ordenes_tipos`;
CREATE TABLE `compras_ordenes_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(11) DEFAULT '1',
  `id_empresa` int(11) DEFAULT NULL,
  `id_erp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_ordenes_validaciones_log
-- ----------------------------
DROP TABLE IF EXISTS `compras_ordenes_validaciones_log`;
CREATE TABLE `compras_ordenes_validaciones_log` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `validacion` varchar(50) COLLATE latin1_general_ci DEFAULT '' COMMENT 'Autorizacion o Contabilidad',
  `accion` varchar(50) COLLATE latin1_general_ci DEFAULT '' COMMENT 'si crea o anula aprobacion o contabilizacion',
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `descuento` double(15,0) DEFAULT NULL,
  `id_usuario` int(15) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_orden` int(15) DEFAULT NULL,
  `consecutivo` int(10) DEFAULT NULL,
  `id_empresa` int(5) DEFAULT NULL,
  `id_sucursal` int(5) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6297 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_requisicion_color
-- ----------------------------
DROP TABLE IF EXISTS `compras_requisicion_color`;
CREATE TABLE `compras_requisicion_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` int(11) DEFAULT NULL,
  `color` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `horas` int(3) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_requisicion_rechazos
-- ----------------------------
DROP TABLE IF EXISTS `compras_requisicion_rechazos`;
CREATE TABLE `compras_requisicion_rechazos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_requisicion` int(11) DEFAULT NULL,
  `consecutivo` int(11) DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_requisiciones
-- ----------------------------
DROP TABLE IF EXISTS `compras_requisiciones`;
CREATE TABLE `compras_requisiciones` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `random` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `pendientes_facturar` double(15,2) DEFAULT '0.00' COMMENT 'items facturados de la remision',
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_bodega` int(11) DEFAULT NULL,
  `bodega` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `consecutivo` int(11) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `fecha_genera_requisicion` datetime DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT '0',
  `documento_vendedor` bigint(20) DEFAULT NULL,
  `nombre_vendedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT '0',
  `documento_usuario` bigint(20) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_cliente` int(15) DEFAULT NULL,
  `cod_cliente` int(11) DEFAULT NULL,
  `nit` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal_cliente` int(11) DEFAULT NULL,
  `sucursal_cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `exento_iva` varchar(5) COLLATE latin1_general_ci DEFAULT '',
  `id_forma_pago` int(15) DEFAULT NULL,
  `forma_pago` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `referencia` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `estado` int(1) DEFAULT '0' COMMENT '0 -> nuevo, 1 -> guardado, 2 -> ingresado con factura, 3 -> cancelado, 4 -> ingresadas todas las unidades',
  `id_centro_costo` int(11) DEFAULT '0',
  `codigo_centro_costo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `centro_costo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `consecutivo_siip` varchar(30) COLLATE latin1_general_ci DEFAULT '',
  `activo` int(1) DEFAULT '1',
  `fecha_inicio_evento` date DEFAULT NULL,
  `hora_inicio_evento` time DEFAULT NULL,
  `fecha_final_evento` date DEFAULT NULL,
  `hora_final_evento` time DEFAULT NULL,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `codigo_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_evento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ciudad_montaje` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_montaje` date DEFAULT NULL,
  `hora_montaje` time DEFAULT NULL,
  `direccion_montaje` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_contacto` int(11) DEFAULT NULL,
  `contacto_plataforma` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `salon_evento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_color_prioridad` int(11) DEFAULT '0',
  `prioridad` varchar(50) COLLATE latin1_general_ci DEFAULT 'SIN_PRIORIDAD',
  `color_prioridad` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `validacion` int(1) DEFAULT '0' COMMENT '0=sin validar, 1=validado, 2=no validado/no autorizado',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_empresa` (`id_empresa`) USING BTREE,
  KEY `id_sucursal` (`id_sucursal`) USING BTREE,
  KEY `id_bodega` (`id_bodega`) USING BTREE,
  KEY `id_vendedor` (`id_vendedor`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  KEY `id_cliente` (`id_cliente`) USING BTREE,
  KEY `id_sucursal_cliente` (`id_sucursal_cliente`) USING BTREE,
  KEY `id_forma_pago` (`id_forma_pago`) USING BTREE,
  KEY `id_centro_costo` (`id_centro_costo`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=61517 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_requisiciones_inventario
-- ----------------------------
DROP TABLE IF EXISTS `compras_requisiciones_inventario`;
CREATE TABLE `compras_requisiciones_inventario` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `id_requisicion` int(15) DEFAULT NULL,
  `id_inventario` int(15) NOT NULL,
  `codigo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(600) COLLATE latin1_general_ci DEFAULT '',
  `cantidad` double(20,2) DEFAULT '0.00',
  `saldo_cantidad` double(20,2) DEFAULT '0.00',
  `costo_unitario` double(20,2) DEFAULT '0.00',
  `costo_compra` double(20,2) DEFAULT '0.00',
  `costo_inventario` double(20,2) DEFAULT NULL,
  `tipo_descuento` varchar(20) COLLATE latin1_general_ci DEFAULT '',
  `descuento` double(20,2) DEFAULT '0.00',
  `id_impuesto` int(11) DEFAULT NULL,
  `impuesto` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `valor_impuesto` double(20,2) DEFAULT NULL,
  `observaciones` longtext COLLATE latin1_general_ci,
  `obs_proveedores` longtext COLLATE latin1_general_ci,
  `inventariable` varchar(6) COLLATE latin1_general_ci DEFAULT '',
  `activo` int(1) DEFAULT '1',
  `id_proveedor` int(15) DEFAULT NULL,
  `proveedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `dias_evento` int(10) DEFAULT NULL,
  `id_item_pedido` int(15) DEFAULT '0',
  `cant_item_pedido` int(11) DEFAULT NULL,
  `requiere_obs_tecnica` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `obs_tecnica` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_remision_vernta` (`id_requisicion`) USING BTREE,
  KEY `id_inventario` (`id_inventario`) USING BTREE,
  KEY `id_impuesto` (`id_impuesto`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=276321 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for compras_requisiciones_validacion
-- ----------------------------
DROP TABLE IF EXISTS `compras_requisiciones_validacion`;
CREATE TABLE `compras_requisiciones_validacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_requisicion` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `accion` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_carnet
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_carnet`;
CREATE TABLE `configuracion_carnet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fondo` mediumblob,
  `fondo_ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_carnet_datos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_carnet_datos`;
CREATE TABLE `configuracion_carnet_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_carnet` int(11) NOT NULL,
  `campo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `width` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `height` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `top` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `left` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `font` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fontFamily` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `color` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `codebar` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `principal` (`id_carnet`) USING BTREE,
  CONSTRAINT `configuracion_carnet_datos_ibfk_1` FOREIGN KEY (`id_carnet`) REFERENCES `configuracion_carnet` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1934 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_consumos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_consumos`;
CREATE TABLE `configuracion_consumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiempo_demostracion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_contratos_causales_terminacion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_contratos_causales_terminacion`;
CREATE TABLE `configuracion_contratos_causales_terminacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_contratos_clases
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_contratos_clases`;
CREATE TABLE `configuracion_contratos_clases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_contratos_tipos_negociacion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_contratos_tipos_negociacion`;
CREATE TABLE `configuracion_contratos_tipos_negociacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_dados_de_baja_ubicaciones
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_dados_de_baja_ubicaciones`;
CREATE TABLE `configuracion_dados_de_baja_ubicaciones` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_dependencias
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_dependencias`;
CREATE TABLE `configuracion_dependencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_director` int(11) DEFAULT NULL,
  `director` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_documentos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_documentos`;
CREATE TABLE `configuracion_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `texto` longblob,
  `texto2` longblob,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_documentos_tipo
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_documentos_tipo`;
CREATE TABLE `configuracion_documentos_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `tabla_principal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_factor_horas_extras(BORRAR)
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_factor_horas_extras(BORRAR)`;
CREATE TABLE `configuracion_factor_horas_extras(BORRAR)` (
  `id` int(2) NOT NULL DEFAULT '0',
  `tipo` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `de` time DEFAULT NULL,
  `hasta` time DEFAULT '00:00:00',
  `festivo` int(1) DEFAULT '0',
  `valor` decimal(3,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------



-- ----------------------------
-- Table structure for configuracion_formas_pago
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_formas_pago`;
CREATE TABLE `configuracion_formas_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `plazo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_formas_pago_terceros
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_formas_pago_terceros`;
CREATE TABLE `configuracion_formas_pago_terceros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `plazo` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_erp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_global
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_global`;
CREATE TABLE `configuracion_global` (
  `id` int(11) NOT NULL,
  `propina` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `origen` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false' COMMENT 'define si el documento maestro captura el origen o fuente ',
  `ejecutivo` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false' COMMENT 'Define si en el documento maestro firma quien crea el documento, o si se selecciona  la persona que debe firmar',
  `tipo_servicio` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'true',
  `valor_en_pedido` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `totales_en_pedido` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `iva_espacios` int(2) NOT NULL DEFAULT '10',
  `nombre_empresa` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'nombre empresa',
  `nombre_sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'nombre sucursal',
  `nit` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '0000000000-0',
  `representante` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Representante Legal',
  `cedula` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `origen_cedula` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Ciudad - Departamento',
  `direccion` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'direccion',
  `Telefonos` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '(00-0) 000000000',
  `hora_inicio_busqueda` time NOT NULL DEFAULT '07:00:00',
  `hora_final_busqueda` time NOT NULL DEFAULT '18:00:00',
  `repetir_encabezado_remision` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `path` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'localhost' COMMENT 'DEFINE CUAL ES EL PATH DE LA APLICACION (INCLUDES CON PARAMETROS)',
  `correo_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `servidor_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `puerto_SMTP` int(10) NOT NULL DEFAULT '25',
  `autenticacion_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Si',
  `usuario_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `seguridad_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Ninguna',
  `escala_imagen_pdf` int(2) NOT NULL DEFAULT '4',
  `debug1` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false' COMMENT 'define si muestra o no el contexmenu',
  `debug2` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false' COMMENT 'DEBUG PARA LA PANTALLA DE ENVIO DE MAIL',
  `consecutivo_pedido` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `multipropiedad` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `items_propiedad` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `smtp_propiedad` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `Path_temp` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '/opt/lampp/htdocs/ASISTE/ARCHIVOS_PROPIOS/adjuntos/',
  `puerto_predeterminado` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'true',
  `crm` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `conexion_siip3` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `salario_minimo` float NOT NULL,
  `url` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_global_api_google
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_global_api_google`;
CREATE TABLE `configuracion_global_api_google` (
  `activo` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `email` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `dominio` varchar(255) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_global_app
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_global_app`;
CREATE TABLE `configuracion_global_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_app` int(2) NOT NULL,
  `app` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `style_backimage_login` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `style_backimage_login_autoresize` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `style_login_validation` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `style_backimage_desktop` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `style_backimage_desktop_autoresize` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `style_backcolor` varchar(10) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_global_copy
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_global_copy`;
CREATE TABLE `configuracion_global_copy` (
  `id` int(11) NOT NULL,
  `propina` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `origen` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false' COMMENT 'define si el documento maestro captura el origen o fuente ',
  `ejecutivo` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false' COMMENT 'Define si en el documento maestro firma quien crea el documento, o si se selecciona  la persona que debe firmar',
  `tipo_servicio` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'true',
  `valor_en_pedido` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `totales_en_pedido` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `iva_espacios` int(2) NOT NULL DEFAULT '10',
  `nombre_empresa` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'nombre empresa',
  `nombre_sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'nombre sucursal',
  `nit` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '0000000000-0',
  `representante` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Representante Legal',
  `cedula` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `origen_cedula` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Ciudad - Departamento',
  `direccion` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'direccion',
  `Telefonos` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '(00-0) 000000000',
  `hora_inicio_busqueda` time NOT NULL DEFAULT '07:00:00',
  `hora_final_busqueda` time NOT NULL DEFAULT '18:00:00',
  `repetir_encabezado_remision` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `path` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'localhost' COMMENT 'DEFINE CUAL ES EL PATH DE LA APLICACION (INCLUDES CON PARAMETROS)',
  `correo_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `servidor_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `puerto_SMTP` int(10) NOT NULL DEFAULT '25',
  `autenticacion_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Si',
  `usuario_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `seguridad_SMTP` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Ninguna',
  `escala_imagen_pdf` int(2) NOT NULL DEFAULT '4',
  `debug1` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false' COMMENT 'define si muestra o no el contexmenu',
  `debug2` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false' COMMENT 'DEBUG PARA LA PANTALLA DE ENVIO DE MAIL',
  `consecutivo_pedido` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `multipropiedad` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `items_propiedad` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `smtp_propiedad` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `Path_temp` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '/opt/lampp/htdocs/ASISTE/ARCHIVOS_PROPIOS/adjuntos/',
  `puerto_predeterminado` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'true',
  `crm` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `conexion_siip3` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `salario_minimo` float NOT NULL,
  `url` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_horas_extras
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_horas_extras`;
CREATE TABLE `configuracion_horas_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) DEFAULT NULL,
  `pais` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `ano` int(4) DEFAULT NULL,
  `hed` float(11,2) DEFAULT NULL,
  `hen` float(11,2) DEFAULT NULL,
  `hedf` float(11,2) DEFAULT NULL,
  `henf` float(11,2) DEFAULT NULL,
  `salario_base` float(11,2) DEFAULT NULL,
  `inicia_diurno` time DEFAULT '06:00:00',
  `inicia_nocturno` time DEFAULT '22:00:00',
  `activo` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PAIS` (`id_pais`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_informacion_comercial
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_informacion_comercial`;
CREATE TABLE `configuracion_informacion_comercial` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(15) DEFAULT NULL,
  `id_empleado` int(15) DEFAULT NULL,
  `documento_empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `mensaje_empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `mensaje_comercial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_informacion_compras
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_informacion_compras`;
CREATE TABLE `configuracion_informacion_compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `moneda` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_inventarios_ciclicos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_inventarios_ciclicos`;
CREATE TABLE `configuracion_inventarios_ciclicos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `horas_inventario_activo` int(10) DEFAULT NULL COMMENT 'EL tiempo de vigencia del inventario ciclico',
  `id_empresa` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_inventarios_documentos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_inventarios_documentos`;
CREATE TABLE `configuracion_inventarios_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_items_dotaciones
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_items_dotaciones`;
CREATE TABLE `configuracion_items_dotaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `predeterminado` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `activo` bit(1) DEFAULT b'1',
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_mantenimiento_checklist
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_mantenimiento_checklist`;
CREATE TABLE `configuracion_mantenimiento_checklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_mantenimiento_checklist_detalles
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_mantenimiento_checklist_detalles`;
CREATE TABLE `configuracion_mantenimiento_checklist_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_checklist` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `tipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `obligatorio` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_metodos_pago
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_metodos_pago`;
CREATE TABLE `configuracion_metodos_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  `codigo_metodo_pago_dian` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_erp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_empresa` (`id_empresa`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_modulo_compras
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_modulo_compras`;
CREATE TABLE `configuracion_modulo_compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tope_subcontratacion` double(20,2) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_modulo_turnos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_modulo_turnos`;
CREATE TABLE `configuracion_modulo_turnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tope_horas` int(10) DEFAULT NULL,
  `horas_almuerzo` int(10) DEFAULT NULL,
  `tope_horas_compensatorio` int(10) DEFAULT NULL,
  `hora_ingreso_administrativa` time DEFAULT NULL,
  `tope_llamados_atencion` int(10) DEFAULT NULL,
  `id_empresa` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_moneda
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_moneda`;
CREATE TABLE `configuracion_moneda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moneda` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `descripcion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_en_letras` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `simbolo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `decimales` int(1) DEFAULT NULL,
  `label` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `Formato_hora` int(1) NOT NULL DEFAULT '1' COMMENT '1 ->  am  2-> 24',
  `idioma` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `predeterminado` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`,`moneda`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_motivos_cancelacion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_motivos_cancelacion`;
CREATE TABLE `configuracion_motivos_cancelacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `empresa` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `motivo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_motivos_retiro
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_motivos_retiro`;
CREATE TABLE `configuracion_motivos_retiro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `motivo` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_niveles_estudio
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_niveles_estudio`;
CREATE TABLE `configuracion_niveles_estudio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_novedades_inventario
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_novedades_inventario`;
CREATE TABLE `configuracion_novedades_inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abreviatura` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `motivo` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_origen
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_origen`;
CREATE TABLE `configuracion_origen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `recomendado` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_origenes_contacto_terceros
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_origenes_contacto_terceros`;
CREATE TABLE `configuracion_origenes_contacto_terceros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_productos_software
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_productos_software`;
CREATE TABLE `configuracion_productos_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `meses_encuesta` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_encuesta` varchar(10) COLLATE latin1_general_ci DEFAULT 'periodica',
  `items_encuesta` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_proyectos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_proyectos`;
CREATE TABLE `configuracion_proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_proyectos_actividades
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_proyectos_actividades`;
CREATE TABLE `configuracion_proyectos_actividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `codigo_proyecto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_reunion_coope
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_reunion_coope`;
CREATE TABLE `configuracion_reunion_coope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `id_checklist_configuracion_reuniones_coope` int(11) NOT NULL,
  `nombre_checklist` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha_creacion_reunion` datetime NOT NULL,
  `email_responsable` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_reunion_coope_checklist
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_reunion_coope_checklist`;
CREATE TABLE `configuracion_reunion_coope_checklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_reunion_coope_checklist_detalles
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_reunion_coope_checklist_detalles`;
CREATE TABLE `configuracion_reunion_coope_checklist_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_checklist` int(11) NOT NULL,
  `nombre` varchar(1500) COLLATE latin1_general_ci NOT NULL,
  `tipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_reunion_coope_notificacion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_reunion_coope_notificacion`;
CREATE TABLE `configuracion_reunion_coope_notificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_configuracion_reunion_coope` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `funcionario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=262 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_sector_empresarial
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_sector_empresarial`;
CREATE TABLE `configuracion_sector_empresarial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_solicitudes_documentos_causales
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_solicitudes_documentos_causales`;
CREATE TABLE `configuracion_solicitudes_documentos_causales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_solicitudes_facturas_motivos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_solicitudes_facturas_motivos`;
CREATE TABLE `configuracion_solicitudes_facturas_motivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `director_regional` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `director_comercial` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `director_pais` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `director_zona` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `director_operativo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `ejecutivo_comercial` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `asistente_tecnico` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `activo` bit(1) DEFAULT b'1',
  `requiere_formato` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_solicitudes_facturas_tipos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_solicitudes_facturas_tipos`;
CREATE TABLE `configuracion_solicitudes_facturas_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_solicitudes_ordenes_motivos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_solicitudes_ordenes_motivos`;
CREATE TABLE `configuracion_solicitudes_ordenes_motivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_solicitudes_ordenes_tipos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_solicitudes_ordenes_tipos`;
CREATE TABLE `configuracion_solicitudes_ordenes_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_solicitudes_remisiones_motivos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_solicitudes_remisiones_motivos`;
CREATE TABLE `configuracion_solicitudes_remisiones_motivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `director_regional` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `director_comercial` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `director_pais` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `director_zona` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `director_operativo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `ejecutivo_comercial` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `asistente_tecnico` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `activo` bit(1) DEFAULT b'1',
  `requiere_formato` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_solicitudes_remisiones_tipos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_solicitudes_remisiones_tipos`;
CREATE TABLE `configuracion_solicitudes_remisiones_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_terceros_linea_negocio
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_terceros_linea_negocio`;
CREATE TABLE `configuracion_terceros_linea_negocio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_tipos_areas
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_tipos_areas`;
CREATE TABLE `configuracion_tipos_areas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_tipos_contacto
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_tipos_contacto`;
CREATE TABLE `configuracion_tipos_contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `unico` varchar(3) COLLATE latin1_general_ci DEFAULT 'no' COMMENT 'si es un unico parentesco por ej: una sola esposa',
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_tipos_servicios_proveedores
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_tipos_servicios_proveedores`;
CREATE TABLE `configuracion_tipos_servicios_proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_tipos_turnos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_tipos_turnos`;
CREATE TABLE `configuracion_tipos_turnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `implica_horas` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `pedido_obligatorio` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_tipos_turnos_administrativos
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_tipos_turnos_administrativos`;
CREATE TABLE `configuracion_tipos_turnos_administrativos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_tipos_ubicaciones
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_tipos_ubicaciones`;
CREATE TABLE `configuracion_tipos_ubicaciones` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_zona_horaria
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_zona_horaria`;
CREATE TABLE `configuracion_zona_horaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zona_horaria` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=414 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for configuracion_zonas
-- ----------------------------
DROP TABLE IF EXISTS `configuracion_zonas`;
CREATE TABLE `configuracion_zonas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) DEFAULT '1',
  `id_empresa` int(2) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `director` int(11) DEFAULT NULL,
  `director_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `director2` int(11) DEFAULT NULL,
  `director2_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `operativo` int(11) DEFAULT NULL,
  `operativo_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for consecutivos
-- ----------------------------
DROP TABLE IF EXISTS `consecutivos`;
CREATE TABLE `consecutivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `tipo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `numero` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for control_gastos_concepto
-- ----------------------------
DROP TABLE IF EXISTS `control_gastos_concepto`;
CREATE TABLE `control_gastos_concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_documento` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `concepto` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `detalles` varchar(5000) COLLATE latin1_general_ci NOT NULL,
  `valor` float(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for control_gastos_documento
-- ----------------------------
DROP TABLE IF EXISTS `control_gastos_documento`;
CREATE TABLE `control_gastos_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `empleado` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empleado_reviso` int(11) NOT NULL,
  `empleado_reviso` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int(1) NOT NULL COMMENT '1 - Documento Abierto  \r\n2 - Documento Cerrado  \r\n3 - Documento Contabilizado  ',
  PRIMARY KEY (`id`,`empleado`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for control_gastos_soportes
-- ----------------------------
DROP TABLE IF EXISTS `control_gastos_soportes`;
CREATE TABLE `control_gastos_soportes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_concepto` int(11) NOT NULL,
  `documento` longblob NOT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `document_type` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for costo_departamentos
-- ----------------------------
DROP TABLE IF EXISTS `costo_departamentos`;
CREATE TABLE `costo_departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `modulo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `id_empresa` int(15) DEFAULT NULL,
  `id_erp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for crm_configuracion_actividades
-- ----------------------------
DROP TABLE IF EXISTS `crm_configuracion_actividades`;
CREATE TABLE `crm_configuracion_actividades` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_completa` varchar(6) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'cuando lleva fecha de inicio y fecha final',
  `fecha_vencimiento` varchar(6) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'cuando solo lleva fecha de vencimiento',
  `copiar_crm_obligatorio` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'check copia CRM obligatorio',
  `icono` int(2) DEFAULT NULL,
  `genera_visita` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `genera_llamada` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_departamento` tinyint(3) DEFAULT NULL,
  `departamento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for crm_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_log`;
CREATE TABLE `crm_log` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `log` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for crm_notificaciones
-- ----------------------------
DROP TABLE IF EXISTS `crm_notificaciones`;
CREATE TABLE `crm_notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_objetivo` int(11) DEFAULT NULL,
  `objetivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_actividad` int(11) DEFAULT NULL,
  `tema` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_actividad` int(1) DEFAULT NULL,
  `id_asignado` int(11) DEFAULT NULL,
  `asignado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `alarma` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for crm_objetivos
-- ----------------------------
DROP TABLE IF EXISTS `crm_objetivos`;
CREATE TABLE `crm_objetivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal_cliente` int(11) DEFAULT '0',
  `sucursal_cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL COMMENT '1.Documento   2.Personalizado',
  `referencia` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `objetivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `vencimiento` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` int(1) DEFAULT '0',
  `observacion_finaliza` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario_finaliza` int(11) DEFAULT NULL,
  `usuario_finaliza` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_finaliza` datetime DEFAULT NULL,
  `actividades` int(11) DEFAULT '0',
  `acciones` int(11) DEFAULT '0',
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2042 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for crm_objetivos_actividades
-- ----------------------------
DROP TABLE IF EXISTS `crm_objetivos_actividades`;
CREATE TABLE `crm_objetivos_actividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_objetivo` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal_cliente` int(11) DEFAULT NULL,
  `sucursal_cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_objetivo` int(1) DEFAULT NULL,
  `referencia` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `objetivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL,
  `tipo_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `icono` int(2) DEFAULT NULL,
  `tema` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_asignado` int(11) DEFAULT NULL,
  `asignado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fecha_actividad` datetime DEFAULT NULL,
  `fechai` date DEFAULT NULL,
  `horai` time DEFAULT NULL,
  `fechaf` date DEFAULT NULL,
  `horaf` time DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `estado` int(1) DEFAULT '0',
  `observacion_finaliza` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario_finaliza` int(11) DEFAULT NULL,
  `usuario_finaliza` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_finaliza` datetime DEFAULT NULL,
  `acciones` smallint(3) DEFAULT '0',
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29011 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for crm_objetivos_actividades_acciones
-- ----------------------------
DROP TABLE IF EXISTS `crm_objetivos_actividades_acciones`;
CREATE TABLE `crm_objetivos_actividades_acciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_objetivo` int(11) DEFAULT NULL,
  `id_actividad` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `accion` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4751 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for crm_objetivos_actividades_documentos
-- ----------------------------
DROP TABLE IF EXISTS `crm_objetivos_actividades_documentos`;
CREATE TABLE `crm_objetivos_actividades_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_actividad` int(11) DEFAULT NULL,
  `nombre_documento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `randomico_archivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_actividad`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3023 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for crm_objetivos_actividades_personas
-- ----------------------------
DROP TABLE IF EXISTS `crm_objetivos_actividades_personas`;
CREATE TABLE `crm_objetivos_actividades_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_actividad` int(11) DEFAULT NULL,
  `id_asignado` int(11) DEFAULT NULL,
  `asignado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6103 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for debug
-- ----------------------------
DROP TABLE IF EXISTS `debug`;
CREATE TABLE `debug` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `debug` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for documentos_eliminados_log
-- ----------------------------
DROP TABLE IF EXISTS `documentos_eliminados_log`;
CREATE TABLE `documentos_eliminados_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `tabla` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `activo` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for documentos_excel_comisiones
-- ----------------------------
DROP TABLE IF EXISTS `documentos_excel_comisiones`;
CREATE TABLE `documentos_excel_comisiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_formato` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `randomico` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `inicio_vigencia` date DEFAULT NULL,
  `fin_vigencia` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_EMPRESA` (`id_pais`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=594 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento` int(2) NOT NULL DEFAULT '1',
  `tipo_documento_nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `documento` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nombre1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `apellido1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `apellido2` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empresa` int(3) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_zona` int(3) DEFAULT NULL,
  `zona` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(3) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_unidad_negocio` int(3) DEFAULT NULL,
  `unidad_negocio` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `pais` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `id_rol` int(2) DEFAULT NULL,
  `rol` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_cargo` int(255) DEFAULT NULL,
  `cargo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `username_old` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `username` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `email_empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `direccion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `email_personal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `celular1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_celular_empresa` int(11) DEFAULT NULL,
  `celular_empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `foto` longblob,
  `id_contrato` int(3) DEFAULT NULL,
  `contrato` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `salario_base` float(11,2) NOT NULL DEFAULT '566700.00',
  `salario` float(11,2) NOT NULL DEFAULT '0.00',
  `ad_contrato` blob,
  `ad_certificado_judicial` blob,
  `ad_cedula` blob,
  `ad_certificado_estudios` blob,
  `ad_hoja_vida` blob,
  `ad_afiliaciones` blob,
  `alerta_actualizacion` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `activo` int(1) NOT NULL DEFAULT '1',
  `ciudad_cedula` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `eps` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `arp` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `extras` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `tecnico_operativo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `conductor` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `vendedor` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `qrcode` mediumblob,
  `color_menu` varchar(11) COLLATE latin1_general_ci DEFAULT '0,0,0',
  `tipo_fondo` varchar(20) COLLATE latin1_general_ci DEFAULT 'color_fondo' COMMENT 'Que tipo de fondo es : color o imagen',
  `color_fondo` varchar(11) COLLATE latin1_general_ci DEFAULT '32,124,229',
  `imagen_fondo` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `change_update` int(11) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `firma` varchar(5000) COLLATE latin1_general_ci DEFAULT NULL,
  `movil_sinc_contactos` int(11) DEFAULT '0',
  `id_celular` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `validar_celular` tinyint(11) DEFAULT NULL,
  `valida_hora_ingreso` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  `residente` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `huella_template` blob,
  `huella_foto` blob,
  `huella_enrola` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `enturnable` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `dependencia` int(11) DEFAULT NULL,
  `turno_administrativo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Si implica turno administrativo',
  `id_turno_administrativo` int(11) DEFAULT NULL,
  `legajo` int(5) DEFAULT NULL,
  `id_nivel_estudio` int(5) DEFAULT NULL,
  `nombre_estudio` varchar(255) CHARACTER SET koi8u DEFAULT NULL,
  `estudia_actualmente` varchar(2) COLLATE latin1_general_ci DEFAULT 'no',
  `estudio_actual` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_android_device` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_contrato` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_EMPRESA` (`id_empresa`) USING BTREE,
  KEY `ID_SUCURSAL` (`id_sucursal`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3466 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_adicional
-- ----------------------------
DROP TABLE IF EXISTS `empleados_adicional`;
CREATE TABLE `empleados_adicional` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(15) DEFAULT NULL,
  `ciudad_trabajo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fondo_pension` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `factor_rh` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `grupo_sanguineo` varchar(3) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_sangre` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `alergico_medicamento` varchar(3) COLLATE latin1_general_ci DEFAULT 'no',
  `cual_alergico_medicamento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `toma_medicamento` varchar(3) COLLATE latin1_general_ci DEFAULT 'no',
  `cual_toma_medicamento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2281 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_administrativos_entradas_rechazadas
-- ----------------------------
DROP TABLE IF EXISTS `empleados_administrativos_entradas_rechazadas`;
CREATE TABLE `empleados_administrativos_entradas_rechazadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `documento` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `fecha_in` date DEFAULT NULL,
  `hora_in` time DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `hora_registro` time DEFAULT NULL,
  `zona_horaria` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `autorizacion1` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_autorizacion1` int(11) DEFAULT NULL,
  `observacion_autorizacion1` longtext COLLATE latin1_general_ci,
  `activo` bit(1) DEFAULT b'1',
  `segunda_autorizacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Si se paso del primer filtro pasa a una segunda autorizacion',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6516 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_cargos
-- ----------------------------
DROP TABLE IF EXISTS `empleados_cargos`;
CREATE TABLE `empleados_cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_contratos
-- ----------------------------
DROP TABLE IF EXISTS `empleados_contratos`;
CREATE TABLE `empleados_contratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `contrato` longblob,
  `activo` int(1) DEFAULT '1',
  `id_empresa` int(5) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_documentos
-- ----------------------------
DROP TABLE IF EXISTS `empleados_documentos`;
CREATE TABLE `empleados_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `tipo_documento_nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `document_type` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `year_documento` varchar(4) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_empleado` (`id_empleado`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19484 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_dotaciones
-- ----------------------------
DROP TABLE IF EXISTS `empleados_dotaciones`;
CREATE TABLE `empleados_dotaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_proxima` date DEFAULT NULL,
  `firmado` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `doc_firmado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=389 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_dotaciones_items
-- ----------------------------
DROP TABLE IF EXISTS `empleados_dotaciones_items`;
CREATE TABLE `empleados_dotaciones_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dotacion` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `observaciones` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2412 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_empresas_sucursales_permisos
-- ----------------------------
DROP TABLE IF EXISTS `empleados_empresas_sucursales_permisos`;
CREATE TABLE `empleados_empresas_sucursales_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10310 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_empresas_sucursales_permisos_log
-- ----------------------------
DROP TABLE IF EXISTS `empleados_empresas_sucursales_permisos_log`;
CREATE TABLE `empleados_empresas_sucursales_permisos_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `log` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=858 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_entradas_rechazadas
-- ----------------------------
DROP TABLE IF EXISTS `empleados_entradas_rechazadas`;
CREATE TABLE `empleados_entradas_rechazadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `documento` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `fecha_in` date DEFAULT NULL,
  `hora_in` time DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `hora_registro` time DEFAULT NULL,
  `zona_horaria` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `autorizado_operativo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_director_operativo` int(11) DEFAULT NULL,
  `observacion_operativo` longtext COLLATE latin1_general_ci,
  `autorizado_zona` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_director_zona` int(11) DEFAULT NULL,
  `observacion_zona` longtext COLLATE latin1_general_ci,
  `tercera_validacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'SI requiere validacion de direccion operaciones',
  `autorizado_operaciones` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_director_operaciones` int(11) DEFAULT NULL,
  `observacion_operaciones` longtext COLLATE latin1_general_ci,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10444 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_historial_vinculacion
-- ----------------------------
DROP TABLE IF EXISTS `empleados_historial_vinculacion`;
CREATE TABLE `empleados_historial_vinculacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `motivo` varchar(3) COLLATE latin1_general_ci NOT NULL,
  `id_retiro` int(3) DEFAULT NULL,
  `motivo_retiro` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion_retiro` varchar(300) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(3) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(3) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`,`sucursal`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8846 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_horas_extras
-- ----------------------------
DROP TABLE IF EXISTS `empleados_horas_extras`;
CREATE TABLE `empleados_horas_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fechai` date NOT NULL,
  `horai` time NOT NULL,
  `fechas` date NOT NULL,
  `horas` time NOT NULL,
  `id_equipo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `med` float(11,2) DEFAULT '0.00',
  `med_valor` float(11,2) DEFAULT '0.00',
  `men` float(11,2) DEFAULT '0.00',
  `men_valor` float(11,2) DEFAULT '0.00',
  `medf` float(11,2) DEFAULT '0.00',
  `medf_valor` float(11,2) DEFAULT '0.00',
  `menf` float(11,2) DEFAULT '0.00',
  `menf_valor` float(11,2) DEFAULT '0.00',
  `total` float(11,2) DEFAULT '0.00',
  `change_update` int(11) DEFAULT NULL,
  `confirmacion_validacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Cuando la validacion ha sido confirmada',
  `validacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Cuando ha sido validada por direccion de zona',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `cedula` (`cedula`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=774677 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_horas_extras_aprobacion
-- ----------------------------
DROP TABLE IF EXISTS `empleados_horas_extras_aprobacion`;
CREATE TABLE `empleados_horas_extras_aprobacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_original` int(11) DEFAULT NULL COMMENT 'el id del registro en la tabla original de horas extras',
  `cedula` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fechai` date NOT NULL,
  `horai` time NOT NULL,
  `fechas` date NOT NULL,
  `horas` time NOT NULL,
  `med` float(11,2) DEFAULT '0.00',
  `med_valor` float(11,2) DEFAULT '0.00',
  `men` float(11,2) DEFAULT '0.00',
  `men_valor` float(11,2) DEFAULT '0.00',
  `medf` float(11,2) DEFAULT '0.00',
  `medf_valor` float(11,2) DEFAULT '0.00',
  `menf` float(11,2) DEFAULT '0.00',
  `menf_valor` float(11,2) DEFAULT '0.00',
  `total` float(11,2) DEFAULT '0.00',
  `confirmacion_validacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Es cuando el director confirma el cambio en las horas extras',
  `observacion_validacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `change_update` int(11) DEFAULT NULL,
  `conformidad` varchar(5) COLLATE latin1_general_ci DEFAULT 'true' COMMENT 'si el funcionario aprobo las horas extras',
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `cedula` (`cedula`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_horas_extras_aprobacion_rh
-- ----------------------------
DROP TABLE IF EXISTS `empleados_horas_extras_aprobacion_rh`;
CREATE TABLE `empleados_horas_extras_aprobacion_rh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_original` int(11) DEFAULT NULL COMMENT 'el id del registro en la tabla original de horas extras',
  `cedula` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fechai` date NOT NULL,
  `horai` time NOT NULL,
  `fechas` date NOT NULL,
  `horas` time NOT NULL,
  `med` float(11,2) DEFAULT '0.00',
  `med_valor` float(11,2) DEFAULT '0.00',
  `men` float(11,2) DEFAULT '0.00',
  `men_valor` float(11,2) DEFAULT '0.00',
  `medf` float(11,2) DEFAULT '0.00',
  `medf_valor` float(11,2) DEFAULT '0.00',
  `menf` float(11,2) DEFAULT '0.00',
  `menf_valor` float(11,2) DEFAULT '0.00',
  `total` float(11,2) DEFAULT '0.00',
  `conformidad` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `confirmacion_validacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `observacion_validacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `change_update` int(11) DEFAULT NULL,
  `autorizacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'true' COMMENT 'autorizacion para pago de HE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `cedula` (`cedula`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_informacion_contacto
-- ----------------------------
DROP TABLE IF EXISTS `empleados_informacion_contacto`;
CREATE TABLE `empleados_informacion_contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `id_parentesco` int(11) DEFAULT NULL,
  `parentesco` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_completo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombres` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `contacto_principal` varchar(3) COLLATE latin1_general_ci DEFAULT 'no',
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=945 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_ingresos_bloqueados
-- ----------------------------
DROP TABLE IF EXISTS `empleados_ingresos_bloqueados`;
CREATE TABLE `empleados_ingresos_bloqueados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `documento` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `fecha_in` date DEFAULT NULL,
  `hora_in` time DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `hora_registro` time DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_llegadas_tarde
-- ----------------------------
DROP TABLE IF EXISTS `empleados_llegadas_tarde`;
CREATE TABLE `empleados_llegadas_tarde` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `documento` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `observacion_empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion_funcionario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'la observacion de recursos humanos',
  `id_funcionario` int(11) DEFAULT NULL,
  `funcionario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `hora_entrada` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49801 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_llegadas_tarde_adjuntos
-- ----------------------------
DROP TABLE IF EXISTS `empleados_llegadas_tarde_adjuntos`;
CREATE TABLE `empleados_llegadas_tarde_adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_llamado_atencion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `consecutivo` int(11) DEFAULT NULL,
  `nombre_archivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_llamado_atencion`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1165 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_novedades
-- ----------------------------
DROP TABLE IF EXISTS `empleados_novedades`;
CREATE TABLE `empleados_novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `nombre_empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_tipo` int(10) DEFAULT NULL,
  `tipo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_inicio_novedad` date DEFAULT NULL,
  `hora_inicio_novedad` time DEFAULT NULL,
  `fecha_novedad` date DEFAULT NULL,
  `hora_ingreso` time DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `hora_creacion` time DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=352 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_novedades_tipos
-- ----------------------------
DROP TABLE IF EXISTS `empleados_novedades_tipos`;
CREATE TABLE `empleados_novedades_tipos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `implica_horas` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_permisos
-- ----------------------------
DROP TABLE IF EXISTS `empleados_permisos`;
CREATE TABLE `empleados_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` int(11) NOT NULL,
  `nivel` int(11) DEFAULT '1' COMMENT 'nivel de sangrado  1, 2 , 3 o 4',
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `root` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `modulo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=299 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_registro
-- ----------------------------
DROP TABLE IF EXISTS `empleados_registro`;
CREATE TABLE `empleados_registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_equipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `zona_horaria` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` varchar(5) COLLATE latin1_general_ci DEFAULT 'in',
  `direccion` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `movil` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `foto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` varchar(5000) COLLATE latin1_general_ci DEFAULT NULL,
  `suspension_out` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `recibe_notificacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `GPS_movil_login` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1489464 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_roles
-- ----------------------------
DROP TABLE IF EXISTS `empleados_roles`;
CREATE TABLE `empleados_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `valor` int(2) NOT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `parent` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_roles_contabilidad
-- ----------------------------
DROP TABLE IF EXISTS `empleados_roles_contabilidad`;
CREATE TABLE `empleados_roles_contabilidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `valor` varchar(5000) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_roles_permisos
-- ----------------------------
DROP TABLE IF EXISTS `empleados_roles_permisos`;
CREATE TABLE `empleados_roles_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=87983 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_salidas_excedidas
-- ----------------------------
DROP TABLE IF EXISTS `empleados_salidas_excedidas`;
CREATE TABLE `empleados_salidas_excedidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_registro` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `documento` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `fecha_out` date DEFAULT NULL,
  `hora_out` time DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `hora_registro` time DEFAULT NULL,
  `motivo_salida` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci COMMENT 'la observacion del funcionario por salir despues de la hora',
  `observacion2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'El pedido o cliente por el cual salio tarde',
  `id_valida_operativo` int(11) DEFAULT NULL,
  `validacion_operativo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `observacion_operativo` longtext COLLATE latin1_general_ci,
  `origen_operativo` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `id_valida_zona` int(11) DEFAULT NULL,
  `validacion_zona` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `observacion_zona` longtext COLLATE latin1_general_ci,
  `origen_zona` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion_anula` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario_anula` int(11) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112162 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_salidas_sin_registrar
-- ----------------------------
DROP TABLE IF EXISTS `empleados_salidas_sin_registrar`;
CREATE TABLE `empleados_salidas_sin_registrar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `documento` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_turno` time DEFAULT NULL,
  `fecha_descuento` date DEFAULT NULL,
  `suspension` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_turno` int(11) DEFAULT NULL,
  `hora_descuento` time DEFAULT NULL,
  `observacion_empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion_funcionario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'la observacion de recursos humanos',
  `id_funcionario` int(11) DEFAULT NULL,
  `funcionario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24169 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `empleados_tipo_documento`;
CREATE TABLE `empleados_tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_turnos
-- ----------------------------
DROP TABLE IF EXISTS `empleados_turnos`;
CREATE TABLE `empleados_turnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(15) DEFAULT NULL,
  `cedula` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT '0' COMMENT '''0 --> turno,1 --> Compensatorio,2 --> Incapacidad,3 --> Permiso,4 --> Suspendido''',
  `nombre_tipo` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `codigo_centro_costos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_centro_costos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_pedidos_asignados` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `pedidos_asignados` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_dia` date DEFAULT NULL,
  `dia_siguiente` varchar(2) COLLATE latin1_general_ci DEFAULT 'no',
  `fecha_final` date DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observaciones` longtext COLLATE latin1_general_ci,
  `dominical` varchar(10) COLLATE latin1_general_ci DEFAULT 'false',
  `compensado` varchar(10) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_compensatorio` date DEFAULT NULL,
  `festivo` varchar(10) COLLATE latin1_general_ci DEFAULT 'false',
  `alerta_no_llegada` varchar(5) COLLATE latin1_general_ci DEFAULT 'true' COMMENT 'la alerta de los minutos',
  `notifica_operaciones` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'si ya se envio notificacion a operaciones',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`empleado`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=518444 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_turnos_log
-- ----------------------------
DROP TABLE IF EXISTS `empleados_turnos_log`;
CREATE TABLE `empleados_turnos_log` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_turno` int(15) DEFAULT NULL,
  `id_empleado` int(15) DEFAULT NULL,
  `empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo_turno` tinyint(1) DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `id_usuario` int(15) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(5) DEFAULT NULL,
  `id_sucursal` int(5) DEFAULT NULL,
  `fecha_suceso` datetime DEFAULT NULL,
  `id_pedidos_asignados` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `pedidos_asignados` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=814352 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empleados_upload
-- ----------------------------
DROP TABLE IF EXISTS `empleados_upload`;
CREATE TABLE `empleados_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) DEFAULT NULL,
  `cedula` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ciudad` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono_residencia` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `celular_personal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `correo_personal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `alergico` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `alergico_cual` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `medicamento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `medicamento_cual` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `tipo_documento_nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_pais` int(11) NOT NULL,
  `pais` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `documento` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `responsable` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `sucursales` int(3) NOT NULL DEFAULT '0',
  `region` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `zonas` int(3) DEFAULT NULL,
  `zona_horaria` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  `id_moneda` int(11) DEFAULT NULL,
  `moneda` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `simbolo_moneda` varchar(20) COLLATE latin1_general_ci DEFAULT '',
  `formato_hora` varchar(6) COLLATE latin1_general_ci DEFAULT 'AM/PM',
  `saiopen` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `saiopen_bd` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_erp` int(11) DEFAULT '0',
  `id_empresa_erp` int(11) DEFAULT NULL,
  `ccos_obligatorio` varchar(11) COLLATE latin1_general_ci DEFAULT 'false',
  `vencimiento_cotizacion` int(3) DEFAULT '8',
  `grupo_empresarial` int(11) DEFAULT '1',
  `decimales_moneda` int(10) DEFAULT NULL,
  `id_subdireccion` int(11) DEFAULT NULL,
  `subdireccion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_dir_comercial` int(11) DEFAULT NULL,
  `dir_comercial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_dir_operativo` int(11) DEFAULT NULL,
  `dir_operativo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_dir_financiero` int(11) DEFAULT NULL,
  `dir_financiero` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_dir_compras` int(11) DEFAULT NULL,
  `dir_compras` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_dir_inventario` int(11) DEFAULT NULL,
  `dir_inventario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `correo_compras` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_moneda_compras` int(11) DEFAULT NULL,
  `simbolo_moneda_compras` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `moneda_compras_letras` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_dir_mantenimiento` int(11) DEFAULT NULL,
  `dir_mantenimiento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nit_alfanumerico` varchar(10) COLLATE latin1_general_ci DEFAULT 'false',
  `direccion_principal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono_principal` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `reunion_operativa_global` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `iva_discriminado_cotizaciones` varchar(5) COLLATE latin1_general_ci DEFAULT 'true' COMMENT 'en false solo sale el TOTAL de la cotizacion sin SUBTOTAL Y IVA',
  `validacion_funcionarios_proveedores` varchar(5) COLLATE latin1_general_ci DEFAULT 'true' COMMENT 'la validacion de si es o no un funcionario de plataforma',
  `dominio_email` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas_config_correo
-- ----------------------------
DROP TABLE IF EXISTS `empresas_config_correo`;
CREATE TABLE `empresas_config_correo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `correo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `servidor` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `puerto` int(11) NOT NULL,
  `autenticacion` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `seguridad_smtp` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas_config_correo_copy
-- ----------------------------
DROP TABLE IF EXISTS `empresas_config_correo_copy`;
CREATE TABLE `empresas_config_correo_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `correo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `servidor` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `puerto` int(11) NOT NULL,
  `autenticacion` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `seguridad_smtp` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas_formatos
-- ----------------------------
DROP TABLE IF EXISTS `empresas_formatos`;
CREATE TABLE `empresas_formatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_formato` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `ext_formato` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `carpeta` varchar(10) COLLATE latin1_general_ci DEFAULT 'iso_9001',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_EMPRESA` (`id_empresa`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas_formatos_comercial
-- ----------------------------
DROP TABLE IF EXISTS `empresas_formatos_comercial`;
CREATE TABLE `empresas_formatos_comercial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_formato` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `randomico` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_EMPRESA` (`id_empresa`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas_formatos_roles
-- ----------------------------
DROP TABLE IF EXISTS `empresas_formatos_roles`;
CREATE TABLE `empresas_formatos_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_formato` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `rol` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=643 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas_sucursales
-- ----------------------------
DROP TABLE IF EXISTS `empresas_sucursales`;
CREATE TABLE `empresas_sucursales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `responsable` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `bodegas` int(11) NOT NULL DEFAULT '0',
  `activo` int(1) NOT NULL DEFAULT '1',
  `saiopen_sucursal` varchar(4) COLLATE latin1_general_ci DEFAULT NULL,
  `saiopen_remision` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `saiopen_departamento` int(10) DEFAULT NULL,
  `saiopen_ciudad` int(10) DEFAULT NULL,
  `id_erp` int(11) DEFAULT '0',
  `zona` int(11) DEFAULT NULL,
  `zona_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `reunion_operativa` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_EMPRESA` (`id_empresa`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas_sucursales_bodegas
-- ----------------------------
DROP TABLE IF EXISTS `empresas_sucursales_bodegas`;
CREATE TABLE `empresas_sucursales_bodegas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_erp` int(11) DEFAULT '0',
  `bloqueo_inventario` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'si no esta permitido hacer movimientos de inventario a esta bodega',
  `bloqueo_logistico` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `tipo_bodega` int(1) DEFAULT '0' COMMENT '0 -> Bodega Normal, 1 -> Mantenimiento, 2 -> Dados de Baja',
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_EMPRESA` (`id_empresa`) USING BTREE,
  KEY `ID_SUCURSAL` (`id_sucursal`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=479 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas_sucursales_bodegas_terceros
-- ----------------------------
DROP TABLE IF EXISTS `empresas_sucursales_bodegas_terceros`;
CREATE TABLE `empresas_sucursales_bodegas_terceros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bodega` int(11) DEFAULT NULL,
  `id_tercero` int(11) DEFAULT NULL,
  `nit_tercero` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_tercero` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cod_centro_costo` int(11) DEFAULT NULL,
  `centro_costo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for empresas_sucursales_marcas
-- ----------------------------
DROP TABLE IF EXISTS `empresas_sucursales_marcas`;
CREATE TABLE `empresas_sucursales_marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_EMPRESA` (`id_empresa`) USING BTREE,
  KEY `ID_SUCURSAL` (`id_sucursal`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuesta_log
-- ----------------------------
DROP TABLE IF EXISTS `encuesta_log`;
CREATE TABLE `encuesta_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28380 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuesta_notificacion_usuario
-- ----------------------------
DROP TABLE IF EXISTS `encuesta_notificacion_usuario`;
CREATE TABLE `encuesta_notificacion_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `detalle` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas
-- ----------------------------
DROP TABLE IF EXISTS `encuestas`;
CREATE TABLE `encuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `fondo` blob,
  `touch` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `confirmar` varchar(255) COLLATE latin1_general_ci DEFAULT 'false',
  `consecutivo` int(11) DEFAULT NULL,
  `envio_activo` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_configuraciones_online
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_configuraciones_online`;
CREATE TABLE `encuestas_configuraciones_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) DEFAULT NULL,
  `encabezado` longblob,
  `pie_pagina` longblob,
  `cuerpo_mail` longblob,
  `id_lenguaje` int(11) DEFAULT NULL,
  `titulo_mensaje` longblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_correo_agradecimiento
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_correo_agradecimiento`;
CREATE TABLE `encuestas_correo_agradecimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) DEFAULT NULL,
  `mensaje` longblob,
  `id_lenguaje` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_error_mail
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_error_mail`;
CREATE TABLE `encuestas_error_mail` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `id_encuesta` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `mail` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `otro` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75193 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_estilos
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_estilos`;
CREATE TABLE `encuestas_estilos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fontsize` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fontcolor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fontfamily` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_encuesta` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_lenguajes
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_lenguajes`;
CREATE TABLE `encuestas_lenguajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_encuesta` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `identificacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `mensaje` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `seleccion_idioma` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `siguiente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `atras` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `finalizar` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `bienvenido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `campos_vacios` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `finalizar_confirmar` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=396 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_notificacion_correos
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_notificacion_correos`;
CREATE TABLE `encuestas_notificacion_correos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `confirmar` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=582 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_preguntas
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_preguntas`;
CREATE TABLE `encuestas_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` int(2) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `observacion` varchar(6) COLLATE latin1_general_ci DEFAULT NULL,
  `secuencia` int(2) DEFAULT NULL,
  `pregunta_idi` int(11) DEFAULT NULL,
  `id_lenguaje` int(11) DEFAULT NULL,
  `nombre_lenguaje` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `obligatorio` varchar(6) COLLATE latin1_general_ci DEFAULT 'false',
  `peso` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=775 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_preguntas_detallesX
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_preguntas_detallesX`;
CREATE TABLE `encuestas_preguntas_detallesX` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pregunta` int(11) DEFAULT NULL,
  `detalle` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `notifica` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `lenguaje` int(11) DEFAULT NULL,
  `valores` int(11) DEFAULT NULL,
  `observacion` varchar(6) COLLATE latin1_general_ci DEFAULT NULL,
  `obligatorio` varchar(6) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=694 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_preguntas_detallesY
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_preguntas_detallesY`;
CREATE TABLE `encuestas_preguntas_detallesY` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pregunta` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `detalley` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `lenguaje` int(11) DEFAULT NULL,
  `positivo` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `negativo` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `obligatorio` varchar(7) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion_pregunta` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1272 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_respuestas
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_respuestas`;
CREATE TABLE `encuestas_respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `valor_x` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `respuesta` varchar(5000) COLLATE latin1_general_ci DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `lenguaje_pregunta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`usuario`) USING BTREE,
  KEY `id_pregunta` (`id_pregunta`) USING BTREE,
  KEY `id_encuesta` (`id_encuesta`) USING BTREE,
  KEY `id_encuesta_fecha` (`id_encuesta`,`fecha_creacion`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=959746 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_usuarios`;
CREATE TABLE `encuestas_usuarios` (
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `realizado` int(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `mail` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `habitacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_envio_encuesta` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69291 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for encuestas_usuarios_online
-- ----------------------------
DROP TABLE IF EXISTS `encuestas_usuarios_online`;
CREATE TABLE `encuestas_usuarios_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `mail` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `realizado` int(1) DEFAULT '0',
  `fecha` datetime DEFAULT NULL,
  `zona` int(11) DEFAULT NULL,
  `extra` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `extra2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `debug` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `promedio` double(10,2) DEFAULT NULL,
  `minimo` int(1) DEFAULT NULL,
  `envio_habilitado` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  `extra3` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `usuario` (`usuario`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=87523 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for equipos_log
-- ----------------------------
DROP TABLE IF EXISTS `equipos_log`;
CREATE TABLE `equipos_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_equipo` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_evento` varchar(14) COLLATE latin1_general_ci DEFAULT NULL,
  `hora_evento` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_evento` varchar(1) COLLATE latin1_general_ci DEFAULT NULL,
  `id_pedido` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `pedido` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1183 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for equipos_registro
-- ----------------------------
DROP TABLE IF EXISTS `equipos_registro`;
CREATE TABLE `equipos_registro` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `serial` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` int(2) DEFAULT '0',
  `fecha` datetime DEFAULT NULL,
  `persona_solicita` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `autorizado` int(5) DEFAULT '0',
  `bodega` int(11) DEFAULT NULL,
  `sucursal` int(11) DEFAULT NULL,
  `sucursal_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_usuario` int(5) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_autorizacion` datetime DEFAULT NULL,
  `envio_confirmacion` int(5) DEFAULT '0',
  `ubicacion_gps` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ubicacion_gps_red` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12926 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for formato_relacion_equipos_pedidos
-- ----------------------------
DROP TABLE IF EXISTS `formato_relacion_equipos_pedidos`;
CREATE TABLE `formato_relacion_equipos_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consecutivo` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_salon` int(11) DEFAULT NULL,
  `id_contacto_cliente` int(11) DEFAULT NULL,
  `nombre_contacto_cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `autorizacion_contacto_cliente` int(2) DEFAULT '0',
  `obs_contacto_cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_contacto_cliente` datetime DEFAULT NULL,
  `usuario_contacto_cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `cancelacion_pedido` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Si se cancela todo el pedido',
  `tipo_formato` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4091 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for formato_relacion_equipos_pedidos_items
-- ----------------------------
DROP TABLE IF EXISTS `formato_relacion_equipos_pedidos_items`;
CREATE TABLE `formato_relacion_equipos_pedidos_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_formato` int(11) DEFAULT NULL,
  `id_item_pedido` int(11) DEFAULT NULL,
  `codigo_item` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_item` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `opcion` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `cantidad` int(5) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5935 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for gerencia_turno
-- ----------------------------
DROP TABLE IF EXISTS `gerencia_turno`;
CREATE TABLE `gerencia_turno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` int(1) DEFAULT '0' COMMENT '0 -> matutina   1 -> fin de semana',
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3223 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for historico_equipos
-- ----------------------------
DROP TABLE IF EXISTS `historico_equipos`;
CREATE TABLE `historico_equipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(2) DEFAULT NULL COMMENT '0 -> creacion , 1->traslado , 2-> prestamo, 3->mantenimeinto, 4->reparacion, 5->alquiler, 6-> devolucion prestamo, 7->envio a mantenimiento,8-> retornar de mantenimeinto, 9 -> equipo huerfano, 10-> equipo huerfano restaurado',
  `tipo_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo_user` int(1) DEFAULT NULL COMMENT '0 -> usuario  ,   1 -> Cliente',
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_evento` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` varchar(5000) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1586895 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for informes_listado
-- ----------------------------
DROP TABLE IF EXISTS `informes_listado`;
CREATE TABLE `informes_listado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nombre_html` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `informe` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `tipo_informe` int(11) NOT NULL,
  `clase_informe` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'general',
  `icono` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=299 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_actas_dados_de_baja
-- ----------------------------
DROP TABLE IF EXISTS `inventario_actas_dados_de_baja`;
CREATE TABLE `inventario_actas_dados_de_baja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `nombre_archivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_ciclico
-- ----------------------------
DROP TABLE IF EXISTS `inventario_ciclico`;
CREATE TABLE `inventario_ciclico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega` int(11) NOT NULL,
  `bodega` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '0',
  `activo` int(11) NOT NULL DEFAULT '1',
  `id_usuario_inventario` int(11) NOT NULL,
  `usuario_inventario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio_inventario` time NOT NULL,
  `fecha_final_inventario` date DEFAULT NULL,
  `hora_final_inventario` time NOT NULL,
  `foto_uniforme` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `foto_placa` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `foto_carnet` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `ultima_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15624 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_ciclico_adicionales
-- ----------------------------
DROP TABLE IF EXISTS `inventario_ciclico_adicionales`;
CREATE TABLE `inventario_ciclico_adicionales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario_ciclico` int(11) NOT NULL,
  `concepto` varchar(55) COLLATE latin1_general_ci NOT NULL,
  `nombre_imagen` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `ultima_modificacion` datetime DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_ciclico_items
-- ----------------------------
DROP TABLE IF EXISTS `inventario_ciclico_items`;
CREATE TABLE `inventario_ciclico_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario_ciclico` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `codigo` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `equipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `estado_actual` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ultima_revision` date DEFAULT NULL,
  `foto_equipo1` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `foto_equipo2` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `foto_equipo3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ultima_modificacion` datetime DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `latitud` double(11,8) DEFAULT NULL,
  `longitud` double(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77341 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_consecutivo
-- ----------------------------
DROP TABLE IF EXISTS `inventario_consecutivo`;
CREATE TABLE `inventario_consecutivo` (
  `consecutivo` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_documentos
-- ----------------------------
DROP TABLE IF EXISTS `inventario_documentos`;
CREATE TABLE `inventario_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario_documento` int(11) DEFAULT NULL,
  `nombre_inventario_documento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `document_type` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_inventario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1648 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_estadisticas_uso
-- ----------------------------
DROP TABLE IF EXISTS `inventario_estadisticas_uso`;
CREATE TABLE `inventario_estadisticas_uso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) DEFAULT NULL,
  `codigo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `pedido` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `desde` datetime DEFAULT NULL,
  `hasta` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1124149 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_grupo
-- ----------------------------
DROP TABLE IF EXISTS `inventario_grupo`;
CREATE TABLE `inventario_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_grupo` varchar(2) COLLATE latin1_general_ci NOT NULL,
  `nombre_grupo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `vida_util` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_grupo_subgrupo
-- ----------------------------
DROP TABLE IF EXISTS `inventario_grupo_subgrupo`;
CREATE TABLE `inventario_grupo_subgrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_subgrupo` varchar(2) COLLATE latin1_general_ci NOT NULL,
  `nombre_subgrupo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_novedades
-- ----------------------------
DROP TABLE IF EXISTS `inventario_novedades`;
CREATE TABLE `inventario_novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) DEFAULT NULL,
  `id_concepto` int(11) DEFAULT NULL,
  `cod_concepto` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `concepto` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_prestamos
-- ----------------------------
DROP TABLE IF EXISTS `inventario_prestamos`;
CREATE TABLE `inventario_prestamos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `nombre_equipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `id_empresa_origen` int(11) NOT NULL,
  `nombre_empresa_origen` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_zona_origen` int(11) DEFAULT NULL,
  `id_sucursal_origen` int(11) NOT NULL,
  `nombre_sucursal_origen` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega_origen` int(11) NOT NULL,
  `nombre_bodega_origen` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empresa_destino` int(11) NOT NULL,
  `nombre_empresa_destino` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_zona_destino` int(11) DEFAULT NULL,
  `id_sucursal_destino` int(11) NOT NULL,
  `nombre_sucursal_destino` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega_destino` int(11) NOT NULL,
  `nombre_bodega_destino` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `observaciones` longtext COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `codigo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `prestamos_devolucion` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=188599 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_proceso
-- ----------------------------
DROP TABLE IF EXISTS `inventario_proceso`;
CREATE TABLE `inventario_proceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega` int(11) NOT NULL,
  `bodega` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '0',
  `activo` int(11) NOT NULL DEFAULT '1',
  `id_usuario_inventario` int(11) NOT NULL,
  `usuario_inventario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nombre_usuario_inventario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha_inicio_inventario` date NOT NULL,
  `hora_inicio_inventario` time NOT NULL,
  `fecha_fin_inventario` date NOT NULL,
  `hora_fin_inventario` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_proceso_items
-- ----------------------------
DROP TABLE IF EXISTS `inventario_proceso_items`;
CREATE TABLE `inventario_proceso_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario_proceso` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `codigo` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `equipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `inventariado` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `prestado` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `es_prestado` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41064 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_proceso_items_out
-- ----------------------------
DROP TABLE IF EXISTS `inventario_proceso_items_out`;
CREATE TABLE `inventario_proceso_items_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario_proceso` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `codigo` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `equipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega` int(11) NOT NULL,
  `bodega` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `pertenece_inventario_global` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `prestado` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `es_prestado` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa_prestamo` int(11) DEFAULT NULL,
  `empresa_prestamo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal_prestamo` int(11) DEFAULT NULL,
  `sucursal_prestamo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_bodega_prestamo` int(11) DEFAULT NULL,
  `bodega_prestamo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3029 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventario_traslados
-- ----------------------------
DROP TABLE IF EXISTS `inventario_traslados`;
CREATE TABLE `inventario_traslados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `nombre_equipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_empresa_origen` int(11) NOT NULL,
  `nombre_empresa_origen` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_zona_origen` int(11) DEFAULT NULL,
  `id_sucursal_origen` int(11) NOT NULL,
  `nombre_sucursal_origen` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega_origen` int(11) NOT NULL,
  `nombre_bodega_origen` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empresa_destino` int(11) NOT NULL,
  `nombre_empresa_destino` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_zona_destino` int(11) DEFAULT NULL,
  `id_sucursal_destino` int(11) NOT NULL,
  `nombre_sucursal_destino` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega_destino` int(11) NOT NULL,
  `nombre_bodega_destino` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `observaciones` longtext COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `codigo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=33479 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for inventarios
-- ----------------------------
DROP TABLE IF EXISTS `inventarios`;
CREATE TABLE `inventarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `codigoold` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `zona` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `id_ubicacion` int(11) NOT NULL,
  `ubicacion` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `unidad` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `id_grupo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `grupo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `cod_grupo` int(2) NOT NULL,
  `id_subgrupo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `id_subgrupo2` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `subgrupo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `cod_subgrupo` int(2) NOT NULL,
  `id_centro_costos` int(11) NOT NULL,
  `centro_costos` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nombre_equipo` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `vida_util` int(11) NOT NULL,
  `asignado_a` int(11) NOT NULL,
  `asignado_a_nombre` varchar(80) COLLATE latin1_general_ci DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `nit_proveedor` int(11) DEFAULT NULL,
  `proveedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tenencia` int(1) DEFAULT NULL COMMENT '0->PROPIA,1->LEASING FINANCIERO,2->LEASING OPERATIVO',
  `fecha_creacion_en_inventario` date DEFAULT NULL,
  `fecha_vencimiento_tenencia` date DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `fecha_vencimiento_garantia` date DEFAULT NULL,
  `marca` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `modelo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `serie` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `color` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `numero_piezas` int(11) NOT NULL,
  `descripcion1` text COLLATE latin1_general_ci NOT NULL,
  `descripcion2` text COLLATE latin1_general_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `quien_elimino` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `factura` mediumblob NOT NULL,
  `costos` int(11) NOT NULL,
  `documento_contable` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `numero_documento` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `id_checklist` int(11) NOT NULL DEFAULT '1',
  `checklist` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ultimo_mantenimiento` datetime NOT NULL,
  `ultima_reparacion` datetime NOT NULL,
  `prestado` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `id_empresa_prestamo` int(11) NOT NULL,
  `empresa_prestamo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_zona_prestamo` int(11) DEFAULT NULL,
  `zona_prestamo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal_prestamo` int(11) NOT NULL,
  `sucursal_prestamo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega_prestamo` int(11) NOT NULL,
  `bodega_prestamo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha_movimiento_prestamo` date DEFAULT NULL,
  `observaciones_eliminacion` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha_elimino` datetime DEFAULT NULL,
  `usuario_elimino` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_usuario_elimino` int(11) NOT NULL,
  `id_usuario_encargado` int(11) NOT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `nombre_usuario_encargado` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha_asignacion_usuario` date DEFAULT NULL,
  `hora_asignacion_usuario` time DEFAULT NULL,
  `siip3` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `estado_equipo` int(1) DEFAULT '0' COMMENT '0->bodega, 1->evento, 2->mantenimiento, 3->huerfano',
  `estado_mantenimiento` int(1) DEFAULT '0',
  `id_cliente` int(11) DEFAULT NULL,
  `id_documento` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `uso` int(1) DEFAULT '0' COMMENT '0 -> flotante, 1 -> fijo,2 -> Adicional',
  `localizacion` varchar(255) COLLATE latin1_general_ci DEFAULT '' COMMENT '''localizacion interna del equipo en la bodega''',
  `fisico` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `dado_baja` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Equipo dado de baja',
  `fecha_dado_baja` date DEFAULT NULL,
  `usuario_dado_baja` int(11) DEFAULT NULL,
  `id_ubicacion_baja` int(11) DEFAULT NULL COMMENT 'id ubicacion equipos dados de baja',
  `ubicacion_baja` varchar(255) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'ubicacion equipos dados de baja',
  `inventario_logical_signage` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `inventario_asiste` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_area` int(11) DEFAULT NULL,
  `area` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_novedad` int(11) DEFAULT NULL,
  `cod_novedad` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `ciclico` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `CODIGO` (`codigo`) USING BTREE,
  KEY `ID_EMPRESA` (`id_empresa`) USING BTREE,
  KEY `ID_UBICACION` (`id_ubicacion`) USING BTREE,
  KEY `ID_SUCURSAL` (`id_sucursal`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=70439 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_items_general` int(11) DEFAULT NULL,
  `codigo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `sinc_erp` varchar(255) COLLATE latin1_general_ci DEFAULT 'false',
  `id_impuesto_erp` int(11) DEFAULT '0',
  `impuesto` double(11,2) DEFAULT NULL,
  `valor` double(11,2) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `obs_comercial` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `obs_logistica` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `obs_proveedores` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `codigo_centro_costo` varchar(20) COLLATE latin1_general_ci DEFAULT '',
  `centro_costo` varchar(20) COLLATE latin1_general_ci DEFAULT '',
  `activo` int(2) DEFAULT '1',
  `ganancia` double(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3599 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for items_familia
-- ----------------------------
DROP TABLE IF EXISTS `items_familia`;
CREATE TABLE `items_familia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for items_familia_grupo
-- ----------------------------
DROP TABLE IF EXISTS `items_familia_grupo`;
CREATE TABLE `items_familia_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_familia` int(2) DEFAULT NULL,
  `cod_familia` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `familia` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `codigo` varchar(2) COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for items_familia_grupo_subgrupo
-- ----------------------------
DROP TABLE IF EXISTS `items_familia_grupo_subgrupo`;
CREATE TABLE `items_familia_grupo_subgrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_familia` int(2) DEFAULT NULL,
  `cod_familia` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `familia` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_grupo` int(2) NOT NULL,
  `cod_grupo` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `grupo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `codigo` varchar(2) COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=256 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for items_general
-- ----------------------------
DROP TABLE IF EXISTS `items_general`;
CREATE TABLE `items_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_familia` int(2) DEFAULT NULL,
  `familia` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_grupo` int(2) DEFAULT NULL,
  `grupo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_subgrupo` int(2) DEFAULT NULL,
  `subgrupo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tiempo_preparacion` int(2) DEFAULT '0' COMMENT 'tiempo de preparacion del servicio',
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=761 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for licencia_soporte
-- ----------------------------
DROP TABLE IF EXISTS `licencia_soporte`;
CREATE TABLE `licencia_soporte` (
  `id_unico` int(11) NOT NULL,
  `autorizado` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_unico`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `user` int(11) NOT NULL,
  `username` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `log` varchar(5000) COLLATE latin1_general_ci NOT NULL,
  `modulo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=593199 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for log_encuentas_corporativas
-- ----------------------------
DROP TABLE IF EXISTS `log_encuentas_corporativas`;
CREATE TABLE `log_encuentas_corporativas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_funcionario` varchar(250) DEFAULT NULL,
  `estado` int(2) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `numero_documento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3198 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for log_error_remision_saiopen
-- ----------------------------
DROP TABLE IF EXISTS `log_error_remision_saiopen`;
CREATE TABLE `log_error_remision_saiopen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `log` longtext COLLATE latin1_general_ci,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for log_inventario_ciclico_boot
-- ----------------------------
DROP TABLE IF EXISTS `log_inventario_ciclico_boot`;
CREATE TABLE `log_inventario_ciclico_boot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_bodega` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `mes_ciclicos` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for logistico_vehiculos
-- ----------------------------
DROP TABLE IF EXISTS `logistico_vehiculos`;
CREATE TABLE `logistico_vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `vehiculo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `marca` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `placa` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_servicio` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_vehiculo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `documento_soat` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_venc_soat` date DEFAULT NULL,
  `documento_tecno` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_venc_tecno` date DEFAULT NULL,
  `aseguradora_todo_riesgo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'poliza todo riesgo',
  `documento_poliza` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_poliza` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `venc_todo_riesgo` date DEFAULT NULL,
  `documento_propiedad` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `id_conductor` int(11) DEFAULT NULL,
  `conductor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `documento_licencia` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `venc_licencia` date DEFAULT NULL,
  `kilometraje` int(11) DEFAULT NULL,
  `documento_mantenimiento` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_mantenimiento` date DEFAULT NULL,
  `observaciones` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `usuario_elimino` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_elimino` datetime DEFAULT NULL,
  `fecha_recarga_extintor` date DEFAULT NULL,
  `fecha_vencimiento_extintor` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for logs_mysql
-- ----------------------------
DROP TABLE IF EXISTS `logs_mysql`;
CREATE TABLE `logs_mysql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tabla` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `campo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_registro` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` varchar(6) COLLATE latin1_general_ci DEFAULT NULL,
  `oldData` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `newData` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28005 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for mantenimiento
-- ----------------------------
DROP TABLE IF EXISTS `mantenimiento`;
CREATE TABLE `mantenimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nombre_usuario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_inventario` int(50) NOT NULL,
  `equipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_empresa` int(50) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(50) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega` int(50) NOT NULL,
  `bodega` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha_mantenimiento` date NOT NULL,
  `fecha_hora_mantenimiento` datetime NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `cod_equipo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2090 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for mantenimiento_datos
-- ----------------------------
DROP TABLE IF EXISTS `mantenimiento_datos`;
CREATE TABLE `mantenimiento_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mantenimiento` int(11) NOT NULL,
  `id_checklist` int(11) NOT NULL,
  `dato` varchar(1500) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `checklist` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_checklist_detalle` int(11) NOT NULL,
  `checklist_detalle` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4727 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for meet
-- ----------------------------
DROP TABLE IF EXISTS `meet`;
CREATE TABLE `meet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `sala` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `fechai` date NOT NULL,
  `horai` time NOT NULL,
  `invitados` varchar(0) COLLATE latin1_general_ci DEFAULT NULL,
  `privada` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `sala_espera` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `ini_mic_off` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `ini_cam_off` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `part_ini_mic` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `part_ini_cam` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `activo` smallint(1) NOT NULL DEFAULT '1' COMMENT '1: activo 0: inactivo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=297 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for meet_config
-- ----------------------------
DROP TABLE IF EXISTS `meet_config`;
CREATE TABLE `meet_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_actual` int(11) DEFAULT NULL,
  `plan_actual_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fechai` date DEFAULT NULL,
  `fechaf` date DEFAULT NULL,
  `promo_10_dias` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT 'false',
  `promoi` date DEFAULT NULL,
  `promof` date DEFAULT NULL,
  `num_reuniones` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for meet_suscripcion
-- ----------------------------
DROP TABLE IF EXISTS `meet_suscripcion`;
CREATE TABLE `meet_suscripcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan` int(11) DEFAULT NULL,
  `plan_nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fechai` date DEFAULT NULL,
  `fechaf` date DEFAULT NULL,
  `usuario_activa_id` int(11) DEFAULT NULL,
  `usuario_activa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL COMMENT '1-> automatica ,   2->manual',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for modulos
-- ----------------------------
DROP TABLE IF EXISTS `modulos`;
CREATE TABLE `modulos` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `icono26` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `icono44` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `ejecuta` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `pasar_variables` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  `escritorio` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  `inicio` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  `winopen` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'No abre ventana, realiza windows open por fuera de la aplicacion',
  `ancho` int(10) NOT NULL DEFAULT '0',
  `alto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for movil_sinc_contactos
-- ----------------------------
DROP TABLE IF EXISTS `movil_sinc_contactos`;
CREATE TABLE `movil_sinc_contactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consecutivo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido
-- ----------------------------
DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `id` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `codigo_documento` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `revision` int(11) DEFAULT '0',
  `remision_saiopen` mediumint(5) unsigned DEFAULT NULL,
  `nombre_evento` text COLLATE latin1_general_ci,
  `fecha_documento` date DEFAULT NULL,
  `hora_documento` time DEFAULT NULL,
  `consecutivo_cotizacion` int(11) unsigned DEFAULT NULL,
  `consecutivo_pedido` int(11) unsigned DEFAULT NULL,
  `estado` int(1) NOT NULL DEFAULT '0',
  `estado_pedido` int(1) NOT NULL DEFAULT '0',
  `tipo` int(11) NOT NULL DEFAULT '1',
  `id_empresa` mediumint(3) unsigned NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_zona` mediumint(3) DEFAULT NULL,
  `zona` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` mediumint(5) unsigned NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_bodega` mediumint(5) unsigned NOT NULL,
  `bodega` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empleado` mediumint(5) unsigned NOT NULL,
  `empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_cliente` mediumint(5) unsigned NOT NULL,
  `nombre_cliente` tinytext COLLATE latin1_general_ci,
  `nombre_comercial` tinytext COLLATE latin1_general_ci,
  `direccion_cliente` tinytext COLLATE latin1_general_ci,
  `telefono_cliente` tinytext COLLATE latin1_general_ci,
  `id_terceros_direcciones` mediumint(11) unsigned DEFAULT NULL,
  `tipo_identificacion` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `identificacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_contacto` mediumint(5) unsigned DEFAULT NULL,
  `contacto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `contacto_cargo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `contacto_email` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_area` int(10) DEFAULT NULL,
  `nombre_area` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_entrega_instalacion` date DEFAULT NULL,
  `hora_entrega_instalacion` time DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `hora_final` time DEFAULT NULL,
  `direccion_despacho` tinytext COLLATE latin1_general_ci,
  `direccion_recogida` tinytext COLLATE latin1_general_ci,
  `estado_orden_compra` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_forma_pago` int(11) DEFAULT NULL,
  `forma_pago` text COLLATE latin1_general_ci,
  `observacion_comercial` text COLLATE latin1_general_ci,
  `observacion_logistica` text COLLATE latin1_general_ci,
  `observacion_facturacion` text COLLATE latin1_general_ci,
  `id_formato_cotizacion` int(11) DEFAULT NULL,
  `formato_cotizacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  `id_vendedor` int(11) DEFAULT NULL,
  `vendedor` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_proyecto` int(11) DEFAULT NULL,
  `proyecto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_responsable` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `id_actividad` int(11) DEFAULT NULL,
  `actividad` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion_cliente` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion_recojida` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `simbolo_moneda` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `moneda_base` int(255) DEFAULT NULL,
  `moneda_documento` int(255) DEFAULT NULL,
  `trm` float DEFAULT NULL COMMENT '''tasa representativa de la moneda''',
  `total_dia` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  `total_general` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  `marca` int(11) DEFAULT NULL,
  `remision_sai` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `change_update` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `vencimiento_cotizacion` date DEFAULT NULL,
  `fecha_cotizacion` date DEFAULT NULL,
  `hora_cotizacion` time DEFAULT NULL,
  `tipo_evento` int(1) DEFAULT '0' COMMENT '0->normal, 1->interno, 2->cortesia,3->montaje',
  `acta_video` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `acta_video_` varchar(2) COLLATE latin1_general_ci DEFAULT 'No',
  `id_remision_erp` int(11) unsigned DEFAULT NULL,
  `numero_remision_erp` int(11) unsigned DEFAULT NULL,
  `factura_erp` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `numero_factura_erp` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `nota_devolucion` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `acta_video_subida` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `codigo_centro_costos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_centro_costos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_documento` tinyint(1) DEFAULT '0' COMMENT 'campo para saber si el documento es un pedido(0) o es adicional(1)',
  `id_pedido_adicional` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `cod_pedido_adicional` varchar(20) COLLATE latin1_general_ci DEFAULT '',
  `upload_remision` varchar(10) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'si se ha subido la remision',
  `clase_evento` tinyint(1) DEFAULT '0' COMMENT '0 -> corporativo, 1 -> Social',
  `tipo_asistencia` tinyint(1) DEFAULT '0' COMMENT '0 -> Presencial, 1 -> Virtual, 2 -> Hibirido',
  `numero_asistentes` int(10) DEFAULT NULL,
  `id_pedido_principal` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `pedido_principal` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `orden_cancelacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'La orden de cancelacion del evento en caso de que este se cancele',
  `solicitud_oc_destiempo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `pedido_destiempo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `obs_pedido_destiempo` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `solicitud_cancelacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'si se solicito cancelacion para el pedido',
  `estado_solicitud_cancelacion` tinyint(2) DEFAULT '0',
  `bloqueo_logistico` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'Esto con el fin de que no se pueda ver en logistico para que lo despachen',
  `clear_fechas` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `opgranevento` int(1) DEFAULT NULL,
  `valor_gran` int(10) DEFAULT NULL,
  `link_encuesta_corporativa` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `event_corp` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `envio_encuesta_corpotariva` int(2) DEFAULT NULL,
  `fecha_envio_encuesta_corp` datetime DEFAULT NULL,
  `fecha_envio_encuenta_corp_email` datetime DEFAULT NULL,
  `generado` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `id_cliente_final` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `id_evento_existente` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `OpCorporativo` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `brief` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_EMPRESA` (`id_empresa`) USING BTREE,
  KEY `ID_SUCURSAL` (`id_sucursal`) USING BTREE,
  KEY `ID_BODEGA` (`id_bodega`) USING BTREE,
  KEY `ESTADO` (`estado`) USING BTREE,
  KEY `ESTADO_PEDIDO` (`estado_pedido`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_actas_video
-- ----------------------------
DROP TABLE IF EXISTS `pedido_actas_video`;
CREATE TABLE `pedido_actas_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `consecutivo` int(11) DEFAULT NULL,
  `nombre_orden` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3132 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_consecutivo
-- ----------------------------
DROP TABLE IF EXISTS `pedido_consecutivo`;
CREATE TABLE `pedido_consecutivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `consecutivo` int(20) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_sucursal`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_destiempos_excusas
-- ----------------------------
DROP TABLE IF EXISTS `pedido_destiempos_excusas`;
CREATE TABLE `pedido_destiempos_excusas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `consecutivo` int(11) DEFAULT NULL,
  `nombre_excusa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=686 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_destiempos_requisicion
-- ----------------------------
DROP TABLE IF EXISTS `pedido_destiempos_requisicion`;
CREATE TABLE `pedido_destiempos_requisicion` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `codigo_pedido` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(15) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(15) DEFAULT NULL,
  `id_sucursal` int(15) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `concepto` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_pedido` tinyint(1) DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `fecha` datetime DEFAULT NULL,
  `aprobado` varchar(3) COLLATE latin1_general_ci DEFAULT '',
  `id_usuario_verifica` int(15) DEFAULT NULL,
  `usuario_verifica` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion_verifica` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_verifica` datetime DEFAULT NULL,
  `consecutivo_maestro` int(15) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4973 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_dias
-- ----------------------------
DROP TABLE IF EXISTS `pedido_dias`;
CREATE TABLE `pedido_dias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_intercambio` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `propiedad` int(11) DEFAULT '0',
  `id_pedido` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `id_dia` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1031844 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_eliminado
-- ----------------------------
DROP TABLE IF EXISTS `pedido_eliminado`;
CREATE TABLE `pedido_eliminado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` int(1) DEFAULT '0',
  `observacion` varchar(300) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_documento` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15930 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_equipo
-- ----------------------------
DROP TABLE IF EXISTS `pedido_equipo`;
CREATE TABLE `pedido_equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `id_inventario` int(11) DEFAULT NULL,
  `codigo_inventario` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_equipo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_instalacion` date DEFAULT NULL,
  `hora_instalacion` time DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `guarda_estadisticas_uso` varchar(20) COLLATE latin1_general_ci DEFAULT '0',
  `estado` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=971567 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_eventos_operarios_conductores
-- ----------------------------
DROP TABLE IF EXISTS `pedido_eventos_operarios_conductores`;
CREATE TABLE `pedido_eventos_operarios_conductores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` varchar(5) COLLATE latin1_general_ci NOT NULL COMMENT '1->operario  2->Conductor entrega 3->Conductor recoge 4 -> Relevo',
  `codigo_documento` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_evento` tinytext COLLATE latin1_general_ci,
  `id_direccion_tercero` int(11) DEFAULT NULL,
  `nombre_comercial` tinytext COLLATE latin1_general_ci,
  `fecha_inicio` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `hora_final` time DEFAULT NULL,
  `id_empleado` mediumint(5) DEFAULT NULL,
  `empleado` tinytext COLLATE latin1_general_ci,
  `codigo_centro_costos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_centro_costos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `hora_entrega_instalacion` time DEFAULT NULL,
  `fecha_suceso` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2064782 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_firma
-- ----------------------------
DROP TABLE IF EXISTS `pedido_firma`;
CREATE TABLE `pedido_firma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `firma` blob,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cedula` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_log
-- ----------------------------
DROP TABLE IF EXISTS `pedido_log`;
CREATE TABLE `pedido_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado_general` int(11) DEFAULT NULL,
  `estado_pedido` int(11) DEFAULT NULL,
  `usuario` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `accion` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3478512 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_logistico
-- ----------------------------
DROP TABLE IF EXISTS `pedido_logistico`;
CREATE TABLE `pedido_logistico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `estado_pedido` int(1) DEFAULT NULL,
  `fecha_programado` date DEFAULT NULL,
  `hora_programado` time DEFAULT NULL,
  `id_usuario_programo` int(11) DEFAULT NULL,
  `usuario_programo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_vehiculo_envio` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `vehiculo_envio` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `id_conductor_envio` int(11) DEFAULT NULL,
  `conductor_envio` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_despacho` date DEFAULT NULL,
  `hora_despacho` time DEFAULT NULL,
  `despacho_atiempo` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario_despacho` int(11) DEFAULT NULL,
  `usuario_despacho` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `hora_entrega` time DEFAULT NULL,
  `entrega_atiempo` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario_entrega` int(11) DEFAULT NULL,
  `usuario_entrega` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_servicio_activo` date DEFAULT NULL,
  `hora_servicio_activo` time DEFAULT NULL,
  `id_usuario_servicio_activo` int(11) NOT NULL,
  `usuario_servicio_activo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_vehiculo_por_recogida` int(11) DEFAULT NULL,
  `vehiculo_por_recogida` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_conductor_por_recogida` int(11) DEFAULT NULL,
  `conductor_por_recogida` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_por_recogida` date DEFAULT NULL,
  `hora_por_recogida` time DEFAULT NULL,
  `id_usuario_por_recogida` int(11) DEFAULT NULL,
  `usuario_por_recogida` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_recogida` date DEFAULT NULL,
  `hora_recogida` time DEFAULT NULL,
  `id_usuario_entrar_bodega` int(11) DEFAULT NULL,
  `usuario_entrar_bodega` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_entrar_bodega` date DEFAULT NULL,
  `hora_entrar_bodega` time DEFAULT NULL,
  `change_update` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=667845 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_logistico_operarios
-- ----------------------------
DROP TABLE IF EXISTS `pedido_logistico_operarios`;
CREATE TABLE `pedido_logistico_operarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `hora_entrega_instalacion` time DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_final` time DEFAULT NULL,
  `codigo_centro_costos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_centro_costos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `nombre_empleado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `changeupdate` int(8) DEFAULT NULL,
  `fecha_suceso` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=808889 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_novedades
-- ----------------------------
DROP TABLE IF EXISTS `pedido_novedades`;
CREATE TABLE `pedido_novedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `id_equipo` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_novedades_eventos
-- ----------------------------
DROP TABLE IF EXISTS `pedido_novedades_eventos`;
CREATE TABLE `pedido_novedades_eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `consecutivo` int(11) DEFAULT NULL,
  `consecutivo_completo` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `id_usuario` int(11) DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` int(1) DEFAULT '0' COMMENT '0->abierta,1->cerrado',
  `pqrs` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `obs_finalizacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_finalizacion` datetime DEFAULT NULL,
  `usuario_finalizacion` int(11) DEFAULT NULL,
  `fecha_novedad` datetime DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=531 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_novedades_eventos_seguimientos
-- ----------------------------
DROP TABLE IF EXISTS `pedido_novedades_eventos_seguimientos`;
CREATE TABLE `pedido_novedades_eventos_seguimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_novedad` int(11) DEFAULT NULL,
  `estado` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_orden
-- ----------------------------
DROP TABLE IF EXISTS `pedido_orden`;
CREATE TABLE `pedido_orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `consecutivo` int(11) DEFAULT NULL,
  `nombre_orden` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `fecha_hora_real` datetime DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=700790 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_ordenes_cancelacion
-- ----------------------------
DROP TABLE IF EXISTS `pedido_ordenes_cancelacion`;
CREATE TABLE `pedido_ordenes_cancelacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `consecutivo` int(11) DEFAULT NULL,
  `nombre_orden` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8105 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_remision
-- ----------------------------
DROP TABLE IF EXISTS `pedido_remision`;
CREATE TABLE `pedido_remision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `consecutivo` int(11) DEFAULT NULL,
  `nombre_remision` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `fecha_hora_real` datetime DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32426 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_requerimientos
-- ----------------------------
DROP TABLE IF EXISTS `pedido_requerimientos`;
CREATE TABLE `pedido_requerimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `id_intercambio` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `id_items` int(11) DEFAULT NULL,
  `codigo_items` varchar(30) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_items` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_pedido_dias` int(11) DEFAULT NULL,
  `id_dia` date DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `cantidad` int(10) DEFAULT '0',
  `valor_unitario` double(11,2) DEFAULT '0.00',
  `descuento` double(11,2) DEFAULT '0.00',
  `tipo_descuento` varchar(1) COLLATE latin1_general_ci DEFAULT NULL,
  `valor_descuento` double(11,2) DEFAULT NULL,
  `liquida_impuesto` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  `impuesto` double(11,2) DEFAULT NULL,
  `valor_impuesto` double(11,2) DEFAULT NULL,
  `Subtotal_Con_Descuento` double(20,2) DEFAULT NULL,
  `Subtotal_Sin_Descuento` double(20,2) DEFAULT NULL,
  `obs_comercial` longtext COLLATE latin1_general_ci,
  `obs_logistica` longtext COLLATE latin1_general_ci,
  `requiere_obs_tecnica` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `obs_tecnica` longtext COLLATE latin1_general_ci,
  `change_update` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `total` double(11,0) DEFAULT NULL,
  `orden` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_EMPRESA` (`id_empresa`) USING BTREE,
  KEY `ID_PEDIDO` (`id_intercambio`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2171036 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_solicitudes_cancelacion
-- ----------------------------
DROP TABLE IF EXISTS `pedido_solicitudes_cancelacion`;
CREATE TABLE `pedido_solicitudes_cancelacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `cod_pedido` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_solicitante` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `obs_solicitante` longtext COLLATE latin1_general_ci,
  `id_solicitante` int(11) DEFAULT NULL,
  `fecha_director_comercial` datetime DEFAULT NULL,
  `id_director_comercial` int(11) DEFAULT NULL,
  `obs_director_comercial` longtext COLLATE latin1_general_ci,
  `estado` tinyint(2) DEFAULT '0',
  `fecha_director_operaciones` datetime DEFAULT NULL,
  `id_director_operaciones` int(11) DEFAULT NULL,
  `obs_director_operaciones` longtext COLLATE latin1_general_ci,
  `fecha_director_zona` datetime DEFAULT NULL,
  `id_director_zona` int(11) DEFAULT NULL,
  `obs_director_zona` longtext COLLATE latin1_general_ci,
  `fecha_director_operativo` datetime DEFAULT NULL,
  `id_director_operativo` int(11) DEFAULT NULL,
  `obs_director_operativo` longtext COLLATE latin1_general_ci,
  `consecutivos_oc` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'0',
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `tipo_pedido` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_solicitudes_cancelacion_anexos
-- ----------------------------
DROP TABLE IF EXISTS `pedido_solicitudes_cancelacion_anexos`;
CREATE TABLE `pedido_solicitudes_cancelacion_anexos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `consecutivo` int(11) DEFAULT NULL,
  `nombre_excusa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_pedido`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pedido_solicitudes_cancelacion_seguimientos
-- ----------------------------
DROP TABLE IF EXISTS `pedido_solicitudes_cancelacion_seguimientos`;
CREATE TABLE `pedido_solicitudes_cancelacion_seguimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for pendiente_aprobacion
-- ----------------------------
DROP TABLE IF EXISTS `pendiente_aprobacion`;
CREATE TABLE `pendiente_aprobacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_intercambio` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `descuento` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `aprobacion` tinyint(1) DEFAULT '0',
  `codigo_item` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nom_item` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `precio` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for propiedades
-- ----------------------------
DROP TABLE IF EXISTS `propiedades`;
CREATE TABLE `propiedades` (
  `id_propiedades` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET latin1 NOT NULL,
  `activo` int(1) NOT NULL,
  PRIMARY KEY (`id_propiedades`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for prueba
-- ----------------------------
DROP TABLE IF EXISTS `prueba`;
CREATE TABLE `prueba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `dato1` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `dato2` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `dato3` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for prueba_check_list
-- ----------------------------
DROP TABLE IF EXISTS `prueba_check_list`;
CREATE TABLE `prueba_check_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cruce` varchar(100) NOT NULL,
  `hotel_evento` varchar(100) DEFAULT NULL,
  `nombre_evento` varchar(200) DEFAULT NULL,
  `fecha_mon` timestamp NULL DEFAULT NULL,
  `conductor_asig` varchar(200) DEFAULT NULL,
  `tecnico_mon` varchar(200) DEFAULT NULL,
  `observacion_event` varchar(500) DEFAULT NULL,
  `fecha_prueba` date DEFAULT NULL,
  `hora_inicio_prueba` time DEFAULT NULL,
  `hora_fin_prueba` time DEFAULT NULL,
  `firma_cliente` mediumtext,
  `firma_funcionario` mediumtext,
  `nombre_funcionario` varchar(200) DEFAULT NULL,
  `nombre_cliente` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1057 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reparacion
-- ----------------------------
DROP TABLE IF EXISTS `reparacion`;
CREATE TABLE `reparacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `fecha_reparacion` date NOT NULL,
  `quien_reparo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `observaciones_reparacion` varchar(1000) COLLATE latin1_general_ci NOT NULL,
  `insumos` varchar(1000) COLLATE latin1_general_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_bodega` int(11) NOT NULL,
  `bodega` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `cod_equipo` int(11) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `equipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=546 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for resultados_encuestas_corporativas
-- ----------------------------
DROP TABLE IF EXISTS `resultados_encuestas_corporativas`;
CREATE TABLE `resultados_encuestas_corporativas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `empresa` varchar(250) DEFAULT NULL,
  `cargo` varchar(250) DEFAULT NULL,
  `id_pedido` varchar(100) DEFAULT NULL,
  `pregunta` varchar(240) DEFAULT NULL,
  `opcion` varchar(250) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `fecha_encuesta` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reunion_coope
-- ----------------------------
DROP TABLE IF EXISTS `reunion_coope`;
CREATE TABLE `reunion_coope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_configuracion_reunion_coope` int(11) NOT NULL,
  `id_configuracion_reunion_coope_checklist` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `fecha` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16611 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_coope_datos
-- ----------------------------
DROP TABLE IF EXISTS `reunion_coope_datos`;
CREATE TABLE `reunion_coope_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_reunion_coope` int(11) NOT NULL,
  `id_checklist` int(11) NOT NULL,
  `dato_boleano` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `dato_area` varchar(2500) COLLATE latin1_general_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `checklist` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_checklist_detalle` int(11) NOT NULL,
  `checklist_detalle` varchar(1500) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=413392 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa`;
CREATE TABLE `reunion_operativa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `empresa` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `sucursal` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `fecha` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `json_preguntas` blob,
  `json_pedidos` blob,
  `json_respuestas` blob,
  `json_asistentes` blob,
  `json_preguntas_inventario` blob,
  `json_ccos_inventario` blob,
  `json_respuestas_inventario` blob,
  `activo` int(11) NOT NULL DEFAULT '1',
  `estado` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41272 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reunion_operativa_alertas_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_alertas_usuarios`;
CREATE TABLE `reunion_operativa_alertas_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa_alertas_usuarios_sucursales
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_alertas_usuarios_sucursales`;
CREATE TABLE `reunion_operativa_alertas_usuarios_sucursales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=609 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa_inventario_preguntas
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_inventario_preguntas`;
CREATE TABLE `reunion_operativa_inventario_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `alerta_donde` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa_log
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_log`;
CREATE TABLE `reunion_operativa_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_reunion` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `accion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa_personas
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_personas`;
CREATE TABLE `reunion_operativa_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_actividad` int(11) DEFAULT NULL,
  `id_asignado` int(11) DEFAULT NULL,
  `asignado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa_preguntas
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_preguntas`;
CREATE TABLE `reunion_operativa_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_maestro` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `alerta_donde` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion_donde` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `subpreguntas` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `clase_pregunta` tinyint(2) DEFAULT NULL COMMENT '0->Operacion,1->Proveedor,2->Control',
  `validacion_items` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=559 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa_preguntas_items
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_preguntas_items`;
CREATE TABLE `reunion_operativa_preguntas_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_item_general` int(11) DEFAULT NULL,
  `codigo_item_general` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_item_general` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1061 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa_preguntas_maestro
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_preguntas_maestro`;
CREATE TABLE `reunion_operativa_preguntas_maestro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa_subpreguntas
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_subpreguntas`;
CREATE TABLE `reunion_operativa_subpreguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_maestro` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `obligatorio` varchar(5) COLLATE latin1_general_ci DEFAULT 'true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for reunion_operativa_subpreguntas_respuestas
-- ----------------------------
DROP TABLE IF EXISTS `reunion_operativa_subpreguntas_respuestas`;
CREATE TABLE `reunion_operativa_subpreguntas_respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pregunta` int(11) DEFAULT NULL,
  `id_pedido` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_reunion` int(11) DEFAULT NULL,
  `jsonRespuestas` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for rpedido
-- ----------------------------
DROP TABLE IF EXISTS `rpedido`;
CREATE TABLE `rpedido` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `randomico` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `id_pedido` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `cod_pedido` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `estado_documento` int(1) DEFAULT NULL,
  `estado_revision` bit(1) DEFAULT b'0',
  `activo` bit(1) DEFAULT b'1',
  `json_documento` blob,
  `json_items` blob,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(15) DEFAULT NULL,
  `id_sucursal` int(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `revision` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1465717 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for rpedido_log
-- ----------------------------
DROP TABLE IF EXISTS `rpedido_log`;
CREATE TABLE `rpedido_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_revision` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `accion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cambios` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=447984 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for Sheet1
-- ----------------------------
DROP TABLE IF EXISTS `Sheet1`;
CREATE TABLE `Sheet1` (
  `id` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `documento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `salario_base` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `salario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `F` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `G` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `H` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `I` varchar(255) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for solicitudes
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes`;
CREATE TABLE `solicitudes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tipo` tinyint(1) NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `solicitante` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `cedula` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombres` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ciudad` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `galeon` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `siip` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `comercial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `logistico` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `administrativo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `financiero` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `gerencial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `multiciudad` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `accion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `razon` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `propiedad` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for solicitudes_estado_documentos_erp
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes_estado_documentos_erp`;
CREATE TABLE `solicitudes_estado_documentos_erp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consecutivo` int(11) DEFAULT NULL,
  `estado` int(2) DEFAULT '0',
  `id_tipo_solicitud` int(11) DEFAULT NULL,
  `tipo_solicitud` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_formato_relacion` int(11) DEFAULT NULL,
  `consecutivo_formato_relacion` int(11) DEFAULT NULL,
  `id_motivo_solicitud` int(11) DEFAULT NULL,
  `motivo_solicitud` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `detalle_motivo` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `factura_reemplazo` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `archivo_factura_reemplazo` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_documento` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_documento` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `id_pedido` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `cod_pedido` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_ejecutivo_comercial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `obs_ejecutivo_comercial` longtext COLLATE latin1_general_ci,
  `id_ejecutivo_comercial` int(11) DEFAULT NULL,
  `bloqueo_ejecutivo_comercial` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_director_financiero` datetime DEFAULT NULL,
  `id_director_financiero` int(11) DEFAULT NULL,
  `obs_director_financiero` longtext COLLATE latin1_general_ci,
  `bloqueo_director_financiero` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_causal` int(10) DEFAULT NULL,
  `nota_devolucion` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `valor_devolucion` float(11,2) DEFAULT NULL,
  `fecha_director_comercial` datetime DEFAULT NULL,
  `id_director_comercial` int(11) DEFAULT NULL,
  `obs_director_comercial` longtext COLLATE latin1_general_ci,
  `bloqueo_director_comercial` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_director_operativo` datetime DEFAULT NULL,
  `id_director_operativo` int(11) DEFAULT NULL,
  `obs_director_operativo` longtext COLLATE latin1_general_ci,
  `bloqueo_director_operativo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_director_zona` datetime DEFAULT NULL,
  `id_director_zona` int(11) DEFAULT NULL,
  `obs_director_zona` longtext COLLATE latin1_general_ci,
  `bloqueo_director_zona` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_asistente_tecnico` datetime DEFAULT NULL,
  `id_asistente_tecnico` int(11) DEFAULT NULL,
  `obs_asistente_tecnico` longtext COLLATE latin1_general_ci,
  `bloqueo_asistente_tecnico` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_director_compras` datetime DEFAULT NULL,
  `id_director_compras` int(11) DEFAULT NULL,
  `obs_director_compras` longtext COLLATE latin1_general_ci,
  `bloqueo_director_compras` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `consecutivos_oc` varchar(40) COLLATE latin1_general_ci DEFAULT '',
  `fecha_director_regional` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_director_regional` int(11) DEFAULT NULL,
  `obs_director_regional` longtext COLLATE latin1_general_ci,
  `bloqueo_director_regional` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_director_pais` datetime DEFAULT NULL,
  `id_director_pais` int(11) DEFAULT NULL,
  `obs_director_pais` longtext COLLATE latin1_general_ci,
  `bloqueo_director_pais` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `id_empresa` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_solicitante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11858 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for solicitudes_estado_documentos_erp_adjuntos
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes_estado_documentos_erp_adjuntos`;
CREATE TABLE `solicitudes_estado_documentos_erp_adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) DEFAULT NULL,
  `nombre_documento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `randomico_archivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_solicitud`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12268 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for solicitudes_estado_documentos_erp_seguimientos
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes_estado_documentos_erp_seguimientos`;
CREATE TABLE `solicitudes_estado_documentos_erp_seguimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) DEFAULT NULL,
  `observacion` longtext COLLATE latin1_general_ci,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5981 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for solicitudes_estado_ordenes_compra
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes_estado_ordenes_compra`;
CREATE TABLE `solicitudes_estado_ordenes_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consecutivo` int(11) DEFAULT NULL,
  `estado` int(2) DEFAULT '0',
  `id_tipo_solicitud` int(11) DEFAULT NULL,
  `tipo_solicitud` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_motivo_solicitud` int(11) DEFAULT NULL,
  `motivo_solicitud` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `detalle_motivo` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `consecutivo_erp` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT NULL,
  `id_orden_siip` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `consecutivo_siip` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_ejecutivo_comercial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `obs_ejecutivo_comercial` longtext COLLATE latin1_general_ci,
  `id_ejecutivo_comercial` int(11) DEFAULT NULL,
  `bloqueo_ejecutivo_comercial` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_director_financiero` datetime DEFAULT NULL,
  `id_director_financiero` int(11) DEFAULT NULL,
  `obs_director_financiero` longtext COLLATE latin1_general_ci,
  `bloqueo_director_financiero` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `id_causal` int(10) DEFAULT NULL,
  `fecha_director_comercial` datetime DEFAULT NULL,
  `id_director_comercial` int(11) DEFAULT NULL,
  `obs_director_comercial` longtext COLLATE latin1_general_ci,
  `bloqueo_director_comercial` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_director_operativo` datetime DEFAULT NULL,
  `id_director_operativo` int(11) DEFAULT NULL,
  `obs_director_operativo` longtext COLLATE latin1_general_ci,
  `bloqueo_director_operativo` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_director_zona` datetime DEFAULT NULL,
  `id_director_zona` int(11) DEFAULT NULL,
  `obs_director_zona` longtext COLLATE latin1_general_ci,
  `bloqueo_director_zona` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_asistente_tecnico` datetime DEFAULT NULL,
  `id_asistente_tecnico` int(11) DEFAULT NULL,
  `obs_asistente_tecnico` longtext COLLATE latin1_general_ci,
  `bloqueo_asistente_tecnico` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `fecha_director_compras` datetime DEFAULT NULL,
  `id_director_compras` int(11) DEFAULT NULL,
  `obs_director_compras` longtext COLLATE latin1_general_ci,
  `bloqueo_director_compras` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `consecutivos_oc` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_director_regional` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_director_regional` int(11) DEFAULT NULL,
  `obs_director_regional` longtext COLLATE latin1_general_ci,
  `bloqueo_director_regional` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `activo` bit(1) DEFAULT b'1',
  `id_empresa` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_solicitante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for solicitudes_estado_ordenes_compra_adjuntos
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes_estado_ordenes_compra_adjuntos`;
CREATE TABLE `solicitudes_estado_ordenes_compra_adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) DEFAULT NULL,
  `nombre_documento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `randomico_archivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_solicitud`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for tarifas_prueba
-- ----------------------------
DROP TABLE IF EXISTS `tarifas_prueba`;
CREATE TABLE `tarifas_prueba` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `codigo_items` int(11) NOT NULL,
  `nombre_items` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `nit` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_usuario` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `fecha` date NOT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros
-- ----------------------------
DROP TABLE IF EXISTS `terceros`;
CREATE TABLE `terceros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_identificacion` int(11) NOT NULL,
  `tipo_identificacion` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `dv` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_tipo_cliente_comercial` tinyint(4) DEFAULT '1',
  `tipo_cliente_comercial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_linea_negocio` int(11) DEFAULT NULL,
  `ciudad_identificacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_identificacion` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nombre_comercial` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `cadena_hotelera` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `cliente_activo` int(1) DEFAULT NULL,
  `cliente_activo_` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `fechaInicioContrato` date DEFAULT NULL,
  `fechaFinalContrato` date DEFAULT NULL,
  `direccion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono1` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono2` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `celular1` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `celular2` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `fax` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `id_pais` int(11) DEFAULT NULL,
  `pais` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `iso2` varchar(3) COLLATE latin1_general_ci DEFAULT NULL,
  `id_departamento` int(11) NOT NULL,
  `departamento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `ciudad` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `web` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `direcciones` int(11) DEFAULT '0',
  `contactos` int(11) DEFAULT '0',
  `nombre_establecimiento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `representante_legal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_tipo_identificacion_representante` int(11) DEFAULT NULL,
  `tipo_identificacion_representante` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `identificacion_representante` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ciudad_id_representante` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ciudad_representante` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_matricula_camara` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `libro_camara` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_matricula_camara` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ciudad_camara` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_escritura` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_escritura` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `notaria_escritura` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ciudad_notaria` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `id_sector_empresarial` int(11) DEFAULT NULL,
  `sector_empresarial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `pagina_web` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_configuracion_origen` int(11) DEFAULT NULL,
  `configuracion_origen` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `UserIdLog` int(11) DEFAULT NULL,
  `id_tercero_tributario` int(11) DEFAULT NULL,
  `id_tipo_persona_dian` tinyint(1) DEFAULT NULL,
  `id_forma_pago` int(11) DEFAULT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `exento_iva` varchar(10) COLLATE latin1_general_ci DEFAULT '',
  `gravable` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `retener_ica` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `retener_iva` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `agente_retenedor` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `clasificacion` varchar(1) COLLATE latin1_general_ci DEFAULT 'D',
  `id_proyecto` int(11) DEFAULT NULL,
  `proyecto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_actividad` int(11) DEFAULT NULL,
  `actividad` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `tipo_cliente` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_proveedor` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `asisteH` int(11) DEFAULT '0',
  `asisteH_` varchar(2) COLLATE latin1_general_ci DEFAULT 'NO',
  `asisteS` int(11) DEFAULT '0',
  `asisteS_` varchar(2) COLLATE latin1_general_ci DEFAULT 'NO',
  `survey` int(1) DEFAULT NULL,
  `survey_` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `hotels` int(1) DEFAULT NULL,
  `hotels_` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `contler` int(1) DEFAULT NULL,
  `contler_` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `erp_facse` int(1) DEFAULT NULL,
  `erp_facse_` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `hunty` int(1) DEFAULT NULL,
  `hunty_` varchar(2) COLLATE latin1_general_ci DEFAULT NULL,
  `otros` int(1) DEFAULT NULL,
  `otro_soft` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `encuesta` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `encuesta_destinatario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `encuesta_email` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `encuesta_celular` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `encuesta_telefono` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `zona_comercial` int(11) DEFAULT NULL,
  `nombre_zona_comercial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `sinc_erp` varchar(255) COLLATE latin1_general_ci DEFAULT 'false',
  `nombre1` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `nombre2` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `apellido1` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `apellido2` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `tercero` int(11) NOT NULL DEFAULT '1' COMMENT 'prospecto => 0 , tercero => 1',
  `activo` int(11) NOT NULL DEFAULT '1',
  `ficha_tecnica` varchar(10) COLLATE latin1_general_ci DEFAULT 'false',
  `tarifario` varchar(10) COLLATE latin1_general_ci DEFAULT 'false',
  `usuario_log` int(11) DEFAULT NULL COMMENT '''con este id saco el usuario para guardarlo en el log de terceros''',
  `estado_proveedor` bit(1) DEFAULT b'1' COMMENT '''0 -> bloqueado,1 -> no bloqueado''',
  `prioridad_prospecto` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `proveedor_subcontratacion` varchar(5) COLLATE latin1_general_ci DEFAULT 'No',
  `correo_subcontratacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_origen_contacto` int(11) DEFAULT NULL,
  `origen_contacto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `descripcion_contacto` varchar(255) CHARACTER SET keybcs2 DEFAULT NULL,
  `tipo_operacion` tinyint(4) DEFAULT '0' COMMENT '0->No Aplica,1 -> Por Contrato,2 -> Por Demanda',
  `observacion_servicios` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_contacto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Para prospectos',
  `inhabilitado` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'inhabilitado para cualquier movimiento en el siip',
  `departamento_gestion` int(11) DEFAULT NULL,
  `facturacion_frecuencia` int(11) DEFAULT NULL,
  `facturacion_provision` int(11) DEFAULT NULL,
  `facturacion_provision_detalle` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `facturacion_dias` int(11) DEFAULT NULL,
  `facturacion_dia_cierre` int(11) DEFAULT NULL,
  `facturacion_observaciones` text COLLATE latin1_general_ci,
  `zip` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `IDENTIFICACION` (`numero_identificacion`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24793 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_asignados
-- ----------------------------
DROP TABLE IF EXISTS `terceros_asignados`;
CREATE TABLE `terceros_asignados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `id_tercero` int(11) DEFAULT NULL,
  `id_asignado` int(11) DEFAULT NULL,
  `asignado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7650 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_bloqueos_log
-- ----------------------------
DROP TABLE IF EXISTS `terceros_bloqueos_log`;
CREATE TABLE `terceros_bloqueos_log` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(15) DEFAULT NULL,
  `accion` varchar(50) COLLATE latin1_general_ci DEFAULT '' COMMENT 'si crea o anula aprobacion o contabilizacion',
  `concepto` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(15) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(5) DEFAULT NULL,
  `id_sucursal` int(5) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2154 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_contactos
-- ----------------------------
DROP TABLE IF EXISTS `terceros_contactos`;
CREATE TABLE `terceros_contactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) NOT NULL,
  `id_tipo_identificacion` int(11) NOT NULL,
  `tipo_identificacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `identificacion` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_tratamiento` int(11) NOT NULL,
  `tratamiento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cargo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono1` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono2` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `celular1` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `celular2` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `nacimiento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observaciones` blob,
  `sexo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `emails` int(4) DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  `ContactoAuto` int(1) NOT NULL DEFAULT '0' COMMENT 'campo controlador para cuando el contacto es una persona  natural y se crea automaticamente',
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `informe_encuesta` varchar(5) COLLATE latin1_general_ci DEFAULT 'false' COMMENT 'SI SE LE REENVIA LA RESPUESTA AUTOMATICA DE LA ENCUESTA',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_TERCERO` (`id_tercero`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13962 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_contactos_email
-- ----------------------------
DROP TABLE IF EXISTS `terceros_contactos_email`;
CREATE TABLE `terceros_contactos_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contacto` int(11) NOT NULL,
  `email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1917 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_datos_asiste
-- ----------------------------
DROP TABLE IF EXISTS `terceros_datos_asiste`;
CREATE TABLE `terceros_datos_asiste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) DEFAULT NULL,
  `tipo_conexion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ip_conexion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `usuario_conexion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `clave_conexion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `bd` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `usuario_bd` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `clave_bd` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `observaciones` varchar(5000) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_direcciones
-- ----------------------------
DROP TABLE IF EXISTS `terceros_direcciones`;
CREATE TABLE `terceros_direcciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) DEFAULT NULL,
  `direccion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `departamento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `ciudad` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(2) DEFAULT '1',
  `telefono1` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono2` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `celular1` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `celular2` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `direccion_principal` int(1) DEFAULT '0',
  `encuesta` varchar(5) COLLATE latin1_general_ci DEFAULT 'false',
  `encuesta_destinatario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `encuesta_email` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `encuesta_telefono` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `encuesta_celular` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_tipo_cliente_comercial` tinyint(2) DEFAULT '1',
  `tipo_cliente_comercial` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `zona_comercial` int(255) DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `pais` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `emails` int(4) DEFAULT NULL,
  `id_bodega_siip` int(11) DEFAULT NULL,
  `bodega_siip` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_bodega` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `contactos` int(4) DEFAULT NULL,
  `tipo_operacion` tinyint(2) DEFAULT '0' COMMENT '0->No Aplica,1 -> Por Contrato,2 -> Por Demanda',
  `envio_formato_ac` varchar(5) COLLATE latin1_general_ci DEFAULT 'true' COMMENT 'Formato de adiciones y cancelaciones',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25363 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_direcciones_areas
-- ----------------------------
DROP TABLE IF EXISTS `terceros_direcciones_areas`;
CREATE TABLE `terceros_direcciones_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_direccion` int(11) DEFAULT NULL,
  `id_tipo_area` int(5) DEFAULT NULL,
  `tipo_area` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_ubicacion` int(5) DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ubicacion_numero` int(5) DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `capacidad_auditorio` int(11) DEFAULT NULL,
  `capacidad_aula` int(11) DEFAULT NULL,
  `capacidad_coctel` int(11) DEFAULT NULL,
  `automatizacion` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `infraestructura_acometida` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `infraestructura_datos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `infraestructura_recursos` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3094 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_direcciones_areas_planos
-- ----------------------------
DROP TABLE IF EXISTS `terceros_direcciones_areas_planos`;
CREATE TABLE `terceros_direcciones_areas_planos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_plano` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `randomico_archivo` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_area`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_direcciones_asignados
-- ----------------------------
DROP TABLE IF EXISTS `terceros_direcciones_asignados`;
CREATE TABLE `terceros_direcciones_asignados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `id_asignado` int(11) DEFAULT NULL,
  `asignado` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_direcciones_contratos
-- ----------------------------
DROP TABLE IF EXISTS `terceros_direcciones_contratos`;
CREATE TABLE `terceros_direcciones_contratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_vigencia` date DEFAULT NULL,
  `fecha_prorroga` date DEFAULT NULL,
  `id_clase_contrato` int(5) DEFAULT NULL,
  `clase_contrato` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_causal_terminacion` int(5) DEFAULT NULL,
  `causal_terminacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `personal_fijo` varchar(5) COLLATE latin1_general_ci DEFAULT 'No',
  `observaciones` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_tipo_negociacion` int(6) DEFAULT NULL,
  `tipo_negociacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tiempo_facturacion` int(5) DEFAULT NULL,
  `documento_anexo1` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `archivo_documento_anexo1` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `documento_anexo2` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `archivo_documento_anexo2` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `documento_anexo3` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `archivo_documento_anexo3` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `documento_anexo4` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `archivo_documento_anexo4` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `prorroga` varchar(5) COLLATE latin1_general_ci DEFAULT 'Si',
  `poliza` varchar(5) COLLATE latin1_general_ci DEFAULT 'Si' COMMENT 'SI TIENE POLIZA O NO',
  `fecha_inicio_poliza` date DEFAULT NULL,
  `fecha_vigencia_poliza` date DEFAULT NULL,
  `fecha_prorroga_poliza` date DEFAULT NULL,
  `prorroga_poliza` varchar(5) COLLATE latin1_general_ci DEFAULT 'Si',
  `documento_poliza` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `archivo_documento_poliza` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_direcciones_email
-- ----------------------------
DROP TABLE IF EXISTS `terceros_direcciones_email`;
CREATE TABLE `terceros_direcciones_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_direccion` int(11) NOT NULL,
  `contacto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1805 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_direcciones_items_precios
-- ----------------------------
DROP TABLE IF EXISTS `terceros_direcciones_items_precios`;
CREATE TABLE `terceros_direcciones_items_precios` (
  `id` int(11) NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `codigo_item` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_item` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `precio` double(11,2) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_direcciones_productos_software
-- ----------------------------
DROP TABLE IF EXISTS `terceros_direcciones_productos_software`;
CREATE TABLE `terceros_direcciones_productos_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_direccion` int(11) DEFAULT NULL,
  `id_producto` int(5) DEFAULT NULL,
  `nombre_producto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_contacto_responsable` int(5) DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_documentos
-- ----------------------------
DROP TABLE IF EXISTS `terceros_documentos`;
CREATE TABLE `terceros_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `tipo_documento_nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `activo` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_tercero` (`id_tercero`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6875 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_documentos_confidenciales
-- ----------------------------
DROP TABLE IF EXISTS `terceros_documentos_confidenciales`;
CREATE TABLE `terceros_documentos_confidenciales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `tipo_documento_nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `ext` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `activo` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_tercero` (`id_tercero`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=347 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_ficha_tecnica
-- ----------------------------
DROP TABLE IF EXISTS `terceros_ficha_tecnica`;
CREATE TABLE `terceros_ficha_tecnica` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) DEFAULT NULL,
  `gran_contribuyente` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `responsable_iva` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `autoretenedor` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `responsable_ica` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `cod_actividad_economica` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cod_ciiu` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `autoretenedor_ica` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `tarifa_por_mil` double(20,2) DEFAULT NULL,
  `pago_orden` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `numero_cuenta` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_cuenta` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `entidad` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `contacto_pago` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_proveedor` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `forma_pago` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `desc_pronto_pago` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `porc_desc_pronto_pago` double(20,2) DEFAULT NULL,
  `observaciones` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `nombre_contacto_cartera` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `cargo_contacto_cartera` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `telefono_contacto_cartera` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `extension_contacto_cartera` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `email_contacto_cartera` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `fax_contacto_cartera` varchar(55) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) DEFAULT '1',
  `id_forma_pago` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=697 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_ficha_tecnica_email
-- ----------------------------
DROP TABLE IF EXISTS `terceros_ficha_tecnica_email`;
CREATE TABLE `terceros_ficha_tecnica_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_hotel
-- ----------------------------
DROP TABLE IF EXISTS `terceros_hotel`;
CREATE TABLE `terceros_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lugar_evento` varchar(250) NOT NULL,
  `mes_evento` varchar(250) NOT NULL,
  `porcentaje_h` int(10) NOT NULL,
  `porcentaje_p` int(10) DEFAULT NULL,
  `ejecutivo` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `salon` varchar(250) NOT NULL,
  `nombre_evento` varchar(250) NOT NULL,
  `nombre_tercero` varchar(250) NOT NULL,
  `servicios_tercero` varchar(600) NOT NULL,
  `valor_cobrar` int(20) NOT NULL,
  `valor_hotel` int(20) NOT NULL,
  `valor_plataforma` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for terceros_log
-- ----------------------------
DROP TABLE IF EXISTS `terceros_log`;
CREATE TABLE `terceros_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `accion` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) USING BTREE,
  KEY `ID_PEDIDO` (`id_tercero`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=31898 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_proveedores_servicios
-- ----------------------------
DROP TABLE IF EXISTS `terceros_proveedores_servicios`;
CREATE TABLE `terceros_proveedores_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) DEFAULT NULL,
  `id_servicio` int(5) DEFAULT NULL,
  `nombre_servicio` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_sucursales_items
-- ----------------------------
DROP TABLE IF EXISTS `terceros_sucursales_items`;
CREATE TABLE `terceros_sucursales_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_tercero` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `codigo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `item` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=334 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_sucursales_items_cotizaciones
-- ----------------------------
DROP TABLE IF EXISTS `terceros_sucursales_items_cotizaciones`;
CREATE TABLE `terceros_sucursales_items_cotizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_tercero` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `codigo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `item` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_tarifarios
-- ----------------------------
DROP TABLE IF EXISTS `terceros_tarifarios`;
CREATE TABLE `terceros_tarifarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tercero` int(11) DEFAULT NULL,
  `nombre_archivo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_subido` datetime DEFAULT NULL,
  `ext` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `usuario` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `icono` bit(1) DEFAULT b'1' COMMENT '"1 sale icono 0 no aparece"',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=787 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_tipo_cliente
-- ----------------------------
DROP TABLE IF EXISTS `terceros_tipo_cliente`;
CREATE TABLE `terceros_tipo_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `terceros_tipo_documento`;
CREATE TABLE `terceros_tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_tipo_documento_confidencial
-- ----------------------------
DROP TABLE IF EXISTS `terceros_tipo_documento_confidencial`;
CREATE TABLE `terceros_tipo_documento_confidencial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_tratamiento
-- ----------------------------
DROP TABLE IF EXISTS `terceros_tratamiento`;
CREATE TABLE `terceros_tratamiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_tributario
-- ----------------------------
DROP TABLE IF EXISTS `terceros_tributario`;
CREATE TABLE `terceros_tributario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_pais` int(11) NOT NULL,
  `activo` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for terceros_zona_comercial
-- ----------------------------
DROP TABLE IF EXISTS `terceros_zona_comercial`;
CREATE TABLE `terceros_zona_comercial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `pais` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `minimo_calificacion` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for tfestivo
-- ----------------------------
DROP TABLE IF EXISTS `tfestivo`;
CREATE TABLE `tfestivo` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `dia` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Table structure for tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `detalle` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `tipo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  `codigo_documento` int(5) DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for ubicacion_ciudad
-- ----------------------------
DROP TABLE IF EXISTS `ubicacion_ciudad`;
CREATE TABLE `ubicacion_ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `pais` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `departamento` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5178 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for ubicacion_departamento
-- ----------------------------
DROP TABLE IF EXISTS `ubicacion_departamento`;
CREATE TABLE `ubicacion_departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `pais` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1383 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for ubicacion_pais
-- ----------------------------
DROP TABLE IF EXISTS `ubicacion_pais`;
CREATE TABLE `ubicacion_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `continente` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `subcontinente` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `prefijo` int(11) NOT NULL,
  `moneda` varchar(3) COLLATE latin1_general_ci NOT NULL,
  `nombre-moneda` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `iso2` varchar(2) COLLATE latin1_general_ci NOT NULL,
  `iso3` varchar(3) COLLATE latin1_general_ci NOT NULL,
  `time_zone` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'America/Bogota',
  `activo` int(1) NOT NULL DEFAULT '1',
  `impuesto` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for unidades
-- ----------------------------
DROP TABLE IF EXISTS `unidades`;
CREATE TABLE `unidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for variables
-- ----------------------------
DROP TABLE IF EXISTS `variables`;
CREATE TABLE `variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `detalle` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `grupo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `campo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `tabla` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `funcion` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `automatica` int(1) NOT NULL DEFAULT '1',
  `where` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for variables_grupos
-- ----------------------------
DROP TABLE IF EXISTS `variables_grupos`;
CREATE TABLE `variables_grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for variables_revisiones
-- ----------------------------
DROP TABLE IF EXISTS `variables_revisiones`;
CREATE TABLE `variables_revisiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `detalle` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `grupo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `campo` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `tabla` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `funcion` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `automatica` int(1) NOT NULL DEFAULT '1',
  `where` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for voip
-- ----------------------------
DROP TABLE IF EXISTS `voip`;
CREATE TABLE `voip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_configuracion_servidor` int(11) DEFAULT NULL,
  `ext` int(11) DEFAULT NULL,
  `nombre` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_empresa` int(11) DEFAULT '0',
  `empresa` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT '0',
  `sucursal` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for voip_configuracion_servidor
-- ----------------------------
DROP TABLE IF EXISTS `voip_configuracion_servidor`;
CREATE TABLE `voip_configuracion_servidor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servidor` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `user` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `password` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `name_db` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `host` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for webservice_automatizacion
-- ----------------------------
DROP TABLE IF EXISTS `webservice_automatizacion`;
CREATE TABLE `webservice_automatizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bodega` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `id_salon` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  `pedido` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- View structure for ejecutivos
-- ----------------------------
DROP VIEW IF EXISTS `ejecutivos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ejecutivos` AS select `empleados`.`id` AS `id`,`empleados`.`tipo_documento` AS `tipo_documento`,`empleados`.`tipo_documento_nombre` AS `tipo_documento_nombre`,`empleados`.`documento` AS `documento`,`empleados`.`nombre1` AS `nombre1`,`empleados`.`nombre2` AS `nombre2`,`empleados`.`apellido1` AS `apellido1`,`empleados`.`apellido2` AS `apellido2`,`empleados`.`nombre` AS `nombre`,`empleados`.`id_empresa` AS `id_empresa`,`empleados`.`empresa` AS `empresa`,`empleados`.`id_sucursal` AS `id_sucursal`,`empleados`.`sucursal` AS `sucursal`,`empleados`.`id_unidad_negocio` AS `id_unidad_negocio`,`empleados`.`unidad_negocio` AS `unidad_negocio`,`empleados`.`id_rol` AS `id_rol`,`empleados`.`rol` AS `rol`,`empleados`.`id_cargo` AS `id_cargo`,`empleados`.`cargo` AS `cargo`,`empleados`.`username` AS `username`,`empleados`.`password` AS `password`,`empleados`.`email_empresa` AS `email_empresa`,`empleados`.`nacimiento` AS `nacimiento`,`empleados`.`direccion` AS `direccion`,`empleados`.`email_personal` AS `email_personal`,`empleados`.`telefono1` AS `telefono1`,`empleados`.`telefono2` AS `telefono2`,`empleados`.`celular1` AS `celular1`,`empleados`.`id_celular_empresa` AS `id_celular_empresa`,`empleados`.`celular_empresa` AS `celular_empresa`,`empleados`.`foto` AS `foto`,`empleados`.`id_contrato` AS `id_contrato`,`empleados`.`contrato` AS `contrato`,`empleados`.`ad_contrato` AS `ad_contrato`,`empleados`.`ad_certificado_judicial` AS `ad_certificado_judicial`,`empleados`.`ad_cedula` AS `ad_cedula`,`empleados`.`ad_certificado_estudios` AS `ad_certificado_estudios`,`empleados`.`ad_hoja_vida` AS `ad_hoja_vida`,`empleados`.`ad_afiliaciones` AS `ad_afiliaciones`,`empleados`.`alerta_actualizacion` AS `alerta_actualizacion`,`empleados`.`activo` AS `activo`,`empleados`.`ciudad_cedula` AS `ciudad_cedula` from `empleados` ;

-- ----------------------------
-- View structure for inventario_prestamo_false
-- ----------------------------
DROP VIEW IF EXISTS `inventario_prestamo_false`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `inventario_prestamo_false` AS select `inventarios`.`id` AS `id`,`inventarios`.`codigo` AS `codigo`,`inventarios`.`id_empresa` AS `id_empresa`,`inventarios`.`empresa` AS `empresa`,`inventarios`.`id_sucursal` AS `id_sucursal`,`inventarios`.`sucursal` AS `sucursal`,`inventarios`.`id_ubicacion` AS `id_ubicacion`,`inventarios`.`ubicacion` AS `ubicacion`,`inventarios`.`unidad` AS `unidad`,`inventarios`.`id_grupo` AS `id_grupo`,`inventarios`.`grupo` AS `grupo`,`inventarios`.`id_subgrupo` AS `id_subgrupo`,`inventarios`.`id_subgrupo2` AS `id_subgrupo2`,`inventarios`.`subgrupo` AS `subgrupo`,`inventarios`.`nombre_equipo` AS `nombre_equipo`,`inventarios`.`id_unidad` AS `id_unidad`,`inventarios`.`vida_util` AS `vida_util`,`inventarios`.`asignado_a` AS `asignado_a`,`inventarios`.`asignado_a_nombre` AS `asignado_a_nombre`,`inventarios`.`centro_costos` AS `centro_costos`,`inventarios`.`proveedor` AS `proveedor`,`inventarios`.`tenencia` AS `tenencia`,`inventarios`.`fecha_vencimiento_tenencia` AS `fecha_vencimiento_tenencia`,`inventarios`.`fecha_compra` AS `fecha_compra`,`inventarios`.`fecha_baja` AS `fecha_baja`,`inventarios`.`fecha_vencimiento_garantia` AS `fecha_vencimiento_garantia`,`inventarios`.`marca` AS `marca`,`inventarios`.`modelo` AS `modelo`,`inventarios`.`serie` AS `serie`,`inventarios`.`color` AS `color`,`inventarios`.`numero_piezas` AS `numero_piezas`,`inventarios`.`descripcion1` AS `descripcion1`,`inventarios`.`descripcion2` AS `descripcion2`,`inventarios`.`estado` AS `estado`,`inventarios`.`quien_elimino` AS `quien_elimino`,`inventarios`.`factura` AS `factura`,`inventarios`.`costos` AS `costos`,`inventarios`.`documento_contable` AS `documento_contable`,`inventarios`.`numero_documento` AS `numero_documento`,`inventarios`.`activo` AS `activo`,`inventarios`.`id_checklist` AS `id_checklist`,`inventarios`.`checklist` AS `checklist`,`inventarios`.`ultimo_mantenimiento` AS `ultimo_mantenimiento`,`inventarios`.`prestado` AS `prestado`,`inventarios`.`id_ubicacion` AS `id_origen`,if((`inventarios`.`prestado` = 'false'),'0','false') AS `es_prestado`,`inventarios`.`ultima_reparacion` AS `ultima_reparacion`,`inventarios`.`siip3` AS `siip3` from `inventarios` ;

-- ----------------------------
-- View structure for inventario_prestamo_true
-- ----------------------------
DROP VIEW IF EXISTS `inventario_prestamo_true`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `inventario_prestamo_true` AS select `inventarios`.`id` AS `id`,`inventarios`.`codigo` AS `codigo`,`inventarios`.`id_empresa_prestamo` AS `id_empresa`,`inventarios`.`empresa_prestamo` AS `empresa`,`inventarios`.`id_sucursal_prestamo` AS `id_sucursal`,`inventarios`.`sucursal_prestamo` AS `sucursal`,`inventarios`.`id_bodega_prestamo` AS `id_bodega`,`inventarios`.`bodega_prestamo` AS `bodega`,`inventarios`.`unidad` AS `unidad`,`inventarios`.`id_grupo` AS `id_grupo`,`inventarios`.`grupo` AS `grupo`,`inventarios`.`id_subgrupo` AS `id_subgrupo`,`inventarios`.`id_subgrupo2` AS `id_subgrupo2`,`inventarios`.`subgrupo` AS `subgrupo`,`inventarios`.`nombre_equipo` AS `nombre_equipo`,`inventarios`.`id_unidad` AS `id_unidad`,`inventarios`.`vida_util` AS `vida_util`,`inventarios`.`asignado_a` AS `asignado_a`,`inventarios`.`asignado_a_nombre` AS `asignado_a_nombre`,`inventarios`.`centro_costos` AS `centro_costos`,`inventarios`.`proveedor` AS `proveedor`,`inventarios`.`tenencia` AS `tenencia`,`inventarios`.`fecha_vencimiento_tenencia` AS `fecha_vencimiento_tenencia`,`inventarios`.`fecha_compra` AS `fecha_compra`,`inventarios`.`fecha_baja` AS `fecha_baja`,`inventarios`.`fecha_vencimiento_garantia` AS `fecha_vencimiento_garantia`,`inventarios`.`marca` AS `marca`,`inventarios`.`modelo` AS `modelo`,`inventarios`.`serie` AS `serie`,`inventarios`.`color` AS `color`,`inventarios`.`numero_piezas` AS `numero_piezas`,`inventarios`.`descripcion1` AS `descripcion1`,`inventarios`.`descripcion2` AS `descripcion2`,`inventarios`.`estado` AS `estado`,`inventarios`.`quien_elimino` AS `quien_elimino`,`inventarios`.`factura` AS `factura`,`inventarios`.`costos` AS `costos`,`inventarios`.`documento_contable` AS `documento_contable`,`inventarios`.`numero_documento` AS `numero_documento`,`inventarios`.`activo` AS `activo`,`inventarios`.`id_checklist` AS `id_checklist`,`inventarios`.`checklist` AS `checklist`,`inventarios`.`ultimo_mantenimiento` AS `ultimo_mantenimiento`,`inventarios`.`prestado` AS `prestado`,`inventarios`.`id_ubicacion` AS `id_origen`,'true' AS `es_prestado`,`inventarios`.`ultima_reparacion` AS `ultima_reparacion`,`inventarios`.`siip3` AS `siip3` from `inventarios` where (`inventarios`.`prestado` = 'true') ;

-- ----------------------------
-- View structure for inventarios_vista_PRUEBA
-- ----------------------------
DROP VIEW IF EXISTS `inventarios_vista_PRUEBA`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `inventarios_vista_PRUEBA` AS select `inventario_prestamo_false`.`id` AS `id`,`inventario_prestamo_false`.`codigo` AS `codigo`,`inventario_prestamo_false`.`id_empresa` AS `id_empresa`,`inventario_prestamo_false`.`empresa` AS `empresa`,`inventario_prestamo_false`.`id_sucursal` AS `id_sucursal`,`inventario_prestamo_false`.`sucursal` AS `sucursal`,`inventario_prestamo_false`.`id_ubicacion` AS `id_ubicacion`,`inventario_prestamo_false`.`ubicacion` AS `ubicacion`,`inventario_prestamo_false`.`unidad` AS `unidad`,`inventario_prestamo_false`.`id_grupo` AS `id_grupo`,`inventario_prestamo_false`.`grupo` AS `grupo`,`inventario_prestamo_false`.`id_subgrupo` AS `id_subgrupo`,`inventario_prestamo_false`.`id_subgrupo2` AS `id_subgrupo2`,`inventario_prestamo_false`.`subgrupo` AS `subgrupo`,`inventario_prestamo_false`.`id_departamento` AS `id_departamento`,`inventario_prestamo_false`.`departamento` AS `departamento`,`inventario_prestamo_false`.`nombre_equipo` AS `nombre_equipo`,`inventario_prestamo_false`.`id_unidad` AS `id_unidad`,`inventario_prestamo_false`.`vida_util` AS `vida_util`,`inventario_prestamo_false`.`asignado_a` AS `asignado_a`,`inventario_prestamo_false`.`asignado_a_nombre` AS `asignado_a_nombre`,`inventario_prestamo_false`.`centro_costos` AS `centro_costos`,`inventario_prestamo_false`.`proveedor` AS `proveedor`,`inventario_prestamo_false`.`tenencia` AS `tenencia`,`inventario_prestamo_false`.`fecha_vencimiento_tenencia` AS `fecha_vencimiento_tenencia`,`inventario_prestamo_false`.`fecha_compra` AS `fecha_compra`,`inventario_prestamo_false`.`fecha_baja` AS `fecha_baja`,`inventario_prestamo_false`.`fecha_vencimiento_garantia` AS `fecha_vencimiento_garantia`,`inventario_prestamo_false`.`marca` AS `marca`,`inventario_prestamo_false`.`modelo` AS `modelo`,`inventario_prestamo_false`.`serie` AS `serie`,`inventario_prestamo_false`.`color` AS `color`,`inventario_prestamo_false`.`numero_piezas` AS `numero_piezas`,`inventario_prestamo_false`.`descripcion1` AS `descripcion1`,`inventario_prestamo_false`.`descripcion2` AS `descripcion2`,`inventario_prestamo_false`.`estado` AS `estado`,`inventario_prestamo_false`.`quien_elimino` AS `quien_elimino`,`inventario_prestamo_false`.`factura` AS `factura`,`inventario_prestamo_false`.`costos` AS `costos`,`inventario_prestamo_false`.`documento_contable` AS `documento_contable`,`inventario_prestamo_false`.`numero_documento` AS `numero_documento`,`inventario_prestamo_false`.`activo` AS `activo`,`inventario_prestamo_false`.`id_checklist` AS `id_checklist`,`inventario_prestamo_false`.`checklist` AS `checklist`,`inventario_prestamo_false`.`ultimo_mantenimiento` AS `ultimo_mantenimiento`,`inventario_prestamo_false`.`prestado` AS `prestado`,`inventario_prestamo_false`.`id_origen` AS `id_origen`,`inventario_prestamo_false`.`es_prestado` AS `es_prestado`,`inventario_prestamo_false`.`ultima_reparacion` AS `ultima_reparacion`,`inventario_prestamo_false`.`siip3` AS `siip3` from `inventario_prestamo_false` union select `inventario_prestamo_true`.`id` AS `id`,`inventario_prestamo_true`.`codigo` AS `codigo`,`inventario_prestamo_true`.`id_empresa` AS `id_empresa`,`inventario_prestamo_true`.`empresa` AS `empresa`,`inventario_prestamo_true`.`id_sucursal` AS `id_sucursal`,`inventario_prestamo_true`.`sucursal` AS `sucursal`,`inventario_prestamo_true`.`id_bodega` AS `id_bodega`,`inventario_prestamo_true`.`bodega` AS `bodega`,`inventario_prestamo_true`.`unidad` AS `unidad`,`inventario_prestamo_true`.`id_grupo` AS `id_grupo`,`inventario_prestamo_true`.`grupo` AS `grupo`,`inventario_prestamo_true`.`id_subgrupo` AS `id_subgrupo`,`inventario_prestamo_true`.`id_subgrupo2` AS `id_subgrupo2`,`inventario_prestamo_true`.`subgrupo` AS `subgrupo`,`inventario_prestamo_true`.`id_departamento` AS `id_departamento`,`inventario_prestamo_true`.`departamento` AS `departamento`,`inventario_prestamo_true`.`nombre_equipo` AS `nombre_equipo`,`inventario_prestamo_true`.`id_unidad` AS `id_unidad`,`inventario_prestamo_true`.`vida_util` AS `vida_util`,`inventario_prestamo_true`.`asignado_a` AS `asignado_a`,`inventario_prestamo_true`.`asignado_a_nombre` AS `asignado_a_nombre`,`inventario_prestamo_true`.`centro_costos` AS `centro_costos`,`inventario_prestamo_true`.`proveedor` AS `proveedor`,`inventario_prestamo_true`.`tenencia` AS `tenencia`,`inventario_prestamo_true`.`fecha_vencimiento_tenencia` AS `fecha_vencimiento_tenencia`,`inventario_prestamo_true`.`fecha_compra` AS `fecha_compra`,`inventario_prestamo_true`.`fecha_baja` AS `fecha_baja`,`inventario_prestamo_true`.`fecha_vencimiento_garantia` AS `fecha_vencimiento_garantia`,`inventario_prestamo_true`.`marca` AS `marca`,`inventario_prestamo_true`.`modelo` AS `modelo`,`inventario_prestamo_true`.`serie` AS `serie`,`inventario_prestamo_true`.`color` AS `color`,`inventario_prestamo_true`.`numero_piezas` AS `numero_piezas`,`inventario_prestamo_true`.`descripcion1` AS `descripcion1`,`inventario_prestamo_true`.`descripcion2` AS `descripcion2`,`inventario_prestamo_true`.`estado` AS `estado`,`inventario_prestamo_true`.`quien_elimino` AS `quien_elimino`,`inventario_prestamo_true`.`factura` AS `factura`,`inventario_prestamo_true`.`costos` AS `costos`,`inventario_prestamo_true`.`documento_contable` AS `documento_contable`,`inventario_prestamo_true`.`numero_documento` AS `numero_documento`,`inventario_prestamo_true`.`activo` AS `activo`,`inventario_prestamo_true`.`id_checklist` AS `id_checklist`,`inventario_prestamo_true`.`checklist` AS `checklist`,`inventario_prestamo_true`.`ultimo_mantenimiento` AS `ultimo_mantenimiento`,`inventario_prestamo_true`.`prestado` AS `prestado`,`inventario_prestamo_true`.`id_origen` AS `id_origen`,`inventario_prestamo_true`.`es_prestado` AS `es_prestado`,`inventario_prestamo_true`.`ultima_reparacion` AS `ultima_reparacion`,`inventario_prestamo_true`.`siip3` AS `siip3` from `inventario_prestamo_true` ;

-- ----------------------------
-- View structure for items_empresas_VISTA
-- ----------------------------
DROP VIEW IF EXISTS `items_empresas_VISTA`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `items_empresas_VISTA` AS select `items`.`id_items_general` AS `id_item`,`items`.`codigo` AS `codigo`,`items`.`nombre` AS `nombre`,if((`items`.`id_empresa` = 1),1,0) AS `campo_1`,if((`items`.`id_empresa` = 2),1,0) AS `campo_2`,if((`items`.`id_empresa` = 3),1,0) AS `campo_3`,if((`items`.`id_empresa` = 4),1,0) AS `campo_4`,if((`items`.`id_empresa` = 5),1,0) AS `campo_5`,if((`items`.`id_empresa` = 6),1,0) AS `campo_6`,if((`items`.`id_empresa` = 7),1,0) AS `campo_7`,if((`items`.`id_empresa` = 8),1,0) AS `campo_8`,if((`items`.`id_empresa` = 9),1,0) AS `campo_9`,if((`items`.`id_empresa` = 10),1,0) AS `campo_10`,if((`items`.`id_empresa` = 11),1,0) AS `campo_11`,if((`items`.`id_empresa` = 12),1,0) AS `campo_12`,if((`items`.`id_empresa` = 13),1,0) AS `campo_13`,if((`items`.`id_empresa` = 14),1,0) AS `campo_14`,if((`items`.`id_empresa` = 15),1,0) AS `campo_15`,if((`items`.`id_empresa` = 16),1,0) AS `campo_16`,if((`items`.`id_empresa` = 17),1,0) AS `campo_17`,if((`items`.`id_empresa` = 18),1,0) AS `campo_18`,if((`items`.`id_empresa` = 19),1,0) AS `campo_19`,if((`items`.`id_empresa` = 20),1,0) AS `campo_20`,if((`items`.`id_empresa` = 21),1,0) AS `campo_21` from `items` where (`items`.`activo` = 1) ;

-- ----------------------------
-- View structure for terceros_documento_VISTA
-- ----------------------------
DROP VIEW IF EXISTS `terceros_documento_VISTA`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `terceros_documento_VISTA` AS select `terceros_documentos`.`id_tercero` AS `id_tercero`,`terceros_documentos`.`tipo_documento` AS `tipo_documento`,`terceros_documentos`.`tipo_documento_nombre` AS `tipo_documento_nombre`,`terceros_documentos`.`ext` AS `ext`,`terceros_documentos`.`fecha_creacion` AS `fecha_creacion`,`terceros_documentos`.`id` AS `id`,`terceros_documentos`.`activo` AS `activo`,if((`terceros_documentos`.`tipo_documento` = 1),1,0) AS `campo_1`,if((`terceros_documentos`.`tipo_documento` = 2),1,0) AS `campo_2`,if((`terceros_documentos`.`tipo_documento` = 3),1,0) AS `campo_3`,if((`terceros_documentos`.`tipo_documento` = 4),1,0) AS `campo_4`,if((`terceros_documentos`.`tipo_documento` = 5),1,0) AS `campo_5`,if((`terceros_documentos`.`tipo_documento` = 6),1,0) AS `campo_6`,if((`terceros_documentos`.`tipo_documento` = 7),1,0) AS `campo_7`,if((`terceros_documentos`.`tipo_documento` = 8),1,0) AS `campo_8`,if((`terceros_documentos`.`tipo_documento` = 9),1,0) AS `campo_9`,if((`terceros_documentos`.`tipo_documento` = 10),1,0) AS `campo_10`,if((`terceros_documentos`.`tipo_documento` = 11),1,0) AS `campo_11`,if((`terceros_documentos`.`tipo_documento` = 12),1,0) AS `campo_12`,if((`terceros_documentos`.`tipo_documento` = 13),1,0) AS `campo_13`,if((`terceros_documentos`.`tipo_documento` = 14),1,0) AS `campo_14`,if((`terceros_documentos`.`tipo_documento` = 15),1,0) AS `campo_15` from `terceros_documentos` where (`terceros_documentos`.`activo` = 1) ;

-- ----------------------------
-- View structure for vista_carnet
-- ----------------------------
DROP VIEW IF EXISTS `vista_carnet`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_carnet` AS select `empleados`.`id` AS `id`,`empleados`.`documento` AS `documento`,concat(`empleados`.`nombre1`,_latin1' ',`empleados`.`nombre2`) AS `nombres`,`empleados`.`nombre1` AS `nombre1`,`empleados`.`nombre2` AS `nombre2`,concat(`empleados`.`apellido1`,_latin1' ',`empleados`.`apellido2`) AS `apellidos`,`empleados`.`apellido1` AS `apellido1`,`empleados`.`apellido2` AS `apellido2`,`empleados`.`nombre` AS `nombre`,`empleados`.`cargo` AS `cargo`,`empleados`.`foto` AS `foto`,`empleados_adicional`.`tipo_sangre` AS `tipo_sangre` from (`empleados` left join `empleados_adicional` on((`empleados_adicional`.`id_empleado` = `empleados`.`id`))) ;

-- ----------------------------
-- View structure for vista_configuracion_correo_global
-- ----------------------------
DROP VIEW IF EXISTS `vista_configuracion_correo_global`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_configuracion_correo_global` AS select `configuracion_global`.`id` AS `id`,`configuracion_global`.`correo_SMTP` AS `correo_SMTP`,`configuracion_global`.`servidor_SMTP` AS `servidor_SMTP`,`configuracion_global`.`puerto_SMTP` AS `puerto_SMTP`,`configuracion_global`.`autenticacion_SMTP` AS `autenticacion_SMTP`,`configuracion_global`.`usuario_SMTP` AS `usuario_SMTP`,`configuracion_global`.`password_SMTP` AS `password_SMTP`,`configuracion_global`.`seguridad_SMTP` AS `seguridad_SMTP` from `configuracion_global` ;

-- ----------------------------
-- View structure for vista_encuestas_respuestas
-- ----------------------------
DROP VIEW IF EXISTS `vista_encuestas_respuestas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_encuestas_respuestas` AS select `encuestas_respuestas`.`usuario` AS `id_encuesta`,if((`encuestas_respuestas`.`y` = 0),`encuestas_respuestas`.`respuesta`,0) AS `observaciones`,if((`encuestas_respuestas`.`y` = 1016),`encuestas_respuestas`.`valor_x`,0) AS `autoriza_pago`,if((`encuestas_respuestas`.`y` = 1108),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_1_conforme`,if((`encuestas_respuestas`.`y` = 1106),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_1_puntaje`,if((`encuestas_respuestas`.`y` = 1108),`encuestas_respuestas`.`respuesta`,0) AS `pregunta_1_respuesta`,if((`encuestas_respuestas`.`y` = 1014),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_2_conforme`,if((`encuestas_respuestas`.`y` = 1104),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_2_puntaje`,if((`encuestas_respuestas`.`y` = 1014),`encuestas_respuestas`.`respuesta`,0) AS `pregunta_2_respuesta`,if((`encuestas_respuestas`.`y` = 1012),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_3_conforme`,if((`encuestas_respuestas`.`y` = 1102),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_3_puntaje`,if((`encuestas_respuestas`.`y` = 1012),`encuestas_respuestas`.`respuesta`,0) AS `pregunta_3_respuesta`,if((`encuestas_respuestas`.`y` = 1010),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_4_conforme`,if((`encuestas_respuestas`.`y` = 1100),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_4_puntaje`,if((`encuestas_respuestas`.`y` = 1010),`encuestas_respuestas`.`respuesta`,0) AS `pregunta_4_respuesta`,if((`encuestas_respuestas`.`y` = 1008),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_5_conforme`,if((`encuestas_respuestas`.`y` = 1098),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_5_puntaje`,if((`encuestas_respuestas`.`y` = 1008),`encuestas_respuestas`.`respuesta`,0) AS `pregunta_5_respuesta`,if((`encuestas_respuestas`.`y` = 1006),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_6_conforme`,if((`encuestas_respuestas`.`y` = 1096),`encuestas_respuestas`.`valor_x`,0) AS `pregunta_6_puntaje`,if((`encuestas_respuestas`.`y` = 1006),`encuestas_respuestas`.`respuesta`,0) AS `pregunta_6_respuesta` from `encuestas_respuestas` where (`encuestas_respuestas`.`id_encuesta` = 163) ;

-- ----------------------------
-- View structure for vista_equipo_huerfano
-- ----------------------------
DROP VIEW IF EXISTS `vista_equipo_huerfano`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_equipo_huerfano` AS select `he`.`id_equipo` AS `id`,`he`.`fecha` AS `fecha`,`he`.`usuario` AS `usuario`,`i`.`activo` AS `activo`,`i`.`id_ubicacion` AS `id_ubicacion`,`i`.`codigo` AS `codigo`,`i`.`nombre_equipo` AS `nombre_equipo`,`he`.`observacion` AS `observacion` from (`inventarios` `i` join `historico_equipos` `he`) where ((`i`.`estado_equipo` = 3) and (`i`.`id_documento` = `he`.`id_evento`) and (`i`.`activo` = 1) and (`he`.`tipo` = 9) and (`i`.`id` = `he`.`id_equipo`)) group by `he`.`id_equipo` ;

-- ----------------------------
-- View structure for vista_eventos_empresas
-- ----------------------------
DROP VIEW IF EXISTS `vista_eventos_empresas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_eventos_empresas` AS select `pedido`.`id` AS `id`,`pedido`.`empresa` AS `empresa`,`pedido`.`id_empresa` AS `id_empresa`,`pedido`.`fecha_inicio` AS `fecha_inicio`,`pedido`.`fecha_documento` AS `fecha_documento`,if((`pedido`.`tipo_evento` = 0),1,0) AS `campo_1`,if((`pedido`.`tipo_evento` = 1),1,0) AS `campo_2`,if((`pedido`.`tipo_evento` = 2),1,0) AS `campo_3`,if((`pedido`.`tipo_evento` = 3),1,0) AS `campo_4` from `pedido` where ((`pedido`.`activo` = 1) and (`pedido`.`estado` = 3) and (`pedido`.`id_pedido_adicional` = '')) ;

-- ----------------------------
-- View structure for vista_eventos_para_horas_extras
-- ----------------------------
DROP VIEW IF EXISTS `vista_eventos_para_horas_extras`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_eventos_para_horas_extras` AS select `pedido_logistico_operarios`.`id_empleado` AS `id_empleado`,`pedido_logistico_operarios`.`nombre_empleado` AS `nombre_empleado`,'' AS `id_empleado2`,'' AS `empleado2`,`pedido`.`codigo_documento` AS `codigo_documento`,`pedido`.`nombre_evento` AS `nombre_evento`,`pedido`.`nombre_comercial` AS `nombre_comercial`,`pedido`.`fecha_entrega_instalacion` AS `fecha_entrega_instalacion`,`pedido`.`hora_entrega_instalacion` AS `hora_entrega_instalacion`,`pedido`.`fecha_inicio` AS `fecha_inicio`,`pedido`.`hora_inicio` AS `hora_inicio`,`pedido`.`fecha_final` AS `fecha_final`,`pedido`.`hora_final` AS `hora_final`,'OP' AS `tipo` from (`pedido_logistico_operarios` join `pedido` on((`pedido_logistico_operarios`.`id_pedido` = `pedido`.`id`))) union all select `pedido_logistico`.`id_conductor_envio` AS `id_empleado`,`pedido_logistico`.`conductor_envio` AS `nombre_empleado`,`pedido_logistico`.`id_conductor_por_recogida` AS `id_empleado2`,`pedido_logistico`.`conductor_por_recogida` AS `empleado2`,`pedido`.`codigo_documento` AS `codigo_documento`,`pedido`.`nombre_evento` AS `nombre_evento`,`pedido`.`nombre_comercial` AS `nombre_comercial`,`pedido`.`fecha_entrega_instalacion` AS `fecha_entrega_instalacion`,`pedido`.`hora_entrega_instalacion` AS `hora_entrega_instalacion`,`pedido`.`fecha_inicio` AS `fecha_inicio`,`pedido`.`hora_inicio` AS `hora_inicio`,`pedido`.`fecha_final` AS `fecha_final`,`pedido`.`hora_final` AS `hora_final`,'CO' AS `tipo` from (`pedido_logistico` join `pedido` on((`pedido_logistico`.`id_pedido` = `pedido`.`id`))) ;

-- ----------------------------
-- View structure for vista_formato_cotizacion
-- --
-- ----------------------------
-- View structure for vista_horas_extras
-- ----------------------------
DROP VIEW IF EXISTS `vista_horas_extras`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_horas_extras` AS select `vista_personal_entradas`.`fechas` AS `fechaE`,`vista_personal_entradas`.`horas` AS `horaE`,`vista_personal_salidas`.`fechas` AS `fechaS`,`vista_personal_salidas`.`hora` AS `horaS`,`vista_personal_entradas`.`cedula` AS `cedula` from (`vista_personal_entradas` join `vista_personal_salidas` on(((`vista_personal_entradas`.`cedula` = `vista_personal_salidas`.`cedula`) and (`vista_personal_entradas`.`fechas` = `vista_personal_salidas`.`fechas_entrada`)))) ;

-- ----------------------------
-- View structure for vista_informe_puntualidad_logistico
-- ----------------------------
DROP VIEW IF EXISTS `vista_informe_puntualidad_logistico`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_informe_puntualidad_logistico` AS select `pedido_logistico`.`id` AS `id`,`pedido_logistico`.`id_pedido` AS `id_pedido`,`pedido_logistico`.`estado_pedido` AS `estado_pedido`,`pedido_logistico`.`fecha_despacho` AS `fecha_despacho`,`pedido_logistico`.`hora_despacho` AS `hora_despacho`,`pedido`.`fecha_entrega_instalacion` AS `fecha_entrega_instalacion`,`pedido`.`hora_entrega_instalacion` AS `hora_entrega_instalacion`,`pedido_logistico`.`usuario_despacho` AS `usuario_despacho`,`pedido_logistico`.`despacho_atiempo` AS `despacho_atiempo`,`pedido_logistico`.`fecha_entrega` AS `fecha_entrega`,`pedido_logistico`.`hora_entrega` AS `hora_entrega`,`pedido`.`fecha_inicio` AS `fecha_inicio`,`pedido`.`hora_inicio` AS `hora_inicio`,`pedido_logistico`.`usuario_entrega` AS `usuario_entrega`,`pedido_logistico`.`entrega_atiempo` AS `entrega_atiempo`,`pedido`.`codigo_documento` AS `codigo_documento`,`pedido`.`empresa` AS `empresa`,`pedido`.`sucursal` AS `sucursal`,`pedido`.`bodega` AS `bodega`,`pedido`.`id_zona` AS `id_zona`,`pedido`.`id_sucursal` AS `id_sucursal`,`pedido`.`id_bodega` AS `id_bodega`,`pedido`.`id_empresa` AS `id_empresa`,`pedido_logistico`.`fecha_programado` AS `fecha_programado`,`pedido_logistico`.`hora_programado` AS `hora_programado`,`pedido_logistico`.`usuario_programo` AS `usuario_programo` from (`pedido_logistico` join `pedido` on((`pedido_logistico`.`id_pedido` = `pedido`.`id`))) where (`pedido_logistico`.`activo` = 1) ;

-- ----------------------------
-- View structure for vista_notificacion_cope
-- ----------------------------
DROP VIEW IF EXISTS `vista_notificacion_cope`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_notificacion_cope` AS select `configuracion_reunion_coope_notificacion`.`id` AS `id`,`configuracion_reunion_coope_notificacion`.`id_configuracion_reunion_coope` AS `id_configuracion_reunion_coope`,`configuracion_reunion_coope_notificacion`.`id_funcionario` AS `id_funcionario`,`configuracion_reunion_coope_notificacion`.`id_empresa` AS `id_empresa`,`configuracion_reunion_coope_notificacion`.`empresa` AS `empresa`,`configuracion_reunion_coope_notificacion`.`id_sucursal` AS `id_sucursal`,`configuracion_reunion_coope_notificacion`.`sucursal` AS `sucursal`,`configuracion_reunion_coope_notificacion`.`activo` AS `activo`,`empleados`.`nombre` AS `funcionario`,`empleados`.`email_empresa` AS `email` from (`configuracion_reunion_coope_notificacion` join `empleados` on((`configuracion_reunion_coope_notificacion`.`id_funcionario` = `empleados`.`id`))) ;

-- ----------------------------
-- View structure for vista_pedido_requerimientos_items_especiales
-- ----------------------------
DROP VIEW IF EXISTS `vista_pedido_requerimientos_items_especiales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pedido_requerimientos_items_especiales` AS select `pedido_requerimientos`.`id` AS `id`,`pedido_requerimientos`.`id_empresa` AS `id_empresa`,`pedido_requerimientos`.`id_intercambio` AS `id_intercambio`,`pedido_requerimientos`.`codigo_items` AS `codigo_items`,`pedido_requerimientos`.`nombre_items` AS `nombre_items`,`pedido_requerimientos`.`id_dia` AS `id_dia`,`pedido_requerimientos`.`Subtotal_Con_Descuento` AS `campo_total`,if((`pedido_requerimientos`.`codigo_items` = 3001020003),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_venta_equipos`,if((`pedido_requerimientos`.`codigo_items` = 2012010002),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_laapp`,if((left(`pedido_requerimientos`.`codigo_items`,6) = 200401),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_streaming`,if((left(`pedido_requerimientos`.`codigo_items`,6) = 200402),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_videoconferencia`,if((left(`pedido_requerimientos`.`codigo_items`,4) = 2001),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_traduccion_servicios`,if((left(`pedido_requerimientos`.`codigo_items`,4) = 2005),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_registro`,if((left(`pedido_requerimientos`.`codigo_items`,6) = 100202),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_traduccion_alquiler`,if((`pedido_requerimientos`.`codigo_items` = 1002010006),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_microfono_cuello_ganzo`,if(((`pedido_requerimientos`.`codigo_items` = 1001040005) or (`pedido_requerimientos`.`codigo_items` = 1001040007)),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_pantalla_led`,if((`pedido_requerimientos`.`codigo_items` = 2006010009),`pedido_requerimientos`.`Subtotal_Con_Descuento`,0) AS `campo_escenografia` from `pedido_requerimientos` where (((`pedido_requerimientos`.`codigo_items` like '200%') or (`pedido_requerimientos`.`codigo_items` like '100%') or (`pedido_requerimientos`.`codigo_items` = 2012010002) or (`pedido_requerimientos`.`codigo_items` = 3001020003) or (`pedido_requerimientos`.`codigo_items` = 1002010006) or (`pedido_requerimientos`.`codigo_items` = 1001040005) or (`pedido_requerimientos`.`codigo_items` = 1001040007) or (`pedido_requerimientos`.`codigo_items` = 2006010009)) and (`pedido_requerimientos`.`activo` = 1)) ;

-- ----------------------------
-- View structure for vista_pedido_totales
-- ----------------------------
DROP VIEW IF EXISTS `vista_pedido_totales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_pedido_totales` AS select `pedido`.`id` AS `id`,sum(`pedido_requerimientos`.`Subtotal_Con_Descuento`) AS `Subtotal_Con_Descuento`,sum(`pedido_requerimientos`.`valor_impuesto`) AS `valor_impuesto`,`pedido_requerimientos`.`valor_descuento` AS `valor_descuento`,`pedido_requerimientos`.`Subtotal_Sin_Descuento` AS `Subtotal_Sin_Descuento`,`pedido`.`fecha_inicio` AS `fecha_inicio`,`pedido`.`observacion_facturacion` AS `observacion_facturacion` from (`pedido` join `pedido_requerimientos` on((`pedido`.`id` = `pedido_requerimientos`.`id_intercambio`))) where (`pedido`.`estado` = 3) group by `pedido`.`id` ;

-- ----------------------------
-- View structure for vista_personal_entradas
-- ----------------------------
DROP VIEW IF EXISTS `vista_personal_entradas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_personal_entradas` AS select `empleados_registro`.`cedula` AS `cedula`,`empleados_registro`.`fecha` AS `fechas`,`empleados_registro`.`hora` AS `horas` from `empleados_registro` where (`empleados_registro`.`tipo` = 'in') ;

-- ----------------------------
-- View structure for vista_personal_salidas
-- ----------------------------
DROP VIEW IF EXISTS `vista_personal_salidas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_personal_salidas` AS select `empleados_registro`.`cedula` AS `cedula`,if((`empleados_registro`.`hora` > '11:59:59'),`empleados_registro`.`fecha`,(`empleados_registro`.`fecha` - interval 1 day)) AS `fechas_entrada`,`empleados_registro`.`fecha` AS `fechas`,`empleados_registro`.`hora` AS `hora` from `empleados_registro` where (`empleados_registro`.`tipo` = 'out') ;

-- ----------------------------
-- View structure for vista_sucursales_empresas
-- ----------------------------
DROP VIEW IF EXISTS `vista_sucursales_empresas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_sucursales_empresas` AS select `empresas_sucursales`.`id` AS `id_sucursal`,`empresas_sucursales`.`nombre` AS `sucursal`,`empresas`.`nombre` AS `empresa`,`empresas`.`region` AS `region`,`empresas`.`id` AS `id_empresa`,`empresas`.`id_pais` AS `id_pais`,`empresas`.`pais` AS `pais`,`empresas`.`id_moneda` AS `id_moneda`,`empresas`.`decimales_moneda` AS `decimales_moneda`,`empresas`.`simbolo_moneda` AS `simbolo_moneda`,`empresas_sucursales`.`zona` AS `zona`,`empresas_sucursales`.`zona_nombre` AS `zona_nombre`,`empresas`.`zona_horaria` AS `zona_horaria` from (`empresas_sucursales` join `empresas` on((`empresas`.`id` = `empresas_sucursales`.`id_empresa`))) where (`empresas_sucursales`.`activo` = 1) ;

-- ----------------------------
-- View structure for vista_terceros_promedios_encuestas
-- ----------------------------
DROP VIEW IF EXISTS `vista_terceros_promedios_encuestas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vista_terceros_promedios_encuestas` AS select `T`.`id` AS `id`,`T`.`tipo` AS `tipo`,`T`.`id_tipo_identificacion` AS `id_tipo_identificacion`,`T`.`tipo_identificacion` AS `tipo_identificacion`,`T`.`estado_proveedor` AS `estado_proveedor`,`T`.`tarifario` AS `tarifario`,`T`.`nombre` AS `nombre`,`T`.`numero_identificacion` AS `numero_identificacion`,`T`.`direccion` AS `direccion`,`T`.`telefono1` AS `telefono1`,`T`.`pais` AS `pais`,`T`.`departamento` AS `departamento`,`T`.`ciudad` AS `ciudad`,`T`.`iso2` AS `iso2`,`T`.`activo` AS `activo`,round(avg(`EU`.`promedio`),2) AS `promedio`,min(`EU`.`minimo`) AS `minimo` from (`terceros` `T` left join `encuestas_usuarios_online` `EU` on(((`EU`.`usuario` = `T`.`numero_identificacion`) and if(((month(now()) >= 1) and (month(now()) <= 6)),(`EU`.`fecha` between concat(year(now()),'-01-01 00:00:00') and concat(year(now()),'-06-30 23:59:59')),(`EU`.`fecha` between concat(year(now()),'-07-01 00:00:00') and concat(year(now()),'-12-31 23:59:59')))))) where ((`T`.`activo` = 1) and (`T`.`tipo_proveedor` = 'Si') and (`T`.`proveedor_subcontratacion` = 'Si')) group by `T`.`id` ;

-- ----------------------------
-- View structure for vista_usuarios_permiso_autorizar_equipos_ingreso
-- ----------------------------
DROP VIEW IF EXISTS `vista_usuarios_permiso_autorizar_equipos_ingreso`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuarios_permiso_autorizar_equipos_ingreso` AS select `empleados`.`id` AS `id`,`empleados`.`nombre` AS `nombre`,`empleados`.`email_empresa` AS `email_empresa` from (`empleados` join `empleados_roles_permisos` on((`empleados`.`id_rol` = `empleados_roles_permisos`.`id_rol`))) where (`empleados_roles_permisos`.`id_permiso` = 66) ;

-- ----------------------------
-- Procedure structure for InsertLogs
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertLogs`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `InsertLogs`(`tabla` varchar(255),`campo` varchar(255),`id` int(11),`tipo`varchar(255),`oldData` varchar(255),`newData` varchar(255),`id_usuario`int(11))
BEGIN
		INSERT INTO logs_mysql (tabla,campo,id_registro,tipo,oldData,newData,id_usuario,fecha)VALUES(tabla,campo,id,tipo,oldData,newData,id_usuario,NOW()); 
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for ObtenerActualizarConsecutivoInventario
-- ----------------------------
DROP FUNCTION IF EXISTS `ObtenerActualizarConsecutivoInventario`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ObtenerActualizarConsecutivoInventario`() RETURNS int(11)
BEGIN
    DECLARE nLast_val INT; 
 
    SET nLast_val =  (SELECT consecutivo FROM inventario_consecutivo);
		UPDATE inventario_consecutivo SET consecutivo = nLast_val + 1;
 
    SET @ret = nLast_val;
    RETURN @ret;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for ObtenerInventarioOut
-- ----------------------------
DROP FUNCTION IF EXISTS `ObtenerInventarioOut`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `ObtenerInventarioOut`(`codigo_equipo` text(20)) RETURNS int(11)
BEGIN
		DECLARE nLast_val INT;
		SET nLast_val =  (SELECT id FROM inventarios_vista WHERE codigo=@codigo_equipo);
 
    SET @ret = nLast_val;
    RETURN @ret;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for Retorna_Minutos
-- ----------------------------
DROP FUNCTION IF EXISTS `Retorna_Minutos`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `Retorna_Minutos`(`horai` time,`horaf` time) RETURNS int(11)
BEGIN
		DECLARE MINUTOS INT(11); 

		SET MINUTOS =  (TIME_TO_SEC(horaf) - TIME_TO_SEC(horai))/60;

		RETURN MINUTOS;
#    '08:00:00','09:00:00
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERT_calendario`;
DELIMITER ;;
CREATE TRIGGER `INSERT_calendario` BEFORE INSERT ON `calendario` FOR EACH ROW BEGIN

     SET NEW.icono = (SELECT icono FROM crm_configuracion_actividades WHERE id = NEW.tipo );
     SET NEW.empleado=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_empleado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `UPDATE_calendario`;
DELIMITER ;;
CREATE TRIGGER `UPDATE_calendario` BEFORE UPDATE ON `calendario` FOR EACH ROW BEGIN

     SET NEW.icono = (SELECT icono FROM crm_configuracion_actividades WHERE id = NEW.tipo );
     SET NEW.empleado=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_empleado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calendario_notificaciones_personasINSERT`;
DELIMITER ;;
CREATE TRIGGER `calendario_notificaciones_personasINSERT` BEFORE INSERT ON `calendario_notificaciones_personas` FOR EACH ROW BEGIN

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `calendario_personasINSERT`;
DELIMITER ;;
CREATE TRIGGER `calendario_personasINSERT` BEFORE INSERT ON `calendario_personas` FOR EACH ROW BEGIN

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_logINSERT`;
DELIMITER ;;
CREATE TRIGGER `compras_logINSERT` BEFORE INSERT ON `compras_log` FOR EACH ROW BEGIN

IF NEW.tipo_documento ='requisicion' THEN
SET NEW.consecutivo = (SELECT consecutivo FROM compras_requisiciones  WHERE id=NEW.id_documento  LIMIT 0,1);
END IF;
  
IF NEW.tipo_documento ='documento maestro' THEN
SET NEW.consecutivo = (SELECT consecutivo FROM compras_maestros  WHERE id=NEW.id_documento  LIMIT 0,1);
END IF;

IF NEW.tipo_documento ='orden de compra' THEN
SET NEW.consecutivo = (SELECT consecutivo FROM compras_ordenes  WHERE id=NEW.id_documento  LIMIT 0,1);
END IF;

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario  LIMIT 0,1);
SET NEW.empresa=(SELECT nombre FROM empresas WHERE id=NEW.id_empresa LIMIT 0,1);
SET NEW.sucursal=(SELECT nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal  LIMIT 0,1);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_logUPDATE`;
DELIMITER ;;
CREATE TRIGGER `compras_logUPDATE` BEFORE UPDATE ON `compras_log` FOR EACH ROW BEGIN

IF NEW.tipo_documento ='requisicion' THEN
SET NEW.consecutivo = (SELECT consecutivo FROM compras_requisiciones  WHERE id=NEW.id_documento  LIMIT 0,1);
END IF;
  
IF NEW.tipo_documento ='documento maestro' THEN
SET NEW.consecutivo = (SELECT consecutivo FROM compras_maestros  WHERE id=NEW.id_documento  LIMIT 0,1);
END IF;

IF NEW.tipo_documento ='orden de compra' THEN
SET NEW.consecutivo = (SELECT consecutivo FROM compras_ordenes  WHERE id=NEW.id_documento  LIMIT 0,1);
END IF;

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario  LIMIT 0,1);
SET NEW.empresa=(SELECT nombre FROM empresas WHERE id=NEW.id_empresa LIMIT 0,1);
SET NEW.sucursal=(SELECT nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal  LIMIT 0,1);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_maestros_INSERT`;
DELIMITER ;;
CREATE TRIGGER `compras_maestros_INSERT` BEFORE INSERT ON `compras_maestros` FOR EACH ROW BEGIN

SET NEW.fecha_registro =now();
SET NEW.sucursal=(SELECT nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal );
SET NEW.bodega=(SELECT nombre FROM empresas_sucursales_bodegas WHERE id=NEW.id_bodega );
SET NEW.nit =(SELECT numero_identificacion FROM terceros WHERE id=NEW.id_cliente);
SET NEW.cliente =(SELECT nombre FROM terceros WHERE id=NEW.id_cliente);
SET NEW.documento_vendedor =(SELECT documento FROM empleados WHERE id=NEW.id_vendedor);
SET NEW.nombre_vendedor =(SELECT nombre FROM empleados WHERE id=NEW.id_vendedor);
SET NEW.sucursal_cliente =(SELECT direccion FROM terceros_direcciones WHERE id=NEW.id_sucursal_cliente);
SET NEW.consecutivo_requisicion = (SELECT consecutivo FROM compras_requisiciones WHERE id=NEW.id_requisicion);

SET NEW.contacto_plataforma =  (SELECT nombre FROM empleados WHERE id=NEW.id_contacto LIMIT 0,1);

SET NEW.exento_iva = (SELECT exento_iva FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);

SET @id_vendedor=(SELECT id FROM empleados WHERE activo=1 AND id_empresa=NEW.id_empresa AND documento=NEW.documento_vendedor);
IF @id_vendedor = '' OR ISNULL( @id_vendedor ) THEN
       SET NEW.id_vendedor=0;
ELSE
       SET NEW.id_vendedor=@id_vendedor ;
END IF;

SET NEW.documento_usuario=(SELECT documento FROM empleados WHERE activo=1  AND id=NEW.id_usuario);
SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_maestros_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `compras_maestros_UPDATE` BEFORE UPDATE ON `compras_maestros` FOR EACH ROW BEGIN

SET NEW.cliente = (SELECT nombre FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);
SET NEW.nit = (SELECT numero_identificacion FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);
SET NEW.exento_iva = (SELECT exento_iva FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);

SET NEW.contacto_plataforma =  (SELECT nombre FROM empleados WHERE id=NEW.id_contacto LIMIT 0,1);

IF OLD.estado = 0 AND NEW.estado = 1 THEN SET NEW.fecha_genera_maestro=NOW();
END IF;

#SET NEW.codigo_centro_costo = (SELECT codigo FROM centro_costos WHERE id=NEW.id_centro_costo AND id_empresa=NEW.id_empresa AND activo=1 LIMIT 0,1);
#SET NEW.centro_costo = (SELECT nombre FROM centro_costos WHERE id=NEW.id_centro_costo AND id_empresa=NEW.id_empresa AND activo=1 LIMIT 0,1);

#CONSECUTIVO DOCUMENTO
IF OLD.estado = 0 AND new.estado = 1 AND (OLD.consecutivo<1 OR ISNULL(OLD.consecutivo)) THEN
     SET NEW.consecutivo=(SELECT consecutivo FROM compras_maestros WHERE id_empresa=NEW.id_empresa ORDER BY consecutivo DESC LIMIT 0,1);

     IF NEW.consecutivo > 0 THEN  SET NEW.consecutivo = NEW.consecutivo+1;
     ELSE  SET NEW.consecutivo=1; 
     END IF;
END IF;

SET @id_vendedor=(SELECT id FROM empleados WHERE activo=1 AND id_empresa=NEW.id_empresa AND documento=NEW.documento_vendedor);
IF @id_vendedor = '' OR ISNULL( @id_vendedor ) THEN
       SET NEW.id_vendedor=0;
ELSE
       SET NEW.id_vendedor=@id_vendedor ;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_maestros_invertario_INSERT`;
DELIMITER ;;
CREATE TRIGGER `compras_maestros_invertario_INSERT` BEFORE INSERT ON `compras_maestros_inventario` FOR EACH ROW BEGIN

    DECLARE id_empresa INTEGER;
    DECLARE id_sucursal INTEGER;
    DECLARE id_bodega INTEGER;

    SET NEW.codigo= (SELECT codigo FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
    SET NEW.obs_proveedores= (SELECT obs_proveedores FROM items WHERE id=NEW.id_inventario LIMIT 0,1);      
   
    SET NEW.proveedor= (SELECT nombre FROM terceros WHERE id=NEW.id_proveedor LIMIT 0,1);


    #SET NEW.id_impuesto=(SELECT id_impuesto FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
    #SET NEW.impuesto= (SELECT impuesto FROM impuestos WHERE id=NEW.id_impuesto LIMIT 0,1);

    #IF ISNULL(NEW.valor_impuesto) THEN
        #SET NEW.valor_impuesto= (SELECT valor FROM impuestos WHERE id=NEW.id_impuesto LIMIT 0,1);
    #END IF;

   # IF NEW.id_orden > 0 THEN
   #     SET NEW.consecutivo_orden= (SELECT consecutivo FROM compras_ordenes WHERE id=NEW.id_orden LIMIT 0,1);
    # END IF;
        
    SET id_empresa = (SELECT id_empresa FROM compras_maestros WHERE id=NEW.id_maestro);
    SET id_sucursal = (SELECT id_sucursal FROM compras_maestros WHERE id=NEW.id_maestro);
    #SET id_bodega = (SELECT id_bodega FROM compras_maestros WHERE id=NEW.id_maestro);

    SET NEW.cant_item_pedido = (SELECT cantidad FROM pedido_requerimientos WHERE id = NEW.id_item_pedido);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_maestros_invertario_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `compras_maestros_invertario_UPDATE` BEFORE UPDATE ON `compras_maestros_inventario` FOR EACH ROW BEGIN

    DECLARE id_empresa INTEGER;
    DECLARE id_sucursal INTEGER;
    DECLARE id_bodega INTEGER;

    SET NEW.codigo= (SELECT codigo FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
    SET NEW.obs_proveedores= (SELECT obs_proveedores FROM items WHERE id=NEW.id_inventario LIMIT 0,1);      
    SET NEW.proveedor= (SELECT nombre FROM terceros WHERE id=NEW.id_proveedor LIMIT 0,1);

    #SET NEW.id_impuesto=(SELECT id_impuesto FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
    #SET NEW.impuesto= (SELECT impuesto FROM impuestos WHERE id=NEW.id_impuesto LIMIT 0,1);

    #IF ISNULL(NEW.valor_impuesto) THEN
        #SET NEW.valor_impuesto= (SELECT valor FROM impuestos WHERE id=NEW.id_impuesto LIMIT 0,1);
    #END IF;

   # IF NEW.id_orden > 0 THEN
         
   #     SET NEW.consecutivo_orden= (SELECT consecutivo FROM compras_ordenes WHERE id=NEW.id_orden LIMIT 0,1);
   # END IF;
 
  #  SET NEW.consecutivo_orden= (SELECT consecutivo FROM compras_ordenes WHERE id=NEW.id_orden LIMIT 0,1);
   
        
    SET id_empresa = (SELECT id_empresa FROM compras_maestros WHERE id=NEW.id_maestro);
    SET id_sucursal = (SELECT id_sucursal FROM compras_maestros WHERE id=NEW.id_maestro);
    #SET id_bodega = (SELECT id_bodega FROM compras_maestros WHERE id=NEW.id_maestro);

    #SET NEW.costo_inventario=(SELECT costos FROM inventario_totales WHERE id_item=NEW.id_inventario  AND id_empresa=id_empresa AND id_sucursal=id_sucursal AND id_ubicacion=id_bodega AND activo=1 GROUP BY id LIMIT 0,1);
    SET NEW.cant_item_pedido = (SELECT cantidad FROM pedido_requerimientos WHERE id = NEW.id_item_pedido);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_ordenes_INSERT`;
DELIMITER ;;
CREATE TRIGGER `compras_ordenes_INSERT` BEFORE INSERT ON `compras_ordenes` FOR EACH ROW BEGIN

DECLARE varFormaPago int;
DECLARE varCuentaProveedor int;

SET varFormaPago = (SELECT id_forma_pago FROM terceros_ficha_tecnica WHERE id_tercero = NEW.id_proveedor LIMIT 0,1);

IF varFormaPago > 0 THEN SET NEW.id_forma_pago_proveedor = varFormaPago;
ELSE SET NEW.id_forma_pago_proveedor = (SELECT id FROM configuracion_formas_pago WHERE plazo=90 LIMIT 0,1);
END IF;

SET varCuentaProveedor =  (SELECT numero_cuenta FROM terceros_ficha_tecnica WHERE id_tercero = NEW.id_proveedor LIMIT 0,1);

IF varCuentaProveedor > 0 THEN
SET NEW.cuenta_proveedor = varCuentaProveedor;
ELSE SET NEW.cuenta_proveedor = '';
END IF;

SET NEW.forma_pago_proveedor= (SELECT nombre FROM configuracion_formas_pago WHERE id = NEW.id_forma_pago_proveedor LIMIT 0,1);

SET NEW.fecha_registro =now();
SET NEW.empresa=(SELECT nombre FROM empresas WHERE id=NEW.id_empresa LIMIT 0,1);
SET NEW.id_zona_oc =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.zona_oc =  (SELECT zona_nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.sucursal=(SELECT nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal );
SET NEW.bodega=(SELECT nombre FROM empresas_sucursales_bodegas WHERE id=NEW.id_bodega );
SET NEW.nit =(SELECT numero_identificacion FROM terceros WHERE id=NEW.id_cliente);
SET NEW.cliente =(SELECT nombre FROM terceros WHERE id=NEW.id_cliente);
SET NEW.documento_vendedor =(SELECT documento FROM empleados WHERE id=NEW.id_vendedor);
SET NEW.nombre_vendedor =(SELECT nombre FROM empleados WHERE id=NEW.id_vendedor);
SET NEW.sucursal_cliente =(SELECT direccion FROM terceros_direcciones WHERE id=NEW.id_sucursal_cliente);
SET NEW.consecutivo_maestro = (SELECT consecutivo FROM compras_maestros WHERE id=NEW.id_maestro);

SET NEW.contacto_plataforma =  (SELECT nombre FROM empleados WHERE id=NEW.id_contacto LIMIT 0,1);

SET NEW.nit_proveedor =(SELECT numero_identificacion FROM terceros WHERE id=NEW.id_proveedor);

SET NEW.proveedor =(SELECT nombre FROM terceros WHERE id=NEW.id_proveedor);

SET NEW.id_zona =(SELECT zona_comercial FROM terceros WHERE id=NEW.id_proveedor);

SET NEW.zona =(SELECT nombre FROM terceros_zona_comercial WHERE id=NEW.id_zona);

SET NEW.exento_iva = (SELECT exento_iva FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);

SET @id_vendedor=(SELECT id FROM empleados WHERE activo=1 AND id_empresa=NEW.id_empresa AND documento=NEW.documento_vendedor);
IF @id_vendedor = '' OR ISNULL( @id_vendedor ) THEN
       SET NEW.id_vendedor=0;
ELSE
       SET NEW.id_vendedor=@id_vendedor ;
END IF;

SET NEW.documento_usuario=(SELECT documento FROM empleados WHERE activo=1  AND id=NEW.id_usuario);

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);

SET NEW.fecha_orden_pedido = (SELECT fecha_hora_real FROM pedido_orden WHERE id_pedido = NEW.id_pedido ORDER BY id DESC LIMIT 0,1);

#SI LA OC FUE REALIZADA POR UNA SOLICITUD DE REQUISICION A DESTIEMPO
SET NEW.oc_destiempo = (SELECT solicitud_oc_destiempo FROM pedido WHERE id = NEW.id_pedido);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_ordenes_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `compras_ordenes_UPDATE` BEFORE UPDATE ON `compras_ordenes` FOR EACH ROW BEGIN

DECLARE varFormaPago int;
DECLARE varCuentaProveedor int;
DECLARE remision INT;

SET NEW.empresa=(SELECT nombre FROM empresas WHERE id=NEW.id_empresa LIMIT 0,1);


SET varFormaPago = (SELECT id_forma_pago FROM terceros_ficha_tecnica WHERE id_tercero = NEW.id_proveedor LIMIT 0,1);

IF varFormaPago > 0 THEN SET NEW.id_forma_pago_proveedor = varFormaPago;
ELSE SET NEW.id_forma_pago_proveedor = (SELECT id FROM configuracion_formas_pago WHERE plazo=90 LIMIT 0,1);
END IF;


SET varCuentaProveedor =  (SELECT numero_cuenta FROM terceros_ficha_tecnica WHERE id_tercero = NEW.id_proveedor LIMIT 0,1);

IF varCuentaProveedor > 0 THEN SET NEW.cuenta_proveedor = varCuentaProveedor;
ELSE SET NEW.cuenta_proveedor = '';
END IF;


SET NEW.forma_pago_proveedor= (SELECT nombre FROM configuracion_formas_pago WHERE id = NEW.id_forma_pago_proveedor LIMIT 0,1);

SET NEW.cliente = (SELECT nombre FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);

SET NEW.nit = (SELECT numero_identificacion FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);
SET NEW.exento_iva = (SELECT exento_iva FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);

SET NEW.contacto_plataforma =  (SELECT nombre FROM empleados WHERE id=NEW.id_contacto LIMIT 0,1);

SET NEW.nit_proveedor =(SELECT numero_identificacion FROM terceros WHERE id=NEW.id_proveedor);
SET NEW.consecutivo_maestro = (SELECT consecutivo FROM compras_maestros WHERE id=NEW.id_maestro);

SET NEW.proveedor =(SELECT nombre FROM terceros WHERE id=NEW.id_proveedor);

SET NEW.id_zona =(SELECT zona_comercial FROM terceros WHERE id=NEW.id_proveedor);

SET NEW.zona =(SELECT nombre FROM terceros_zona_comercial WHERE id=NEW.id_zona);

#SET NEW.codigo_centro_costo = (SELECT codigo FROM centro_costos WHERE id=NEW.id_centro_costo AND id_empresa=NEW.id_empresa AND activo=1 LIMIT 0,1);
#SET NEW.centro_costo = (SELECT nombre FROM centro_costos WHERE id=NEW.id_centro_costo AND id_empresa=NEW.id_empresa AND activo=1 LIMIT 0,1);

#CONSECUTIVO DOCUMENTO
IF OLD.estado = 0 AND new.estado = 1 AND (OLD.consecutivo<1 OR ISNULL(OLD.consecutivo)) THEN
     SET NEW.consecutivo=(SELECT consecutivo FROM compras_ordenes WHERE id_empresa=NEW.id_empresa ORDER BY consecutivo DESC LIMIT 0,1);
     SET NEW.fecha_genera_orden=NOW();

     IF NEW.consecutivo > 0 THEN  SET NEW.consecutivo = NEW.consecutivo+1;
     ELSE  SET NEW.consecutivo=1; 
     END IF;
END IF;

SET @id_vendedor=(SELECT id FROM empleados WHERE activo=1 AND id_empresa=NEW.id_empresa AND documento=NEW.documento_vendedor);
IF @id_vendedor = '' OR ISNULL( @id_vendedor ) THEN
       SET NEW.id_vendedor=0;
ELSE
       SET NEW.id_vendedor=@id_vendedor ;
END IF;

SET NEW.usuario_validacion=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario_validacion);
SET NEW.usuario_contabilidad=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario_contabilidad);

#SET NEW.fecha_orden_pedido = (SELECT fecha_hora_real FROM pedido_orden WHERE id_pedido = NEW.id_pedido ORDER BY id DESC LIMIT 0,1);

SET remision = (SELECT COUNT(id) AS CONT FROM pedido WHERE  id_remision_erp IS NOT NULL AND id =  NEW.id_pedido LIMIT 0,1);

IF(remision > 0 AND (ISNULL(OLD.id_remision_pedido) OR OLD.id_remision_pedido < 1)) THEN
      SET NEW.id_remision_pedido = (SELECT id_remision_erp FROM pedido WHERE id = NEW.id_pedido ORDER BY id DESC LIMIT 0,1);
      SET NEW.remision_pedido = (SELECT numero_remision_erp FROM pedido WHERE id = NEW.id_pedido ORDER BY id DESC LIMIT 0,1);       
END IF;

SET NEW.tipo_evento = (SELECT tipo_evento FROM pedido WHERE id = NEW.id_pedido ORDER BY id DESC LIMIT 0,1);
SET NEW.id_zona_oc =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.zona_oc =  (SELECT zona_nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.id_bodega = (SELECT id_bodega FROM pedido WHERE id = NEW.id_pedido ORDER BY id DESC LIMIT 0,1);
SET NEW.bodega = (SELECT bodega FROM pedido WHERE id = NEW.id_pedido ORDER BY id DESC LIMIT 0,1);
SET NEW.nombre_solicitud_evaluacion =(SELECT nombre FROM empleados WHERE id=NEW.usuario_solicitud_evaluacion);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_ordenes_envios_insert_copy`;
DELIMITER ;;
CREATE TRIGGER `compras_ordenes_envios_insert_copy` BEFORE INSERT ON `compras_ordenes_envios_log` FOR EACH ROW BEGIN

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
SET NEW.proveedor=(SELECT nombre FROM terceros WHERE activo=1 AND id=NEW.id_proveedor);
SET NEW.consecutivo=(SELECT consecutivo FROM compras_ordenes WHERE activo=1 AND id=NEW.id_orden);
SET NEW.id_empresa =(SELECT id_empresa FROM compras_ordenes WHERE activo=1 AND id=NEW.id_orden);
SET NEW.id_sucursal =(SELECT id_sucursal FROM compras_ordenes WHERE activo=1 AND id=NEW.id_orden);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_ordenes_validaciones_insert`;
DELIMITER ;;
CREATE TRIGGER `compras_ordenes_validaciones_insert` BEFORE INSERT ON `compras_ordenes_validaciones_log` FOR EACH ROW BEGIN

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
SET NEW.consecutivo=(SELECT consecutivo FROM compras_ordenes WHERE activo=1 AND id=NEW.id_orden);
SET NEW.id_empresa =(SELECT id_empresa FROM compras_ordenes WHERE activo=1 AND id=NEW.id_orden);
SET NEW.id_sucursal =(SELECT id_sucursal FROM compras_ordenes WHERE activo=1 AND id=NEW.id_orden);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_requisicion_rechazos`;
DELIMITER ;;
CREATE TRIGGER `compras_requisicion_rechazos` BEFORE INSERT ON `compras_requisicion_rechazos` FOR EACH ROW BEGIN

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id_empresa=NEW.id_empresa AND id=NEW.id_usuario);
SET NEW.consecutivo=(SELECT consecutivo FROM compras_requisiciones WHERE activo=1 AND id_empresa=NEW.id_empresa AND id=NEW.id_requisicion);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_requisiciones_INSERT`;
DELIMITER ;;
CREATE TRIGGER `compras_requisiciones_INSERT` BEFORE INSERT ON `compras_requisiciones` FOR EACH ROW BEGIN

SET NEW.fecha_registro =now();
SET NEW.sucursal=(SELECT nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal );
SET NEW.bodega=(SELECT nombre FROM empresas_sucursales_bodegas WHERE id=NEW.id_bodega );
SET NEW.nit =(SELECT numero_identificacion FROM terceros WHERE id=NEW.id_cliente);
SET NEW.cliente =(SELECT nombre FROM terceros WHERE id=NEW.id_cliente);
SET NEW.documento_vendedor =(SELECT documento FROM empleados WHERE id=NEW.id_vendedor);
SET NEW.nombre_vendedor =(SELECT nombre FROM empleados WHERE id=NEW.id_vendedor);
SET NEW.sucursal_cliente =(SELECT direccion FROM terceros_direcciones WHERE id=NEW.id_sucursal_cliente);

SET NEW.exento_iva = (SELECT exento_iva FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);

SET @id_vendedor=(SELECT id FROM empleados WHERE activo=1 AND id_empresa=NEW.id_empresa AND documento=NEW.documento_vendedor);
IF @id_vendedor = '' OR ISNULL( @id_vendedor ) THEN
       SET NEW.id_vendedor=0;
ELSE
       SET NEW.id_vendedor=@id_vendedor ;
END IF;

SET NEW.documento_usuario=(SELECT documento FROM empleados WHERE activo=1  AND id=NEW.id_usuario);
SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_requisiciones_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `compras_requisiciones_UPDATE` BEFORE UPDATE ON `compras_requisiciones` FOR EACH ROW BEGIN

SET NEW.cliente = (SELECT nombre FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);
SET NEW.nit = (SELECT numero_identificacion FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);
SET NEW.exento_iva = (SELECT exento_iva FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);

SET NEW.contacto_plataforma =  (SELECT nombre FROM empleados WHERE id=NEW.id_contacto LIMIT 0,1);

IF NEW.id_color_prioridad > 0 THEN
     SET NEW.color_prioridad = (SELECT color FROM compras_requisicion_color WHERE id=NEW.id_color_prioridad LIMIT 0,1);
     SET NEW.prioridad = (SELECT nombre FROM compras_requisicion_color WHERE id=NEW.id_color_prioridad LIMIT 0,1);
END IF;

#SET NEW.codigo_centro_costo = (SELECT codigo FROM centro_costos WHERE id=NEW.id_centro_costo AND id_empresa=NEW.id_empresa AND activo=1 LIMIT 0,1);
#SET NEW.centro_costo = (SELECT nombre FROM centro_costos WHERE id=NEW.id_centro_costo AND id_empresa=NEW.id_empresa AND activo=1 LIMIT 0,1);

#CONSECUTIVO DOCUMENTO
IF OLD.estado = 0 AND new.estado = 1 AND (OLD.consecutivo<1 OR ISNULL(OLD.consecutivo)) THEN
     SET NEW.consecutivo=(SELECT consecutivo FROM compras_requisiciones WHERE id_empresa=NEW.id_empresa ORDER BY consecutivo DESC LIMIT 0,1);

     IF NEW.consecutivo > 0 THEN  SET NEW.consecutivo = NEW.consecutivo+1;
     ELSE  SET NEW.consecutivo=1; 
     END IF;
END IF;

IF OLD.estado = 0 AND NEW.estado = 1 THEN SET NEW.fecha_genera_requisicion=NOW();
END IF;

SET @id_vendedor=(SELECT id FROM empleados WHERE activo=1 AND id_empresa=NEW.id_empresa AND documento=NEW.documento_vendedor);
IF @id_vendedor = '' OR ISNULL( @id_vendedor ) THEN
       SET NEW.id_vendedor=0;
ELSE
       SET NEW.id_vendedor=@id_vendedor ;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_requisiciones_invertario_INSERT`;
DELIMITER ;;
CREATE TRIGGER `compras_requisiciones_invertario_INSERT` BEFORE INSERT ON `compras_requisiciones_inventario` FOR EACH ROW BEGIN

    DECLARE id_empresa INTEGER;
    DECLARE id_sucursal INTEGER;
    DECLARE id_bodega INTEGER;

    SET NEW.codigo= (SELECT codigo FROM items WHERE id=NEW.id_inventario LIMIT 0,1);  
    SET NEW.obs_proveedores= (SELECT obs_proveedores FROM items WHERE id=NEW.id_inventario LIMIT 0,1);      
    SET NEW.proveedor= (SELECT nombre FROM terceros WHERE id=NEW.id_proveedor LIMIT 0,1);


    #SET NEW.id_impuesto=(SELECT id_impuesto FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
    #SET NEW.impuesto= (SELECT impuesto FROM impuestos WHERE id=NEW.id_impuesto LIMIT 0,1);

    #IF ISNULL(NEW.valor_impuesto) THEN
        #SET NEW.valor_impuesto= (SELECT valor FROM impuestos WHERE id=NEW.id_impuesto LIMIT 0,1);
    #END IF;
        
   # SET NEW.inventariable = (SELECT inventariable FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
    #SET NEW.id_unidad_medida=(SELECT id_unidad_medida FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
   # SET NEW.nombre_unidad_medida=(SELECT nombre FROM inventario_unidades WHERE id=NEW.id_unidad_medida LIMIT 0,1);
    #SET NEW.cantidad_unidad_medida=(SELECT unidades FROM inventario_unidades WHERE id=NEW.id_unidad_medida LIMIT 0,1);

    SET id_empresa = (SELECT id_empresa FROM compras_requisiciones WHERE id=NEW.id_requisicion);
    SET id_sucursal = (SELECT id_sucursal FROM compras_requisiciones WHERE id=NEW.id_requisicion);
    #SET id_bodega = (SELECT id_bodega FROM compras_requisiciones WHERE id=NEW.id_requisicion);

    #SET NEW.costo_inventario=(SELECT costos FROM inventario_totales WHERE id_item=NEW.id_inventario  AND id_empresa=id_empresa AND id_sucursal=id_sucursal AND id_ubicacion=id_bodega AND activo=1 GROUP BY id LIMIT 0,1);
    SET NEW.cant_item_pedido = (SELECT cantidad FROM pedido_requerimientos WHERE id = NEW.id_item_pedido);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `compras_requisiciones_invertario_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `compras_requisiciones_invertario_UPDATE` BEFORE UPDATE ON `compras_requisiciones_inventario` FOR EACH ROW BEGIN

    DECLARE id_empresa INTEGER;
    DECLARE id_sucursal INTEGER;
    DECLARE id_bodega INTEGER;

    SET NEW.codigo= (SELECT codigo FROM items WHERE id=NEW.id_inventario LIMIT 0,1);  
    SET NEW.obs_proveedores= (SELECT obs_proveedores FROM items WHERE id=NEW.id_inventario LIMIT 0,1);      
    SET NEW.proveedor= (SELECT nombre FROM terceros WHERE id=NEW.id_proveedor LIMIT 0,1);

    #SET NEW.id_impuesto=(SELECT id_impuesto FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
    #SET NEW.impuesto= (SELECT impuesto FROM impuestos WHERE id=NEW.id_impuesto LIMIT 0,1);

    #IF ISNULL(NEW.valor_impuesto) THEN
        #SET NEW.valor_impuesto= (SELECT valor FROM impuestos WHERE id=NEW.id_impuesto LIMIT 0,1);
    #END IF;
        
   # SET NEW.inventariable = (SELECT inventariable FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
    #SET NEW.id_unidad_medida=(SELECT id_unidad_medida FROM items WHERE id=NEW.id_inventario LIMIT 0,1);
   # SET NEW.nombre_unidad_medida=(SELECT nombre FROM inventario_unidades WHERE id=NEW.id_unidad_medida LIMIT 0,1);
    #SET NEW.cantidad_unidad_medida=(SELECT unidades FROM inventario_unidades WHERE id=NEW.id_unidad_medida LIMIT 0,1);

    SET id_empresa = (SELECT id_empresa FROM compras_requisiciones WHERE id=NEW.id_requisicion);
    SET id_sucursal = (SELECT id_sucursal FROM compras_requisiciones WHERE id=NEW.id_requisicion);
    #SET id_bodega = (SELECT id_bodega FROM compras_requisiciones WHERE id=NEW.id_requisicion);

    #SET NEW.costo_inventario=(SELECT costos FROM inventario_totales WHERE id_item=NEW.id_inventario  AND id_empresa=id_empresa AND id_sucursal=id_sucursal AND id_ubicacion=id_bodega AND activo=1 GROUP BY id LIMIT 0,1);
    SET NEW.cant_item_pedido = (SELECT cantidad FROM pedido_requerimientos WHERE id = NEW.id_item_pedido);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ConfiguracionDocumentosINSERT`;
DELIMITER ;;
CREATE TRIGGER `ConfiguracionDocumentosINSERT` BEFORE INSERT ON `configuracion_documentos` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.tipo = (SELECT nombre FROM configuracion_documentos_tipo WHERE id=NEW.id_tipo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ConfiguracionDocumentosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `ConfiguracionDocumentosUPDATE` BEFORE UPDATE ON `configuracion_documentos` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.tipo = (SELECT nombre FROM configuracion_documentos_tipo WHERE id=NEW.id_tipo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_festivosINSERT`;
DELIMITER ;;
CREATE TRIGGER `configuracion_festivosINSERT` BEFORE INSERT ON `configuracion_festivos` FOR EACH ROW BEGIN
SET NEW.pais = (SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_horas_extrasINSERT`;
DELIMITER ;;
CREATE TRIGGER `configuracion_horas_extrasINSERT` BEFORE INSERT ON `configuracion_horas_extras` FOR EACH ROW BEGIN
SET NEW.pais = (SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_horas_extrasUPDATE`;
DELIMITER ;;
CREATE TRIGGER `configuracion_horas_extrasUPDATE` BEFORE UPDATE ON `configuracion_horas_extras` FOR EACH ROW BEGIN
SET NEW.pais = (SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_informacion_comercial_INSERT`;
DELIMITER ;;
CREATE TRIGGER `configuracion_informacion_comercial_INSERT` BEFORE INSERT ON `configuracion_informacion_comercial` FOR EACH ROW BEGIN

SET NEW.nombre_empleado =  (SELECT nombre FROM empleados WHERE id=NEW.id_empleado LIMIT 0,1);
SET NEW.documento_empleado =  (SELECT documento FROM empleados WHERE id=NEW.id_empleado LIMIT 0,1);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_informacion_comercial_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `configuracion_informacion_comercial_UPDATE` BEFORE UPDATE ON `configuracion_informacion_comercial` FOR EACH ROW BEGIN

SET NEW.nombre_empleado =  (SELECT nombre FROM empleados WHERE id=NEW.id_empleado LIMIT 0,1);
SET NEW.documento_empleado =  (SELECT documento FROM empleados WHERE id=NEW.id_empleado LIMIT 0,1);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ConfiguracionProyActiNSERT`;
DELIMITER ;;
CREATE TRIGGER `ConfiguracionProyActiNSERT` BEFORE INSERT ON `configuracion_proyectos_actividades` FOR EACH ROW BEGIN

         SET NEW.codigo_proyecto = (SELECT codigo FROM configuracion_proyectos WHERE id = NEW.id_proyecto);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ConfiguracionProyActiUPDATE`;
DELIMITER ;;
CREATE TRIGGER `ConfiguracionProyActiUPDATE` BEFORE UPDATE ON `configuracion_proyectos_actividades` FOR EACH ROW BEGIN

         SET NEW.codigo_proyecto = (SELECT codigo FROM configuracion_proyectos WHERE id = NEW.id_proyecto);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_reunion_coopeINSERT`;
DELIMITER ;;
CREATE TRIGGER `configuracion_reunion_coopeINSERT` BEFORE INSERT ON `configuracion_reunion_coope` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.nombre_checklist = (SELECT nombre FROM configuracion_reunion_coope_checklist WHERE id = NEW.id_checklist_configuracion_reuniones_coope);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_reunion_coopeUPDATE`;
DELIMITER ;;
CREATE TRIGGER `configuracion_reunion_coopeUPDATE` BEFORE UPDATE ON `configuracion_reunion_coope` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.nombre_checklist = (SELECT nombre FROM configuracion_reunion_coope_checklist WHERE id = NEW.id_checklist_configuracion_reuniones_coope);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_coope_notificacionINSERT`;
DELIMITER ;;
CREATE TRIGGER `configuracion_coope_notificacionINSERT` BEFORE INSERT ON `configuracion_reunion_coope_notificacion` FOR EACH ROW BEGIN
SET NEW.sucursal= (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.funcionario = (SELECT nombre FROM empleados WHERE id = NEW.id_funcionario);
SET NEW.email = (SELECT email_empresa FROM empleados WHERE id = NEW.id_funcionario);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_coope_notificacionUPDATE`;
DELIMITER ;;
CREATE TRIGGER `configuracion_coope_notificacionUPDATE` BEFORE UPDATE ON `configuracion_reunion_coope_notificacion` FOR EACH ROW BEGIN
SET NEW.sucursal= (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.funcionario = (SELECT nombre FROM empleados WHERE id = NEW.id_funcionario);
SET NEW.email = (SELECT email_empresa FROM empleados WHERE id = NEW.id_funcionario);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_zonasINSERT2`;
DELIMITER ;;
CREATE TRIGGER `configuracion_zonasINSERT2` AFTER INSERT ON `configuracion_zonas` FOR EACH ROW BEGIN

          UPDATE empresas SET zonas = (SELECT count(id) FROM configuracion_zonas WHERE id_empresa = NEW.id_empresa AND activo = 1) WHERE id = NEW.id_empresa;


END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `configuracion_zonasUPDATE2`;
DELIMITER ;;
CREATE TRIGGER `configuracion_zonasUPDATE2` AFTER UPDATE ON `configuracion_zonas` FOR EACH ROW BEGIN

          UPDATE empresas SET zonas = (SELECT count(id) FROM configuracion_zonas WHERE id_empresa = NEW.id_empresa AND activo = 1) WHERE id = NEW.id_empresa;


END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERT_crm_configuracion_actividades`;
DELIMITER ;;
CREATE TRIGGER `INSERT_crm_configuracion_actividades` BEFORE INSERT ON `crm_configuracion_actividades` FOR EACH ROW BEGIN

IF(NEW.fecha_completa='false') THEN SET NEW.fecha_vencimiento = 'true'; END IF ;
IF(NEW.fecha_completa='true') THEN SET NEW.fecha_vencimiento = 'false'; END IF ;

SET NEW.departamento = (SELECT nombre FROM departamentos WHERE id = NEW.id_departamento);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `UPDATE_crm_configuracion_actividades`;
DELIMITER ;;
CREATE TRIGGER `UPDATE_crm_configuracion_actividades` BEFORE UPDATE ON `crm_configuracion_actividades` FOR EACH ROW BEGIN

IF(NEW.fecha_completa='none') THEN SET NEW.fecha_vencimiento = 'inline'; END IF ;
IF(NEW.fecha_completa='inline') THEN SET NEW.fecha_vencimiento = 'none'; END IF ;

SET NEW.departamento = (SELECT nombre FROM departamentos WHERE id = NEW.id_departamento);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `crm_notificacionesINSERT`;
DELIMITER ;;
CREATE TRIGGER `crm_notificacionesINSERT` BEFORE INSERT ON `crm_notificaciones` FOR EACH ROW BEGIN

     SET NEW.objetivo = (SELECT objetivo FROM crm_objetivos WHERE id = NEW.id_objetivo);
     SET NEW.tema = (SELECT tema FROM crm_objetivos_actividades WHERE id = NEW.id_actividad);
     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `crm_objetivosINSERT`;
DELIMITER ;;
CREATE TRIGGER `crm_objetivosINSERT` BEFORE INSERT ON `crm_objetivos` FOR EACH ROW BEGIN

IF(NEW.tipo = 1) THEN
     
     SET NEW.id_cliente = (SELECT id_cliente FROM pedido WHERE id = NEW.referencia);
     SET NEW.cliente = (SELECT nombre_cliente FROM pedido WHERE id = NEW.referencia);
     SET NEW.objetivo = CONCAT('Documento ',LPAD((SELECT consecutivo_cotizacion FROM pedido WHERE id = NEW.referencia),7,0));
     SET NEW.vencimiento = CONCAT( (SELECT fecha_final FROM pedido WHERE id = NEW.referencia),' ', (SELECT hora_final FROM pedido WHERE id = NEW.referencia));
     SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
     SET NEW.id_empresa = (SELECT id_empresa FROM empleados WHERE id = NEW.id_usuario);    

END IF;


IF(NEW.tipo = 2) THEN
          
     SET NEW.cliente = (SELECT nombre_comercial  FROM terceros WHERE id = NEW.id_cliente);
     SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
     SET NEW.id_empresa = (SELECT id_empresa FROM empleados WHERE id = NEW.id_usuario);
     SET NEW.id_sucursal = (SELECT id_sucursal FROM empleados WHERE id = NEW.id_usuario);
     SET NEW.sucursal_cliente = (SELECT nombre FROM terceros_direcciones WHERE id = NEW.id_sucursal_cliente);

END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `crm_objetivosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `crm_objetivosUPDATE` BEFORE UPDATE ON `crm_objetivos` FOR EACH ROW BEGIN

     IF(NEW.id_usuario_finaliza IS NOT  NULL) THEN
              SET NEW.usuario_finaliza = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario_finaliza);
     END IF;

     SET NEW.id_empresa = (SELECT id_empresa FROM empleados WHERE id = NEW.id_usuario);
     SET NEW.id_sucursal = (SELECT id_sucursal FROM empleados WHERE id = NEW.id_usuario);
     SET NEW.sucursal_cliente = (SELECT nombre FROM terceros_direcciones WHERE id = NEW.id_sucursal_cliente);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `crm_objetivos_actividadesINSERT`;
DELIMITER ;;
CREATE TRIGGER `crm_objetivos_actividadesINSERT` BEFORE INSERT ON `crm_objetivos_actividades` FOR EACH ROW BEGIN    

     if(NEW.id_objetivo != 0)THEN 
          SET NEW.tipo_objetivo = (SELECT tipo FROM crm_objetivos WHERE id = NEW.id_objetivo);
          SET NEW.referencia = (SELECT referencia FROM crm_objetivos WHERE id = NEW.id_objetivo);
          SET NEW.id_cliente = (SELECT id_cliente FROM crm_objetivos WHERE id = NEW.id_objetivo); 
          SET NEW.objetivo = (SELECT objetivo FROM crm_objetivos WHERE id = NEW.id_objetivo);
          SET NEW.id_sucursal_cliente = (SELECT id_sucursal_cliente FROM crm_objetivos WHERE id = NEW.id_objetivo);         
     END IF;

     SET NEW.tipo_nombre = (SELECT nombre FROM crm_configuracion_actividades WHERE id = NEW.tipo );
     SET NEW.icono = (SELECT icono FROM crm_configuracion_actividades WHERE id = NEW.tipo );

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado);
     SET NEW.id_empresa = (SELECT id_empresa FROM empleados WHERE id = NEW.id_asignado);
     SET NEW.id_sucursal = (SELECT id_sucursal FROM empleados WHERE id = NEW.id_asignado);
     SET NEW.id_zona = (SELECT id_zona FROM empleados WHERE id = NEW.id_asignado);
     SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
     SET NEW.fecha = NOW();
     SET NEW.cliente = (SELECT nombre_comercial FROM terceros  WHERE id = NEW.id_cliente); 
     SET NEW.sucursal_cliente = (SELECT nombre FROM terceros_direcciones WHERE id = NEW.id_sucursal_cliente);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `crm_objetivos_actividadesUPDATE`;
DELIMITER ;;
CREATE TRIGGER `crm_objetivos_actividadesUPDATE` BEFORE UPDATE ON `crm_objetivos_actividades` FOR EACH ROW BEGIN
     
     if(NEW.id_objetivo != 0)THEN 
          SET NEW.tipo_objetivo = (SELECT tipo FROM crm_objetivos WHERE id = NEW.id_objetivo);
          SET NEW.referencia = (SELECT referencia FROM crm_objetivos WHERE id = NEW.id_objetivo);
          SET NEW.id_cliente = (SELECT id_cliente FROM crm_objetivos WHERE id = NEW.id_objetivo); 
          SET NEW.objetivo = (SELECT objetivo FROM crm_objetivos WHERE id = NEW.id_objetivo);
     END IF;

     SET NEW.tipo_nombre = (SELECT nombre FROM crm_configuracion_actividades WHERE id = NEW.tipo );
     SET NEW.icono = (SELECT icono FROM crm_configuracion_actividades WHERE id = NEW.tipo );

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado);
     SET NEW.id_empresa = (SELECT id_empresa FROM empleados WHERE id = NEW.id_asignado);
     SET NEW.id_sucursal = (SELECT id_sucursal FROM empleados WHERE id = NEW.id_asignado);
     SET NEW.id_zona = (SELECT id_zona FROM empleados WHERE id = NEW.id_asignado);
     SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
     SET NEW.cliente = (SELECT nombre_comercial FROM terceros  WHERE id = NEW.id_cliente); 


     IF(NEW.id_usuario_finaliza IS NOT  NULL) THEN
              SET NEW.usuario_finaliza = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario_finaliza);
     END IF;

     SET NEW.sucursal_cliente = (SELECT nombre FROM terceros_direcciones WHERE id = NEW.id_sucursal_cliente);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `crm_objetivos_actividades_accionesINSERT`;
DELIMITER ;;
CREATE TRIGGER `crm_objetivos_actividades_accionesINSERT` BEFORE INSERT ON `crm_objetivos_actividades_acciones` FOR EACH ROW BEGIN

     SET NEW.fecha = NOW();
     SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario) ;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `crm_obejtivos_actividades_accionesINSERT2`;
DELIMITER ;;
CREATE TRIGGER `crm_obejtivos_actividades_accionesINSERT2` AFTER INSERT ON `crm_objetivos_actividades_acciones` FOR EACH ROW BEGIN


     UPDATE crm_objetivos_actividades SET acciones = (SELECT count(id) FROM crm_objetivos_actividades_acciones WHERE id_actividad = NEW.id_actividad AND activo = 1) WHERE id = NEW.id_actividad;


END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `crm_objetivos_actividades_personasINSERT`;
DELIMITER ;;
CREATE TRIGGER `crm_objetivos_actividades_personasINSERT` BEFORE INSERT ON `crm_objetivos_actividades_personas` FOR EACH ROW BEGIN

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpleadosINSERT`;
DELIMITER ;;
CREATE TRIGGER `EmpleadosINSERT` BEFORE INSERT ON `empleados` FOR EACH ROW BEGIN


SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.id_pais = (SELECT id_pais FROM empresas WHERE id = NEW.id_empresa);
SET NEW.pais = (SELECT pais FROM empresas WHERE id = NEW.id_empresa);
SET NEW.cargo = (SELECT nombre FROM empleados_cargos WHERE id = NEW.id_cargo);
SET NEW.nombre = CONCAT(NEW.nombre1,' ',NEW.nombre2,' ',NEW.apellido1,' ',NEW.apellido2);
SET NEW.rol = (SELECT nombre FROM empleados_roles WHERE id = NEW.id_rol);
SET NEW.tipo_documento_nombre = (SELECT nombre FROM tipo_documento WHERE id = NEW.tipo_documento);
SET NEW.id_zona =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.zona =  (SELECT zona_nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);

SET NEW.fecha_modificacion = NOW();

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpleadosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `EmpleadosUPDATE` BEFORE UPDATE ON `empleados` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.id_pais = (SELECT id_pais FROM empresas WHERE id = NEW.id_empresa);
SET NEW.pais = (SELECT pais FROM empresas WHERE id = NEW.id_empresa);
SET NEW.cargo = (SELECT nombre FROM empleados_cargos WHERE id = NEW.id_cargo);
SET NEW.nombre = CONCAT(NEW.nombre1,' ',NEW.nombre2,' ',NEW.apellido1,' ',NEW.apellido2);
SET NEW.rol = (SELECT nombre FROM empleados_roles WHERE id = NEW.id_rol);
SET NEW.tipo_documento_nombre = (SELECT nombre FROM tipo_documento WHERE id = NEW.tipo_documento);
SET NEW.id_zona =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.zona =  (SELECT zona_nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);

SET NEW.fecha_modificacion = NOW();
SET NEW.movil_sinc_contactos = NEW.movil_sinc_contactos + 1;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpleadosContratosINSERT`;
DELIMITER ;;
CREATE TRIGGER `EmpleadosContratosINSERT` BEFORE INSERT ON `empleados_contratos` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpleadosContartosUDPATE`;
DELIMITER ;;
CREATE TRIGGER `EmpleadosContartosUDPATE` BEFORE UPDATE ON `empleados_contratos` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_documentosINSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_documentosINSERT` BEFORE INSERT ON `empleados_documentos` FOR EACH ROW BEGIN
SET NEW.tipo_documento_nombre = (SELECT nombre FROM empleados_tipo_documento WHERE id = NEW.tipo_documento);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_dotaciones_itemsINSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_dotaciones_itemsINSERT` BEFORE INSERT ON `empleados_dotaciones_items` FOR EACH ROW BEGIN
         SET NEW.item = (SELECT nombre FROM configuracion_items_dotaciones WHERE id = NEW.id_item); 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_dotaciones_itemsUPDATE`;
DELIMITER ;;
CREATE TRIGGER `empleados_dotaciones_itemsUPDATE` BEFORE UPDATE ON `empleados_dotaciones_items` FOR EACH ROW BEGIN
         SET NEW.item = (SELECT nombre FROM configuracion_items_dotaciones WHERE id = NEW.id_item); 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_empresas_sucursalesINSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_empresas_sucursalesINSERT` BEFORE INSERT ON `empleados_empresas_sucursales_permisos` FOR EACH ROW BEGIN

          SET NEW.id_zona = (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_empresas_sucursalesUPDATE`;
DELIMITER ;;
CREATE TRIGGER `empleados_empresas_sucursalesUPDATE` BEFORE UPDATE ON `empleados_empresas_sucursales_permisos` FOR EACH ROW BEGIN

          SET NEW.id_zona = (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_empresas_permisos_logINSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_empresas_permisos_logINSERT` BEFORE INSERT ON `empleados_empresas_sucursales_permisos_log` FOR EACH ROW BEGIN

SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
SET NEW.empleado = (SELECT nombre FROM empleados WHERE id = NEW.id_empleado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_historial_vinculacionINSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_historial_vinculacionINSERT` BEFORE INSERT ON `empleados_historial_vinculacion` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.motivo_retiro = (SELECT motivo FROM configuracion_motivos_retiro WHERE id = NEW.id_retiro);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpleadosHorasExtrasUPDATE`;
DELIMITER ;;
CREATE TRIGGER `EmpleadosHorasExtrasUPDATE` BEFORE UPDATE ON `empleados_horas_extras` FOR EACH ROW BEGIN

#################### PARAMETROS GENERALES
DECLARE liquida_extras	CHAR(5);
DECLARE el_id_pais		INT;
DECLARE el_ano		INT;
DECLARE SALARIO_		FLOAT;
DECLARE INICIADIURNO	TIME;
DECLARE INICIANOCTURNO	TIME;
DECLARE fechaiFESTIVA	INT DEFAULT(0);
DECLARE fechaSFESTIVA	INT DEFAULT(0);
############### CONTROL NUMERO DE MINUTOS
DECLARE MED		FLOAT DEFAULT(0); 		
DECLARE MEN		FLOAT DEFAULT(0);
DECLARE MEDF		FLOAT DEFAULT(0);
DECLARE MENF		FLOAT DEFAULT(0); 
DECLARE MEDdia2		FLOAT DEFAULT(0); 		
DECLARE MENdia2		FLOAT DEFAULT(0);
DECLARE MEDFdia2		FLOAT DEFAULT(0);
DECLARE MENFdia2		FLOAT DEFAULT(0);
################# CONTROL VALOR DE MINUTOS
DECLARE MEDVALOR	FLOAT DEFAULT(0); 		
DECLARE MENVALOR	FLOAT DEFAULT(0);
DECLARE MEDFVALOR	FLOAT DEFAULT(0);
DECLARE MENFVALOR	FLOAT DEFAULT(0);
DECLARE MEDVALORdia2	FLOAT DEFAULT(0); 		
DECLARE MENVALORdia2	FLOAT DEFAULT(0);
DECLARE MEDFVALORdia2	FLOAT DEFAULT(0);
DECLARE MENFVALORdia2	FLOAT DEFAULT(0);
################ CONTROL FACTOR DE CALCULO	
DECLARE factorHED		FLOAT DEFAULT(1); 		
DECLARE factorHEN		FLOAT DEFAULT(1);
DECLARE factorHEDF	FLOAT DEFAULT(1);
DECLARE factorHENF	FLOAT DEFAULT(1);

SET liquida_extras = (SELECT extras FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET el_ano = YEAR(NEW.fechai);
SET SALARIO_ = (SELECT salario FROM empleados WHERE documento = NEW.cedula LIMIT 1)/30/7.66667/60;
SET el_id_pais = (SELECT id_pais FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET factorHED = (SELECT hed FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano   LIMIT 1);
SET factorHEN = (SELECT hen FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHEDF = (SELECT hedf FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHENF = (SELECT henf FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano  LIMIT 1);

SET INICIADIURNO = (SELECT inicia_diurno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);
SET INICIANOCTURNO = (SELECT inicia_nocturno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechai)>0) THEN
	SET fechaiFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechai) = 6) THEN
		SET fechaiFESTIVA = 1;
	END IF;
END if;

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechas)>0) THEN
	SET fechasFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechas) = 6) THEN
		SET fechasFESTIVA = 1;
	END IF;	
END if;

IF(liquida_extras = 'true') THEN

     IF(NEW.fechas != '0000-00-00')  THEN
		################################### SI LAS HORAS EXTRAS SON EL EL MISMO DIA DEL INGRESO ##########################
		IF(NEW.fechai = NEW.fechas) THEN
			############ SI HAY EXTRAS - HORA DE SALIDA ES MAYOR QUE LA HORA DE INICIO DE LAS EXTRAS DIURNA #############
			if(NEW.horas > INICIADIURNO) THEN
				#############   HORA DE SALIDA ES MENOR O IGUAL QUE EL INICIO DE LAS EXTRAS NOCTURNAS  #############
				if(NEW.horas <= INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = 0;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;		
						SET NEW.medf = MED;
						SET NEW.menf = 0;
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;					
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF) ;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;
				END IF;
				
				##############  HORA DE SALIDA ES MAYOR QUE EL INICIO DE LAS EXTRAS NOCTURNAS   ###################
				if(NEW.horas > INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);		
					SET MEN = Retorna_Minutos(INICIANOCTURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = MEN;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = MEN * (SALARIO_ * factorHEN);					
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;
						SET NEW.medf = MED;
						SET NEW.menf = MEN;				
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF);
						SET NEW.menf_valor = MEN * (SALARIO_ * factorHENF);	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;				
				END IF;	
			END IF;
		END IF;
		
		################################### SI LAS HORAS EXTRAS SON EL DIA DESPUES DEL INGRESO ############################
		IF(NEW.fechai < NEW.fechas) THEN
			############## SI ES ORDINAL O FESTIVO EL DIA DE INGRESO ###############
			IF(fechaiFESTIVA=0) THEN		
				SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MEN = Retorna_Minutos(INICIANOCTURNO,'24:00:00');
				SET MEDF = 0;
				SET MENf = 0;
				SET MEDVALOR = MED * (SALARIO_ * factorHED);
				SET MENVALOR = MEN * (SALARIO_ * factorHEN);
				SET MEDFVALOR = 0;
				SET MENFVALOR = 0;			
			ELSE
				SET MED = 0;
				SET MEN = 0;
				SET MEDF = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MENF = Retorna_Minutos(INICIANOCTURNO,'24:00:00');	
				SET MEDVALOR = 0;
				SET MENVALOR = 0;
				SET MEDFVALOR = MEDF * (SALARIO_ * factorHEDF);
				SET MENFVALOR = MENF * (SALARIO_ * factorHENF);
			END IF;
			
			############## SI ES ORDINAL O FESTIVO EL DIA DE SALIDA ###############
			IF(fechasFESTIVA=0) THEN
				###### SI LA FECHA DEL DIA DE SALIDA NO ES FESTIVA PERO EL DE ENTRAD SI, DEBE ASUMIR QUE EL DE SALIDA TAMBIEN ES FESTIVO ######
				IF(fechaiFESTIVA=0)
				THEN
					SET MEDdia2 = 0;
					SET MENdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDFdia2 = 0;
					SET MENFdia2 = 0;
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = MENdia2 * (SALARIO_ * factorHEN);
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = 0;
				ELSE
					SET MEDdia2 = 0;
					SET MENdia2 = 0;
					SET MEDFdia2 = 0;
					SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = 0;
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);				
				END IF;
			ELSE
				SET MEDdia2 = 0;
				SET MENdia2 = 0;
				SET MEDFdia2 = 0;
				SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
				SET MEDVALORdia2 = 0;
				SET MENVALORdia2 = 0;
				SET MEDFVALORdia2 = 0;
				SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);			
			END IF;		
			
			SET NEW.med = MED + MEDdia2;
			SET NEW.men = MEN + MENdia2;
			SET NEW.medf = MEDF + MEDFdia2;
			SET NEW.menf = MENF + MENFdia2;
			SET NEW.med_valor = MEDVALOR + MEDVALORdia2;
			SET NEW.men_valor = MENVALOR + MENVALORdia2;
			SET NEW.medf_valor = MEDFVALOR + MEDFVALORdia2;
			SET NEW.menf_valor = MENFVALOR + MENFVALORdia2;	
			SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
			
		END IF;	
     ELSE
		SET NEW.med = 0;
		SET NEW.men =0;
		SET NEW.medf = 0;
		SET NEW.menf = 0;
		SET NEW.med_valor =0;
		SET NEW.men_valor = 0;
		SET NEW.medf_valor = 0;
		SET NEW.menf_valor = 0;	
		SET NEW.total =0;	
     END IF;


 END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpleadosHorasExtrasAprobacionINSERT`;
DELIMITER ;;
CREATE TRIGGER `EmpleadosHorasExtrasAprobacionINSERT` BEFORE INSERT ON `empleados_horas_extras_aprobacion` FOR EACH ROW BEGIN

#################### PARAMETROS GENERALES
DECLARE liquida_extras	CHAR(5);
DECLARE el_id_pais		INT;
DECLARE el_ano		INT;
DECLARE SALARIO_		FLOAT;
DECLARE INICIADIURNO	TIME;
DECLARE INICIANOCTURNO	TIME;
DECLARE fechaiFESTIVA	INT DEFAULT(0);
DECLARE fechaSFESTIVA	INT DEFAULT(0);
############### CONTROL NUMERO DE MINUTOS
DECLARE MED		FLOAT DEFAULT(0); 		
DECLARE MEN		FLOAT DEFAULT(0);
DECLARE MEDF		FLOAT DEFAULT(0);
DECLARE MENF		FLOAT DEFAULT(0); 
DECLARE MEDdia2		FLOAT DEFAULT(0); 		
DECLARE MENdia2		FLOAT DEFAULT(0);
DECLARE MEDFdia2		FLOAT DEFAULT(0);
DECLARE MENFdia2		FLOAT DEFAULT(0);
################# CONTROL VALOR DE MINUTOS
DECLARE MEDVALOR	FLOAT DEFAULT(0); 		
DECLARE MENVALOR	FLOAT DEFAULT(0);
DECLARE MEDFVALOR	FLOAT DEFAULT(0);
DECLARE MENFVALOR	FLOAT DEFAULT(0);
DECLARE MEDVALORdia2	FLOAT DEFAULT(0); 		
DECLARE MENVALORdia2	FLOAT DEFAULT(0);
DECLARE MEDFVALORdia2	FLOAT DEFAULT(0);
DECLARE MENFVALORdia2	FLOAT DEFAULT(0);
################ CONTROL FACTOR DE CALCULO	
DECLARE factorHED		FLOAT DEFAULT(1); 		
DECLARE factorHEN		FLOAT DEFAULT(1);
DECLARE factorHEDF	FLOAT DEFAULT(1);
DECLARE factorHENF	FLOAT DEFAULT(1);

SET liquida_extras = (SELECT extras FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET el_ano = YEAR(NEW.fechai);
SET SALARIO_ = (SELECT salario FROM empleados WHERE documento = NEW.cedula LIMIT 1)/30/8/60;
SET el_id_pais = (SELECT id_pais FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET factorHED = (SELECT hed FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano   LIMIT 1);
SET factorHEN = (SELECT hen FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHEDF = (SELECT hedf FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHENF = (SELECT henf FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano  LIMIT 1);

SET INICIADIURNO = (SELECT inicia_diurno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);
SET INICIANOCTURNO = (SELECT inicia_nocturno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechai)>0) THEN
	SET fechaiFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechai) = 6) THEN
		SET fechaiFESTIVA = 1;
	END IF;
END if;

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechas)>0) THEN
	SET fechasFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechas) = 6) THEN
		SET fechasFESTIVA = 1;
	END IF;	
END if;

IF(liquida_extras = 'true') THEN

     IF(NEW.fechas != '0000-00-00')  THEN
		################################### SI LAS HORAS EXTRAS SON EL EL MISMO DIA DEL INGRESO ##########################
		IF(NEW.fechai = NEW.fechas) THEN
			############ SI HAY EXTRAS - HORA DE SALIDA ES MAYOR QUE LA HORA DE INICIO DE LAS EXTRAS DIURNA #############
			if(NEW.horas > INICIADIURNO) THEN
				#############   HORA DE SALIDA ES MENOR O IGUAL QUE EL INICIO DE LAS EXTRAS NOCTURNAS  #############
				if(NEW.horas <= INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = 0;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;		
						SET NEW.medf = MED;
						SET NEW.menf = 0;
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;					
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF) ;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;
				END IF;
				
				##############  HORA DE SALIDA ES MAYOR QUE EL INICIO DE LAS EXTRAS NOCTURNAS   ###################
				if(NEW.horas > INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);		
					SET MEN = Retorna_Minutos(INICIANOCTURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = MEN;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = MEN * (SALARIO_ * factorHEN);					
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;
						SET NEW.medf = MED;
						SET NEW.menf = MEN;				
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF);
						SET NEW.menf_valor = MEN * (SALARIO_ * factorHENF);	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;				
				END IF;	
			END IF;
		END IF;
		
		################################### SI LAS HORAS EXTRAS SON EL DIA DESPUES DEL INGRESO ############################
		IF(NEW.fechai < NEW.fechas) THEN
			############## SI ES ORDINAL O FESTIVO EL DIA DE INGRESO ###############
			IF(fechaiFESTIVA=0) THEN		
				SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MEN = Retorna_Minutos(INICIANOCTURNO,'24:00:00');
				SET MEDF = 0;
				SET MENf = 0;
				SET MEDVALOR = MED * (SALARIO_ * factorHED);
				SET MENVALOR = MEN * (SALARIO_ * factorHEN);
				SET MEDFVALOR = 0;
				SET MENFVALOR = 0;			
			ELSE
				SET MED = 0;
				SET MEN = 0;
				SET MEDF = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MENF = Retorna_Minutos(INICIANOCTURNO,'24:00:00');	
				SET MEDVALOR = 0;
				SET MENVALOR = 0;
				SET MEDFVALOR = MEDF * (SALARIO_ * factorHEDF);
				SET MENFVALOR = MENF * (SALARIO_ * factorHENF);
			END IF;
			
			############## SI ES ORDINAL O FESTIVO EL DIA DE SALIDA ###############
			IF(fechasFESTIVA=0) THEN
				###### SI LA FECHA DEL DIA DE SALIDA NO ES FESTIVA PERO EL DE ENTRAD SI, DEBE ASUMIR QUE EL DE SALIDA TAMBIEN ES FESTIVO ######
				IF(fechaiFESTIVA=0)
				THEN
					SET MEDdia2 = 0;
					SET MENdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDFdia2 = 0;
					SET MENFdia2 = 0;
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = MENdia2 * (SALARIO_ * factorHEN);
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = 0;
				ELSE
					SET MEDdia2 = 0;
					SET MENdia2 = 0;
					SET MEDFdia2 = 0;
					SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = 0;
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);				
				END IF;
			ELSE
				SET MEDdia2 = 0;
				SET MENdia2 = 0;
				SET MEDFdia2 = 0;
				SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
				SET MEDVALORdia2 = 0;
				SET MENVALORdia2 = 0;
				SET MEDFVALORdia2 = 0;
				SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);			
			END IF;		
			
			SET NEW.med = MED + MEDdia2;
			SET NEW.men = MEN + MENdia2;
			SET NEW.medf = MEDF + MEDFdia2;
			SET NEW.menf = MENF + MENFdia2;
			SET NEW.med_valor = MEDVALOR + MEDVALORdia2;
			SET NEW.men_valor = MENVALOR + MENVALORdia2;
			SET NEW.medf_valor = MEDFVALOR + MEDFVALORdia2;
			SET NEW.menf_valor = MENFVALOR + MENFVALORdia2;	
			SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
			
		END IF;	
     ELSE
		SET NEW.med = 0;
		SET NEW.men =0;
		SET NEW.medf = 0;
		SET NEW.menf = 0;
		SET NEW.med_valor =0;
		SET NEW.men_valor = 0;
		SET NEW.medf_valor = 0;
		SET NEW.menf_valor = 0;	
		SET NEW.total =0;	
     END IF;


 END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpleadosHorasExtrasAprobacionUPDATE`;
DELIMITER ;;
CREATE TRIGGER `EmpleadosHorasExtrasAprobacionUPDATE` BEFORE UPDATE ON `empleados_horas_extras_aprobacion` FOR EACH ROW BEGIN

#################### PARAMETROS GENERALES
DECLARE liquida_extras	CHAR(5);
DECLARE el_id_pais		INT;
DECLARE el_ano		INT;
DECLARE SALARIO_		FLOAT;
DECLARE INICIADIURNO	TIME;
DECLARE INICIANOCTURNO	TIME;
DECLARE fechaiFESTIVA	INT DEFAULT(0);
DECLARE fechaSFESTIVA	INT DEFAULT(0);
############### CONTROL NUMERO DE MINUTOS
DECLARE MED		FLOAT DEFAULT(0); 		
DECLARE MEN		FLOAT DEFAULT(0);
DECLARE MEDF		FLOAT DEFAULT(0);
DECLARE MENF		FLOAT DEFAULT(0); 
DECLARE MEDdia2		FLOAT DEFAULT(0); 		
DECLARE MENdia2		FLOAT DEFAULT(0);
DECLARE MEDFdia2		FLOAT DEFAULT(0);
DECLARE MENFdia2		FLOAT DEFAULT(0);
################# CONTROL VALOR DE MINUTOS
DECLARE MEDVALOR	FLOAT DEFAULT(0); 		
DECLARE MENVALOR	FLOAT DEFAULT(0);
DECLARE MEDFVALOR	FLOAT DEFAULT(0);
DECLARE MENFVALOR	FLOAT DEFAULT(0);
DECLARE MEDVALORdia2	FLOAT DEFAULT(0); 		
DECLARE MENVALORdia2	FLOAT DEFAULT(0);
DECLARE MEDFVALORdia2	FLOAT DEFAULT(0);
DECLARE MENFVALORdia2	FLOAT DEFAULT(0);
################ CONTROL FACTOR DE CALCULO	
DECLARE factorHED		FLOAT DEFAULT(1); 		
DECLARE factorHEN		FLOAT DEFAULT(1);
DECLARE factorHEDF	FLOAT DEFAULT(1);
DECLARE factorHENF	FLOAT DEFAULT(1);

SET liquida_extras = (SELECT extras FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET el_ano = YEAR(NEW.fechai);
SET SALARIO_ = (SELECT salario FROM empleados WHERE documento = NEW.cedula LIMIT 1)/30/8/60;
SET el_id_pais = (SELECT id_pais FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET factorHED = (SELECT hed FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano   LIMIT 1);
SET factorHEN = (SELECT hen FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHEDF = (SELECT hedf FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHENF = (SELECT henf FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano  LIMIT 1);

SET INICIADIURNO = (SELECT inicia_diurno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);
SET INICIANOCTURNO = (SELECT inicia_nocturno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechai)>0) THEN
	SET fechaiFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechai) = 6) THEN
		SET fechaiFESTIVA = 1;
	END IF;
END if;

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechas)>0) THEN
	SET fechasFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechas) = 6) THEN
		SET fechasFESTIVA = 1;
	END IF;	
END if;

IF(liquida_extras = 'true') THEN

     IF(NEW.fechas != '0000-00-00')  THEN
		################################### SI LAS HORAS EXTRAS SON EL EL MISMO DIA DEL INGRESO ##########################
		IF(NEW.fechai = NEW.fechas) THEN
			############ SI HAY EXTRAS - HORA DE SALIDA ES MAYOR QUE LA HORA DE INICIO DE LAS EXTRAS DIURNA #############
			if(NEW.horas > INICIADIURNO) THEN
				#############   HORA DE SALIDA ES MENOR O IGUAL QUE EL INICIO DE LAS EXTRAS NOCTURNAS  #############
				if(NEW.horas <= INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = 0;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;		
						SET NEW.medf = MED;
						SET NEW.menf = 0;
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;					
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF) ;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;
				END IF;
				
				##############  HORA DE SALIDA ES MAYOR QUE EL INICIO DE LAS EXTRAS NOCTURNAS   ###################
				if(NEW.horas > INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);		
					SET MEN = Retorna_Minutos(INICIANOCTURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = MEN;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = MEN * (SALARIO_ * factorHEN);					
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;
						SET NEW.medf = MED;
						SET NEW.menf = MEN;				
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF);
						SET NEW.menf_valor = MEN * (SALARIO_ * factorHENF);	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;				
				END IF;	
			END IF;
		END IF;
		
		################################### SI LAS HORAS EXTRAS SON EL DIA DESPUES DEL INGRESO ############################
		IF(NEW.fechai < NEW.fechas) THEN
			############## SI ES ORDINAL O FESTIVO EL DIA DE INGRESO ###############
			IF(fechaiFESTIVA=0) THEN		
				SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MEN = Retorna_Minutos(INICIANOCTURNO,'24:00:00');
				SET MEDF = 0;
				SET MENf = 0;
				SET MEDVALOR = MED * (SALARIO_ * factorHED);
				SET MENVALOR = MEN * (SALARIO_ * factorHEN);
				SET MEDFVALOR = 0;
				SET MENFVALOR = 0;			
			ELSE
				SET MED = 0;
				SET MEN = 0;
				SET MEDF = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MENF = Retorna_Minutos(INICIANOCTURNO,'24:00:00');	
				SET MEDVALOR = 0;
				SET MENVALOR = 0;
				SET MEDFVALOR = MEDF * (SALARIO_ * factorHEDF);
				SET MENFVALOR = MENF * (SALARIO_ * factorHENF);
			END IF;
			
			############## SI ES ORDINAL O FESTIVO EL DIA DE SALIDA ###############
			IF(fechasFESTIVA=0) THEN
				###### SI LA FECHA DEL DIA DE SALIDA NO ES FESTIVA PERO EL DE ENTRAD SI, DEBE ASUMIR QUE EL DE SALIDA TAMBIEN ES FESTIVO ######
				IF(fechaiFESTIVA=0)
				THEN
					SET MEDdia2 = 0;
					SET MENdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDFdia2 = 0;
					SET MENFdia2 = 0;
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = MENdia2 * (SALARIO_ * factorHEN);
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = 0;
				ELSE
					SET MEDdia2 = 0;
					SET MENdia2 = 0;
					SET MEDFdia2 = 0;
					SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = 0;
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);				
				END IF;
			ELSE
				SET MEDdia2 = 0;
				SET MENdia2 = 0;
				SET MEDFdia2 = 0;
				SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
				SET MEDVALORdia2 = 0;
				SET MENVALORdia2 = 0;
				SET MEDFVALORdia2 = 0;
				SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);			
			END IF;		
			
			SET NEW.med = MED + MEDdia2;
			SET NEW.men = MEN + MENdia2;
			SET NEW.medf = MEDF + MEDFdia2;
			SET NEW.menf = MENF + MENFdia2;
			SET NEW.med_valor = MEDVALOR + MEDVALORdia2;
			SET NEW.men_valor = MENVALOR + MENVALORdia2;
			SET NEW.medf_valor = MEDFVALOR + MEDFVALORdia2;
			SET NEW.menf_valor = MENFVALOR + MENFVALORdia2;	
			SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
			
		END IF;	
     ELSE
		SET NEW.med = 0;
		SET NEW.men =0;
		SET NEW.medf = 0;
		SET NEW.menf = 0;
		SET NEW.med_valor =0;
		SET NEW.men_valor = 0;
		SET NEW.medf_valor = 0;
		SET NEW.menf_valor = 0;	
		SET NEW.total =0;	
     END IF;


 END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpleadosHorasExtrasRHINSERT`;
DELIMITER ;;
CREATE TRIGGER `EmpleadosHorasExtrasRHINSERT` BEFORE INSERT ON `empleados_horas_extras_aprobacion_rh` FOR EACH ROW BEGIN

#################### PARAMETROS GENERALES
DECLARE liquida_extras	CHAR(5);
DECLARE el_id_pais		INT;
DECLARE el_ano		INT;
DECLARE SALARIO_		FLOAT;
DECLARE INICIADIURNO	TIME;
DECLARE INICIANOCTURNO	TIME;
DECLARE fechaiFESTIVA	INT DEFAULT(0);
DECLARE fechaSFESTIVA	INT DEFAULT(0);
############### CONTROL NUMERO DE MINUTOS
DECLARE MED		FLOAT DEFAULT(0); 		
DECLARE MEN		FLOAT DEFAULT(0);
DECLARE MEDF		FLOAT DEFAULT(0);
DECLARE MENF		FLOAT DEFAULT(0); 
DECLARE MEDdia2		FLOAT DEFAULT(0); 		
DECLARE MENdia2		FLOAT DEFAULT(0);
DECLARE MEDFdia2		FLOAT DEFAULT(0);
DECLARE MENFdia2		FLOAT DEFAULT(0);
################# CONTROL VALOR DE MINUTOS
DECLARE MEDVALOR	FLOAT DEFAULT(0); 		
DECLARE MENVALOR	FLOAT DEFAULT(0);
DECLARE MEDFVALOR	FLOAT DEFAULT(0);
DECLARE MENFVALOR	FLOAT DEFAULT(0);
DECLARE MEDVALORdia2	FLOAT DEFAULT(0); 		
DECLARE MENVALORdia2	FLOAT DEFAULT(0);
DECLARE MEDFVALORdia2	FLOAT DEFAULT(0);
DECLARE MENFVALORdia2	FLOAT DEFAULT(0);
################ CONTROL FACTOR DE CALCULO	
DECLARE factorHED		FLOAT DEFAULT(1); 		
DECLARE factorHEN		FLOAT DEFAULT(1);
DECLARE factorHEDF	FLOAT DEFAULT(1);
DECLARE factorHENF	FLOAT DEFAULT(1);

SET liquida_extras = (SELECT extras FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET el_ano = YEAR(NEW.fechai);
SET SALARIO_ = (SELECT salario FROM empleados WHERE documento = NEW.cedula LIMIT 1)/30/8/60;
SET el_id_pais = (SELECT id_pais FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET factorHED = (SELECT hed FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano   LIMIT 1);
SET factorHEN = (SELECT hen FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHEDF = (SELECT hedf FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHENF = (SELECT henf FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano  LIMIT 1);

SET INICIADIURNO = (SELECT inicia_diurno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);
SET INICIANOCTURNO = (SELECT inicia_nocturno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechai)>0) THEN
	SET fechaiFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechai) = 6) THEN
		SET fechaiFESTIVA = 1;
	END IF;
END if;

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechas)>0) THEN
	SET fechasFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechas) = 6) THEN
		SET fechasFESTIVA = 1;
	END IF;	
END if;

IF(liquida_extras = 'true') THEN

     IF(NEW.fechas != '0000-00-00')  THEN
		################################### SI LAS HORAS EXTRAS SON EL EL MISMO DIA DEL INGRESO ##########################
		IF(NEW.fechai = NEW.fechas) THEN
			############ SI HAY EXTRAS - HORA DE SALIDA ES MAYOR QUE LA HORA DE INICIO DE LAS EXTRAS DIURNA #############
			if(NEW.horas > INICIADIURNO) THEN
				#############   HORA DE SALIDA ES MENOR O IGUAL QUE EL INICIO DE LAS EXTRAS NOCTURNAS  #############
				if(NEW.horas <= INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = 0;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;		
						SET NEW.medf = MED;
						SET NEW.menf = 0;
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;					
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF) ;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;
				END IF;
				
				##############  HORA DE SALIDA ES MAYOR QUE EL INICIO DE LAS EXTRAS NOCTURNAS   ###################
				if(NEW.horas > INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);		
					SET MEN = Retorna_Minutos(INICIANOCTURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = MEN;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = MEN * (SALARIO_ * factorHEN);					
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;
						SET NEW.medf = MED;
						SET NEW.menf = MEN;				
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF);
						SET NEW.menf_valor = MEN * (SALARIO_ * factorHENF);	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;				
				END IF;	
			END IF;
		END IF;
		
		################################### SI LAS HORAS EXTRAS SON EL DIA DESPUES DEL INGRESO ############################
		IF(NEW.fechai < NEW.fechas) THEN
			############## SI ES ORDINAL O FESTIVO EL DIA DE INGRESO ###############
			IF(fechaiFESTIVA=0) THEN		
				SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MEN = Retorna_Minutos(INICIANOCTURNO,'24:00:00');
				SET MEDF = 0;
				SET MENf = 0;
				SET MEDVALOR = MED * (SALARIO_ * factorHED);
				SET MENVALOR = MEN * (SALARIO_ * factorHEN);
				SET MEDFVALOR = 0;
				SET MENFVALOR = 0;			
			ELSE
				SET MED = 0;
				SET MEN = 0;
				SET MEDF = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MENF = Retorna_Minutos(INICIANOCTURNO,'24:00:00');	
				SET MEDVALOR = 0;
				SET MENVALOR = 0;
				SET MEDFVALOR = MEDF * (SALARIO_ * factorHEDF);
				SET MENFVALOR = MENF * (SALARIO_ * factorHENF);
			END IF;
			
			############## SI ES ORDINAL O FESTIVO EL DIA DE SALIDA ###############
			IF(fechasFESTIVA=0) THEN
				###### SI LA FECHA DEL DIA DE SALIDA NO ES FESTIVA PERO EL DE ENTRAD SI, DEBE ASUMIR QUE EL DE SALIDA TAMBIEN ES FESTIVO ######
				IF(fechaiFESTIVA=0)
				THEN
					SET MEDdia2 = 0;
					SET MENdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDFdia2 = 0;
					SET MENFdia2 = 0;
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = MENdia2 * (SALARIO_ * factorHEN);
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = 0;
				ELSE
					SET MEDdia2 = 0;
					SET MENdia2 = 0;
					SET MEDFdia2 = 0;
					SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = 0;
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);				
				END IF;
			ELSE
				SET MEDdia2 = 0;
				SET MENdia2 = 0;
				SET MEDFdia2 = 0;
				SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
				SET MEDVALORdia2 = 0;
				SET MENVALORdia2 = 0;
				SET MEDFVALORdia2 = 0;
				SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);			
			END IF;		
			
			SET NEW.med = MED + MEDdia2;
			SET NEW.men = MEN + MENdia2;
			SET NEW.medf = MEDF + MEDFdia2;
			SET NEW.menf = MENF + MENFdia2;
			SET NEW.med_valor = MEDVALOR + MEDVALORdia2;
			SET NEW.men_valor = MENVALOR + MENVALORdia2;
			SET NEW.medf_valor = MEDFVALOR + MEDFVALORdia2;
			SET NEW.menf_valor = MENFVALOR + MENFVALORdia2;	
			SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
			
		END IF;	
     ELSE
		SET NEW.med = 0;
		SET NEW.men =0;
		SET NEW.medf = 0;
		SET NEW.menf = 0;
		SET NEW.med_valor =0;
		SET NEW.men_valor = 0;
		SET NEW.medf_valor = 0;
		SET NEW.menf_valor = 0;	
		SET NEW.total =0;	
     END IF;


 END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpleadosHorasExtrasRHUPDATE`;
DELIMITER ;;
CREATE TRIGGER `EmpleadosHorasExtrasRHUPDATE` BEFORE UPDATE ON `empleados_horas_extras_aprobacion_rh` FOR EACH ROW BEGIN

#################### PARAMETROS GENERALES
DECLARE liquida_extras	CHAR(5);
DECLARE el_id_pais		INT;
DECLARE el_ano		INT;
DECLARE SALARIO_		FLOAT;
DECLARE INICIADIURNO	TIME;
DECLARE INICIANOCTURNO	TIME;
DECLARE fechaiFESTIVA	INT DEFAULT(0);
DECLARE fechaSFESTIVA	INT DEFAULT(0);
############### CONTROL NUMERO DE MINUTOS
DECLARE MED		FLOAT DEFAULT(0); 		
DECLARE MEN		FLOAT DEFAULT(0);
DECLARE MEDF		FLOAT DEFAULT(0);
DECLARE MENF		FLOAT DEFAULT(0); 
DECLARE MEDdia2		FLOAT DEFAULT(0); 		
DECLARE MENdia2		FLOAT DEFAULT(0);
DECLARE MEDFdia2		FLOAT DEFAULT(0);
DECLARE MENFdia2		FLOAT DEFAULT(0);
################# CONTROL VALOR DE MINUTOS
DECLARE MEDVALOR	FLOAT DEFAULT(0); 		
DECLARE MENVALOR	FLOAT DEFAULT(0);
DECLARE MEDFVALOR	FLOAT DEFAULT(0);
DECLARE MENFVALOR	FLOAT DEFAULT(0);
DECLARE MEDVALORdia2	FLOAT DEFAULT(0); 		
DECLARE MENVALORdia2	FLOAT DEFAULT(0);
DECLARE MEDFVALORdia2	FLOAT DEFAULT(0);
DECLARE MENFVALORdia2	FLOAT DEFAULT(0);
################ CONTROL FACTOR DE CALCULO	
DECLARE factorHED		FLOAT DEFAULT(1); 		
DECLARE factorHEN		FLOAT DEFAULT(1);
DECLARE factorHEDF	FLOAT DEFAULT(1);
DECLARE factorHENF	FLOAT DEFAULT(1);

SET liquida_extras = (SELECT extras FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET el_ano = YEAR(NEW.fechai);
SET SALARIO_ = (SELECT salario FROM empleados WHERE documento = NEW.cedula LIMIT 1)/30/8/60;
SET el_id_pais = (SELECT id_pais FROM empleados WHERE documento = NEW.cedula LIMIT 1);
SET factorHED = (SELECT hed FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano   LIMIT 1);
SET factorHEN = (SELECT hen FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHEDF = (SELECT hedf FROM configuracion_horas_extras WHERE id_pais = el_id_pais  AND ano = el_ano  LIMIT 1);
SET factorHENF = (SELECT henf FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano  LIMIT 1);

SET INICIADIURNO = (SELECT inicia_diurno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);
SET INICIANOCTURNO = (SELECT inicia_nocturno FROM configuracion_horas_extras WHERE id_pais = el_id_pais AND ano = el_ano LIMIT 1);

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechai)>0) THEN
	SET fechaiFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechai) = 6) THEN
		SET fechaiFESTIVA = 1;
	END IF;
END if;

IF((SELECT COUNT(fecha) FROM configuracion_festivos WHERE id_pais = el_id_pais AND fecha = NEW.fechas)>0) THEN
	SET fechasFESTIVA = 1;
ELSE
	IF(weekday(NEW.fechas) = 6) THEN
		SET fechasFESTIVA = 1;
	END IF;	
END if;

IF(liquida_extras = 'true') THEN

     IF(NEW.fechas != '0000-00-00')  THEN
		################################### SI LAS HORAS EXTRAS SON EL EL MISMO DIA DEL INGRESO ##########################
		IF(NEW.fechai = NEW.fechas) THEN
			############ SI HAY EXTRAS - HORA DE SALIDA ES MAYOR QUE LA HORA DE INICIO DE LAS EXTRAS DIURNA #############
			if(NEW.horas > INICIADIURNO) THEN
				#############   HORA DE SALIDA ES MENOR O IGUAL QUE EL INICIO DE LAS EXTRAS NOCTURNAS  #############
				if(NEW.horas <= INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = 0;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;		
						SET NEW.medf = MED;
						SET NEW.menf = 0;
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;					
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF) ;
						SET NEW.menf_valor = 0;	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;
				END IF;
				
				##############  HORA DE SALIDA ES MAYOR QUE EL INICIO DE LAS EXTRAS NOCTURNAS   ###################
				if(NEW.horas > INICIANOCTURNO) THEN
					SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);		
					SET MEN = Retorna_Minutos(INICIANOCTURNO,NEW.horas);
					############## SI ES ORDINAL O FESTIVO ###############
					IF(fechaiFESTIVA=0) THEN
						SET NEW.med = MED;
						SET NEW.men = MEN;
						SET NEW.medf = 0;
						SET NEW.menf = 0;
						SET NEW.med_valor = MED * (SALARIO_ * factorHED);
						SET NEW.men_valor = MEN * (SALARIO_ * factorHEN);					
						SET NEW.medf_valor = 0;
						SET NEW.menf_valor = 0;
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
					ELSE
						SET NEW.med = 0;
						SET NEW.men = 0;
						SET NEW.medf = MED;
						SET NEW.menf = MEN;				
						SET NEW.med_valor = 0;
						SET NEW.men_valor = 0;
						SET NEW.medf_valor = MED * (SALARIO_ * factorHEDF);
						SET NEW.menf_valor = MEN * (SALARIO_ * factorHENF);	
						SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;					
					END IF;				
				END IF;	
			END IF;
		END IF;
		
		################################### SI LAS HORAS EXTRAS SON EL DIA DESPUES DEL INGRESO ############################
		IF(NEW.fechai < NEW.fechas) THEN
			############## SI ES ORDINAL O FESTIVO EL DIA DE INGRESO ###############
			IF(fechaiFESTIVA=0) THEN		
				SET MED = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MEN = Retorna_Minutos(INICIANOCTURNO,'24:00:00');
				SET MEDF = 0;
				SET MENf = 0;
				SET MEDVALOR = MED * (SALARIO_ * factorHED);
				SET MENVALOR = MEN * (SALARIO_ * factorHEN);
				SET MEDFVALOR = 0;
				SET MENFVALOR = 0;			
			ELSE
				SET MED = 0;
				SET MEN = 0;
				SET MEDF = Retorna_Minutos(INICIADIURNO,INICIANOCTURNO);
				SET MENF = Retorna_Minutos(INICIANOCTURNO,'24:00:00');	
				SET MEDVALOR = 0;
				SET MENVALOR = 0;
				SET MEDFVALOR = MEDF * (SALARIO_ * factorHEDF);
				SET MENFVALOR = MENF * (SALARIO_ * factorHENF);
			END IF;
			
			############## SI ES ORDINAL O FESTIVO EL DIA DE SALIDA ###############
			IF(fechasFESTIVA=0) THEN
				###### SI LA FECHA DEL DIA DE SALIDA NO ES FESTIVA PERO EL DE ENTRAD SI, DEBE ASUMIR QUE EL DE SALIDA TAMBIEN ES FESTIVO ######
				IF(fechaiFESTIVA=0)
				THEN
					SET MEDdia2 = 0;
					SET MENdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDFdia2 = 0;
					SET MENFdia2 = 0;
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = MENdia2 * (SALARIO_ * factorHEN);
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = 0;
				ELSE
					SET MEDdia2 = 0;
					SET MENdia2 = 0;
					SET MEDFdia2 = 0;
					SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
					SET MEDVALORdia2 = 0;
					SET MENVALORdia2 = 0;
					SET MEDFVALORdia2 = 0;
					SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);				
				END IF;
			ELSE
				SET MEDdia2 = 0;
				SET MENdia2 = 0;
				SET MEDFdia2 = 0;
				SET MENFdia2 = Retorna_Minutos('00:00:00',NEW.horas);
				SET MEDVALORdia2 = 0;
				SET MENVALORdia2 = 0;
				SET MEDFVALORdia2 = 0;
				SET MENFVALORdia2 = MENFdia2 * (SALARIO_ * factorHENF);			
			END IF;		
			
			SET NEW.med = MED + MEDdia2;
			SET NEW.men = MEN + MENdia2;
			SET NEW.medf = MEDF + MEDFdia2;
			SET NEW.menf = MENF + MENFdia2;
			SET NEW.med_valor = MEDVALOR + MEDVALORdia2;
			SET NEW.men_valor = MENVALOR + MENVALORdia2;
			SET NEW.medf_valor = MEDFVALOR + MEDFVALORdia2;
			SET NEW.menf_valor = MENFVALOR + MENFVALORdia2;	
			SET NEW.total = NEW.med_valor + NEW.men_valor + NEW.medf_valor + NEW.menf_valor;
			
		END IF;	
     ELSE
		SET NEW.med = 0;
		SET NEW.men =0;
		SET NEW.medf = 0;
		SET NEW.menf = 0;
		SET NEW.med_valor =0;
		SET NEW.men_valor = 0;
		SET NEW.medf_valor = 0;
		SET NEW.menf_valor = 0;	
		SET NEW.total =0;	
     END IF;


 END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_info_contacto_INSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_info_contacto_INSERT` BEFORE INSERT ON `empleados_informacion_contacto` FOR EACH ROW BEGIN

SET NEW.nombre_completo = CONCAT(NEW.nombres,' ',NEW.apellidos);
SET NEW.parentesco = (SELECT nombre FROM configuracion_tipos_contacto WHERE id = NEW.id_parentesco);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_info_contacto_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `empleados_info_contacto_UPDATE` BEFORE UPDATE ON `empleados_informacion_contacto` FOR EACH ROW BEGIN

SET NEW.nombre_completo = CONCAT(NEW.nombres,' ',NEW.apellidos);
SET NEW.parentesco = (SELECT nombre FROM configuracion_tipos_contacto WHERE id = NEW.id_parentesco);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERTempleados_llegadas_adjuntos`;
DELIMITER ;;
CREATE TRIGGER `INSERTempleados_llegadas_adjuntos` BEFORE INSERT ON `empleados_llegadas_tarde_adjuntos` FOR EACH ROW BEGIN
         

         SET @contador=(SELECT consecutivo FROM empleados_llegadas_tarde_adjuntos WHERE id_sucursal=NEW.id_sucursal GROUP BY consecutivo DESC LIMIT 0,1);

         IF @contador >0 THEN
             SET NEW.consecutivo=@contador+1;
             SET NEW.nombre_archivo=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                (RIGHT(CONCAT('000000',@contador+1),7))
                                                                           );
      ELSE 
             SET NEW.consecutivo=1;
             SET NEW.nombre_archivo=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                '0000001'
                                                                            );
      END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_novedadesINSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_novedadesINSERT` BEFORE INSERT ON `empleados_novedades` FOR EACH ROW BEGIN
        SET NEW.nombre_empleado = (SELECT nombre FROM empleados WHERE id = NEW.id_empleado);
        SET NEW.tipo =  (SELECT nombre FROM empleados_novedades_tipos WHERE id = NEW.id_tipo);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_novedadesUPDATE`;
DELIMITER ;;
CREATE TRIGGER `empleados_novedadesUPDATE` BEFORE UPDATE ON `empleados_novedades` FOR EACH ROW BEGIN
       SET NEW.nombre_empleado = (SELECT nombre FROM empleados WHERE id = NEW.id_empleado);
       SET NEW.tipo =  (SELECT nombre FROM empleados_novedades_tipos WHERE id = NEW.id_tipo);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_registrosINSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_registrosINSERT` BEFORE INSERT ON `empleados_registro` FOR EACH ROW BEGIN

DECLARE DiaAnterior DATE;

SET DiaAnterior = DATE_SUB(NEW.fecha,INTERVAL 1 DAY);

SET NEW.nombre = (SELECT nombre FROM empleados WHERE documento = NEW.cedula AND activo = 1);

IF(NEW.tipo = 'in') THEN
	IF((SELECT count(fechai) FROM empleados_horas_extras WHERE cedula=NEW.cedula AND fechai = NEW.fecha )<1) THEN
		INSERT INTO empleados_horas_extras (cedula,fechai,horai) VALUES (NEW.cedula,NEW.fecha,NEW.hora);
	END IF;
END IF;

IF(NEW.tipo = 'out') THEN
	IF((SELECT count(fechai) FROM empleados_horas_extras WHERE cedula = NEW.cedula AND fechai = NEW.fecha )>0) THEN
		UPDATE empleados_horas_extras SET cedula = NEW.cedula, fechas = NEW.fecha, horas = NEW.hora,id_equipo = NEW.id_equipo WHERE cedula = NEW.cedula AND fechai = NEW.fecha;
	ELSE
		IF((SELECT count(fechai) FROM empleados_horas_extras WHERE cedula=NEW.cedula AND fechai = DiaAnterior )>0) THEN
			UPDATE empleados_horas_extras SET cedula = NEW.cedula, fechas = NEW.fecha, horas = NEW.hora,id_equipo = NEW.id_equipo WHERE cedula = NEW.cedula AND fechai = DiaAnterior;
		END IF;		
	END IF;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_salidas_sin_registrarINSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_salidas_sin_registrarINSERT` BEFORE INSERT ON `empleados_salidas_sin_registrar` FOR EACH ROW BEGIN

SET NEW.nombre = (SELECT nombre FROM empleados WHERE documento = NEW.documento AND activo = 1);
SET NEW.id_empleado = (SELECT id FROM empleados WHERE documento = NEW.documento AND activo = 1); 
SET NEW.id_empresa = (SELECT id_empresa FROM empleados WHERE documento = NEW.documento AND activo = 1);
SET NEW.id_zona = (SELECT id_zona FROM empleados WHERE documento = NEW.documento AND activo = 1);
SET NEW.id_sucursal = (SELECT id_sucursal FROM empleados WHERE documento = NEW.documento AND activo = 1);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_turnosINSERT`;
DELIMITER ;;
CREATE TRIGGER `empleados_turnosINSERT` BEFORE INSERT ON `empleados_turnos` FOR EACH ROW BEGIN

SET NEW.empleado=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.cedula=(SELECT documento FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.nombre_tipo=(SELECT nombre FROM configuracion_tipos_turnos WHERE id=NEW.tipo);
SET NEW.id_empresa = (SELECT id_empresa FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.empresa = (SELECT empresa FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.id_sucursal = (SELECT id_sucursal FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.id_zona =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.sucursal = (SELECT sucursal FROM empleados WHERE activo=1 AND id=NEW.id_empleado);

IF(NEW.dia_siguiente = 'si') THEN
      SET NEW.fecha_final = ADDDATE(NEW.id_dia,INTERVAL 1 DAY);
ELSE 
      SET NEW.fecha_final = NEW.id_dia;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_turnosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `empleados_turnosUPDATE` BEFORE UPDATE ON `empleados_turnos` FOR EACH ROW BEGIN

SET NEW.empleado=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.cedula=(SELECT documento FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.nombre_tipo=(SELECT nombre FROM configuracion_tipos_turnos WHERE id=NEW.tipo);
SET NEW.id_empresa = (SELECT id_empresa FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.empresa = (SELECT empresa FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.id_sucursal = (SELECT id_sucursal FROM empleados WHERE activo=1 AND id=NEW.id_empleado);
SET NEW.id_zona =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.sucursal = (SELECT sucursal FROM empleados WHERE activo=1 AND id=NEW.id_empleado);

IF(NEW.dia_siguiente = 'si') THEN
      SET NEW.fecha_final = ADDDATE(NEW.id_dia,INTERVAL 1 DAY);
ELSE 
      SET NEW.fecha_final = NEW.id_dia;
END IF;


END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_turnos_insert`;
DELIMITER ;;
CREATE TRIGGER `empleados_turnos_insert` BEFORE INSERT ON `empleados_turnos_log` FOR EACH ROW BEGIN

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
SET NEW.empleado=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_empleado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_turnos_update`;
DELIMITER ;;
CREATE TRIGGER `empleados_turnos_update` BEFORE UPDATE ON `empleados_turnos_log` FOR EACH ROW BEGIN

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
SET NEW.empleado=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_empleado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empleados_upload_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `empleados_upload_UPDATE` BEFORE UPDATE ON `empleados_upload` FOR EACH ROW BEGIN

IF NEW.estado=1 THEN
    SET NEW.id_tercero = (SELECT id FROM empleados WHERE documento=NEW.cedula LIMIT 0,1);
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empresasINSERT`;
DELIMITER ;;
CREATE TRIGGER `empresasINSERT` BEFORE INSERT ON `empresas` FOR EACH ROW BEGIN

SET NEW.tipo_documento_nombre = (SELECT nombre FROM tipo_documento WHERE id = NEW.tipo_documento);
SET NEW.pais = (SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);
SET NEW.moneda = (SELECT descripcion FROM configuracion_moneda WHERE id = NEW.id_moneda);
SET NEW.simbolo_moneda = (SELECT simbolo FROM configuracion_moneda WHERE id = NEW.id_moneda);
SET NEW.decimales_moneda = (SELECT decimales FROM configuracion_moneda WHERE id = NEW.id_moneda);
SET NEW.moneda_compras_letras = (SELECT nombre_en_letras FROM configuracion_moneda WHERE id = NEW.id_moneda_compras);
SET NEW.simbolo_moneda_compras = (SELECT simbolo FROM configuracion_moneda WHERE id = NEW.id_moneda_compras);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empresasUPDATE`;
DELIMITER ;;
CREATE TRIGGER `empresasUPDATE` BEFORE UPDATE ON `empresas` FOR EACH ROW BEGIN

SET NEW.tipo_documento_nombre = (SELECT nombre FROM tipo_documento WHERE id = NEW.tipo_documento);
SET NEW.pais = (SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);
SET NEW.moneda = (SELECT descripcion FROM configuracion_moneda WHERE id = NEW.id_moneda);
SET NEW.simbolo_moneda = (SELECT simbolo FROM configuracion_moneda WHERE id = NEW.id_moneda);
SET NEW.decimales_moneda = (SELECT decimales FROM configuracion_moneda WHERE id = NEW.id_moneda);
SET NEW.moneda_compras_letras = (SELECT nombre_en_letras FROM configuracion_moneda WHERE id = NEW.id_moneda_compras);
SET NEW.simbolo_moneda_compras = (SELECT simbolo FROM configuracion_moneda WHERE id = NEW.id_moneda_compras);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpresasSucursalesINSERT`;
DELIMITER ;;
CREATE TRIGGER `EmpresasSucursalesINSERT` BEFORE INSERT ON `empresas_sucursales` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.zona_nombre = (SELECT nombre FROM configuracion_zonas WHERE id = NEW.zona);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpresasSucursalesINSERT2`;
DELIMITER ;;
CREATE TRIGGER `EmpresasSucursalesINSERT2` AFTER INSERT ON `empresas_sucursales` FOR EACH ROW BEGIN

UPDATE empresas SET sucursales = (SELECT count(id) FROM empresas_sucursales WHERE id_empresa = NEW.id_empresa AND activo = 1) WHERE id = NEW.id_empresa;


END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpresasSucursalesUPDATE`;
DELIMITER ;;
CREATE TRIGGER `EmpresasSucursalesUPDATE` BEFORE UPDATE ON `empresas_sucursales` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.zona_nombre = (SELECT nombre FROM configuracion_zonas WHERE id = NEW.zona);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `EmpresasSucursalesUPDATE2`;
DELIMITER ;;
CREATE TRIGGER `EmpresasSucursalesUPDATE2` AFTER UPDATE ON `empresas_sucursales` FOR EACH ROW BEGIN

UPDATE empresas SET sucursales = (SELECT count(id) FROM empresas_sucursales WHERE id_empresa = NEW.id_empresa AND activo = 1) WHERE id = NEW.id_empresa;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BodegaINSERT`;
DELIMITER ;;
CREATE TRIGGER `BodegaINSERT` BEFORE INSERT ON `empresas_sucursales_bodegas` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BodegaINSERT2`;
DELIMITER ;;
CREATE TRIGGER `BodegaINSERT2` AFTER INSERT ON `empresas_sucursales_bodegas` FOR EACH ROW BEGIN

UPDATE empresas_sucursales SET bodegas = (SELECT count(id) FROM empresas_sucursales_bodegas WHERE id_sucursal = NEW.id_sucursal AND activo = 1) WHERE id = NEW.id_sucursal;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BodegaUPDATE`;
DELIMITER ;;
CREATE TRIGGER `BodegaUPDATE` BEFORE UPDATE ON `empresas_sucursales_bodegas` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BodegaUPDATE2`;
DELIMITER ;;
CREATE TRIGGER `BodegaUPDATE2` AFTER UPDATE ON `empresas_sucursales_bodegas` FOR EACH ROW BEGIN

UPDATE empresas_sucursales SET bodegas = (SELECT count(id) FROM empresas_sucursales_bodegas WHERE id_sucursal = NEW.id_sucursal AND activo = 1) WHERE id = NEW.id_sucursal;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empresas_sucursales_bodegas_tercerosINSERT`;
DELIMITER ;;
CREATE TRIGGER `empresas_sucursales_bodegas_tercerosINSERT` BEFORE INSERT ON `empresas_sucursales_bodegas_terceros` FOR EACH ROW BEGIN
       SET NEW.sucursal = (SELECT nombre FROM terceros_direcciones WHERE id = NEW.id_sucursal);
       SET NEW.nombre_tercero =  (SELECT nombre FROM terceros WHERE id = NEW.id_tercero);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `empresas_sucursales_bodegas_tercerosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `empresas_sucursales_bodegas_tercerosUPDATE` BEFORE UPDATE ON `empresas_sucursales_bodegas_terceros` FOR EACH ROW BEGIN
       SET NEW.sucursal = (SELECT nombre FROM terceros_direcciones WHERE id = NEW.id_sucursal);
       SET NEW.nombre_tercero =  (SELECT nombre FROM terceros WHERE id = NEW.id_tercero);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BodegaINSERT_copy`;
DELIMITER ;;
CREATE TRIGGER `BodegaINSERT_copy` BEFORE INSERT ON `empresas_sucursales_marcas` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BodegaINSERT2_copy`;
DELIMITER ;;
CREATE TRIGGER `BodegaINSERT2_copy` AFTER INSERT ON `empresas_sucursales_marcas` FOR EACH ROW BEGIN

UPDATE empresas_sucursales SET bodegas = (SELECT count(id) FROM empresas_sucursales_bodegas WHERE id_sucursal = NEW.id_sucursal AND activo = 1) WHERE id = NEW.id_sucursal;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BodegaUPDATE_copy`;
DELIMITER ;;
CREATE TRIGGER `BodegaUPDATE_copy` BEFORE UPDATE ON `empresas_sucursales_marcas` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `BodegaUPDATE2_copy`;
DELIMITER ;;
CREATE TRIGGER `BodegaUPDATE2_copy` AFTER UPDATE ON `empresas_sucursales_marcas` FOR EACH ROW BEGIN

UPDATE empresas_sucursales SET bodegas = (SELECT count(id) FROM empresas_sucursales_bodegas WHERE id_sucursal = NEW.id_sucursal AND activo = 1) WHERE id = NEW.id_sucursal;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `encuestaFECHAINSERT`;
DELIMITER ;;
CREATE TRIGGER `encuestaFECHAINSERT` BEFORE INSERT ON `encuestas` FOR EACH ROW BEGIN
 SET NEW.fecha_creacion=now();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fecha_error_mail`;
DELIMITER ;;
CREATE TRIGGER `fecha_error_mail` BEFORE INSERT ON `encuestas_error_mail` FOR EACH ROW BEGIN
 SET NEW.fecha=now();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `encuestas_preguntas_insert`;
DELIMITER ;;
CREATE TRIGGER `encuestas_preguntas_insert` BEFORE INSERT ON `encuestas_preguntas` FOR EACH ROW BEGIN
SET NEW.tipo_nombre=   CASE NEW.tipo
                                                                    WHEN 1 THEN  'Seleccion Multiple'
                                                                    WHEN 2 THEN  'Abierta'
                                                                    WHEN 3 THEN  'Matricial'
                                                                    WHEN 4 THEN  'Titulo'        
                                                                    WHEN 5 THEN  'Hospedaje'    
                                                                    WHEN 6 THEN  'Html'                                                                      
                                                          END;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `encuestas_preguntas_upate`;
DELIMITER ;;
CREATE TRIGGER `encuestas_preguntas_upate` BEFORE UPDATE ON `encuestas_preguntas` FOR EACH ROW BEGIN
SET NEW.tipo_nombre=   CASE NEW.tipo
                                                                    WHEN 1 THEN  'Seleccion Multiple'
                                                                    WHEN 2 THEN  'Abierta'
                                                                    WHEN 3 THEN  'Matricial'
                                                                    WHEN 4 THEN  'Titulo'        
                                                                    WHEN 5 THEN  'Hospedaje'    
                                                                    WHEN 6 THEN  'Html'                                                                      
                                                          END;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `encuestas_respuestas_INSERT`;
DELIMITER ;;
CREATE TRIGGER `encuestas_respuestas_INSERT` BEFORE INSERT ON `encuestas_respuestas` FOR EACH ROW BEGIN

SET NEW.valor_x = (SELECT detalle FROM encuestas_preguntas_detallesX WHERE id=NEW.x LIMIT 0,1);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `encuestas_respuestas_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `encuestas_respuestas_UPDATE` BEFORE UPDATE ON `encuestas_respuestas` FOR EACH ROW BEGIN

SET NEW.valor_x = (SELECT detalle FROM encuestas_preguntas_detallesX WHERE id=NEW.x LIMIT 0,1);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fecha_envio_encuesta`;
DELIMITER ;;
CREATE TRIGGER `fecha_envio_encuesta` BEFORE INSERT ON `encuestas_usuarios` FOR EACH ROW BEGIN
 SET NEW.fecha_envio_encuesta=now();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fecha_online`;
DELIMITER ;;
CREATE TRIGGER `fecha_online` BEFORE INSERT ON `encuestas_usuarios_online` FOR EACH ROW BEGIN
 SET NEW.fecha=NOW();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `encuestas_usuarios_online_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `encuestas_usuarios_online_UPDATE` BEFORE UPDATE ON `encuestas_usuarios_online` FOR EACH ROW BEGIN

DECLARE promedio FLOAT;
DECLARE minimo INT;
DECLARE conforme INT;
DECLARE count_rol INT;
DECLARE calificacion_solicitada VARCHAR(5);
DECLARE var_conforme VARCHAR(2);
DECLARE var_value VARCHAR(15);

DECLARE pago INT;
DECLARE var_pago VARCHAR(2);

#VARIABLES PARA LOS PROMEDIOS DE LAS ENCUESTAS DE HOTELES
DECLARE done BOOL DEFAULT FALSE;
DECLARE contPromedio FLOAT;
DECLARE contPreguntas INT;
DECLARE acumPromedio FLOAT;
DECLARE cursor1 CURSOR FOR SELECT AVG(encuestas_preguntas_detallesX.valores) AS contPromedio FROM encuestas_respuestas, encuestas_usuarios_online, encuestas_preguntas, encuestas_preguntas_detallesX  WHERE  encuestas_usuarios_online.id = encuestas_respuestas.usuario  AND encuestas_respuestas.id_pregunta = encuestas_preguntas.id  AND encuestas_respuestas.id_pregunta <> 717 AND encuestas_respuestas.x = encuestas_preguntas_detallesX.id  AND encuestas_usuarios_online.id = NEW.id  GROUP BY  encuestas_preguntas.id  ORDER BY encuestas_preguntas.id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

IF NEW.tipo='interno' AND NEW.realizado=1 THEN

    SET minimo = (SELECT MIN(valor_x) AS minimo FROM encuestas_respuestas WHERE id_pregunta = 703 AND usuario=NEW.id);

    #CONFORMIDAD DE LA OC
    SET conforme = (SELECT COUNT(id) AS CONT FROM encuestas_respuestas WHERE valor_x='NO CONFORME' AND usuario=NEW.id);

    IF conforme > 0 THEN 
         SET var_conforme = 'no';
         #SI HAY INCONFORMIDAD ENTONCES SE PROMEDIA CON ESTAS INCONFORMES
         SET promedio = (SELECT round(AVG(valor_x),2) AS promedio FROM encuestas_respuestas WHERE id_pregunta = 703 AND usuario=NEW.id AND valor_x < 4);
    ELSE 
         SET var_conforme = 'si';
         #SI LA OC ES CONFORME ENTONCES SE PROMEDIA CON TODAS
         SET promedio = (SELECT round(AVG(valor_x),2) AS promedio FROM encuestas_respuestas WHERE id_pregunta = 703 AND usuario=NEW.id);
    END IF; 

   #PARA PROVEEDORES
    SET NEW.promedio = promedio;
    SET NEW.minimo = minimo;

    #PAGO DE LA OC
    SET pago = (SELECT COUNT(id) AS CONT FROM encuestas_respuestas WHERE valor_x='NO' AND usuario=NEW.id);     

    IF pago > 0 THEN SET var_pago = 'no';
    ELSE SET var_pago = 'si';
    END IF;

    IF var_pago =  'si' AND  var_conforme = 'si' THEN SET var_value = 'evaluacion';
    ELSE SET var_value = '';
    END IF;

     #INDICAR SI FUE DILIGENCIADA POR FUNCIONARIO O POR ENCARGADO DEL SIIP
    SET count_rol = (SELECT count(id) FROM empleados WHERE id = NEW.extra AND id_rol = 1);
    IF count_rol = 1 THEN
            SET calificacion_solicitada = 'true';
    ELSE
            SET calificacion_solicitada = 'false';
    END IF;

    #INSERT INTO debug(debug) VALUES (CONCAT(NEW.extra,'-->',count_rol));
   
    IF OLD.realizado=1 THEN     
              UPDATE compras_ordenes SET  calificacion_solicitada=calificacion_solicitada, encuesta='si', id_encuesta=NEW.id, conforme_encuesta=var_conforme, pago_encuesta=var_pago,verificacion =var_value,calificacion_proveedor = promedio,calificacion_minima_proveedor = minimo WHERE consecutivo=NEW.mail AND id_empresa=NEW.extra2;
    ELSE UPDATE compras_ordenes SET  calificacion_solicitada=calificacion_solicitada, encuesta='si', id_encuesta=NEW.id, conforme_encuesta=var_conforme, pago_encuesta=var_pago,verificacion =var_value,fecha_encuesta=NOW(),calificacion_proveedor = promedio,calificacion_minima_proveedor = minimo WHERE consecutivo=NEW.mail AND id_empresa=NEW.extra2;
    END IF;

ELSEIF NEW.tipo='interno' AND NEW.realizado=0 THEN UPDATE compras_ordenes SET  encuesta='no', id_encuesta=null, conforme_encuesta='', pago_encuesta='',verificacion ='',fecha_encuesta=null,calificacion_proveedor = 0,calificacion_minima_proveedor = 0 WHERE consecutivo=NEW.mail AND id_empresa=NEW.extra2;

END IF;

#PROMEDIO DE LAS ENCUESTAS DE HOTELES
IF NEW.tipo IS NULL AND NEW.zona >0 AND NEW.realizado=1 THEN

     SET acumPromedio = 0.0;     
     SET contPreguntas = 0;

     OPEN cursor1;
     read_cursor1: LOOP
              FETCH cursor1 INTO contPromedio;

              IF done THEN
                   CLOSE cursor1;
                   LEAVE read_cursor1;
              END IF;

              SET acumPromedio = acumPromedio + contPromedio;
              SET contPreguntas = contPreguntas +1;
     END LOOP;

     SET acumPromedio = acumPromedio/contPreguntas ;
     #SET NEW.debug = contPreguntas ;
     SET NEW.promedio = acumPromedio;
     
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `equipos_registroUPDATE`;
DELIMITER ;;
CREATE TRIGGER `equipos_registroUPDATE` BEFORE UPDATE ON `equipos_registro` FOR EACH ROW BEGIN
   SET NEW.sucursal_nombre =CONCAT( (SELECT empresa FROM vista_sucursales_empresas WHERE id_sucursal = NEW.sucursal),' - ',(SELECT sucursal FROM vista_sucursales_empresas WHERE id_sucursal = NEW.sucursal));
   SET NEW.usuario =(SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
   SET NEW.id_empresa =(SELECT id_empresa FROM vista_sucursales_empresas WHERE id_sucursal = NEW.sucursal);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `formato_relacion_equiposINSERT`;
DELIMITER ;;
CREATE TRIGGER `formato_relacion_equiposINSERT` BEFORE INSERT ON `formato_relacion_equipos_pedidos` FOR EACH ROW BEGIN
    SET NEW.fecha_solicitud = NOW();
    #CONSECUTIVO DOCUMENTO
     SET NEW.consecutivo=(SELECT consecutivo FROM formato_relacion_equipos_pedidos WHERE id_empresa=NEW.id_empresa AND id_sucursal = NEW.id_sucursal ORDER BY consecutivo DESC LIMIT 0,1);     

     IF NEW.consecutivo > 0 THEN  SET NEW.consecutivo = NEW.consecutivo+1;
     ELSE  SET NEW.consecutivo=1; 
     END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERTgerencia_turno`;
DELIMITER ;;
CREATE TRIGGER `INSERTgerencia_turno` BEFORE INSERT ON `gerencia_turno` FOR EACH ROW BEGIN

     SET NEW.empleado=(SELECT nombre FROM empleados WHERE id=NEW.id_empleado);
     SET NEW.email=(SELECT email_empresa FROM empleados WHERE id=NEW.id_empleado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `historico_equiposINSERT`;
DELIMITER ;;
CREATE TRIGGER `historico_equiposINSERT` BEFORE INSERT ON `historico_equipos` FOR EACH ROW BEGIN

IF(NEW.tipo_user = 0) THEN
     SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
END IF;

IF(NEW.tipo_user = 1) THEN
     SET NEW.usuario = (SELECT nombre_comercial FROM terceros WHERE id = NEW.id_usuario);
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `InventarioCiclicoINSERT`;
DELIMITER ;;
CREATE TRIGGER `InventarioCiclicoINSERT` BEFORE INSERT ON `inventario_ciclico` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.id_zona =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.bodega = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `InventarioCiclicoUPDATE`;
DELIMITER ;;
CREATE TRIGGER `InventarioCiclicoUPDATE` BEFORE UPDATE ON `inventario_ciclico` FOR EACH ROW BEGIN
      SET NEW.id_zona =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventarios_documentosINSERT`;
DELIMITER ;;
CREATE TRIGGER `inventarios_documentosINSERT` BEFORE INSERT ON `inventario_documentos` FOR EACH ROW BEGIN
SET NEW.nombre_inventario_documento = (SELECT nombre FROM configuracion_inventarios_documentos WHERE id = NEW.id_inventario_documento);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventario_estadisticas_usoINSERT`;
DELIMITER ;;
CREATE TRIGGER `inventario_estadisticas_usoINSERT` BEFORE INSERT ON `inventario_estadisticas_uso` FOR EACH ROW BEGIN

INSERT INTO historico_equipos (tipo,tipo_nombre,id_equipo,fecha,tipo_user,id_usuario,id_evento)VALUES(5,'Alquiler',NEW.id_equipo,NEW.desde,1,NEW.id_cliente,NEW.id_pedido);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventario_novedadesINSERT`;
DELIMITER ;;
CREATE TRIGGER `inventario_novedadesINSERT` BEFORE INSERT ON `inventario_novedades` FOR EACH ROW BEGIN

SET NEW.concepto = (SELECT motivo FROM configuracion_novedades_inventario WHERE id = NEW.id_concepto);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `Inventario_novedadesUPDATE`;
DELIMITER ;;
CREATE TRIGGER `Inventario_novedadesUPDATE` BEFORE UPDATE ON `inventario_novedades` FOR EACH ROW BEGIN

SET NEW.concepto = (SELECT motivo FROM configuracion_novedades_inventario WHERE id = NEW.id_concepto);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventario_prestamosINSERT`;
DELIMITER ;;
CREATE TRIGGER `inventario_prestamosINSERT` BEFORE INSERT ON `inventario_prestamos` FOR EACH ROW BEGIN

SET NEW.nombre_empresa_origen = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa_origen);
SET NEW.id_zona_origen =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_origen);
SET NEW.nombre_sucursal_origen = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_origen);
SET NEW.nombre_bodega_origen = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega_origen);
SET NEW.nombre_empresa_destino = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa_destino);
SET NEW.id_zona_destino =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_destino);
SET NEW.nombre_sucursal_destino = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_destino);
SET NEW.nombre_bodega_destino = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega_destino);
SET NEW.nombre_equipo = (SELECT nombre_equipo FROM inventarios WHERE id = NEW.id_equipo);
SET NEW.nombre_usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
SET NEW.codigo = (SELECT codigo FROM inventarios WHERE id = NEW.id_equipo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventario_prestamosINSERTafter`;
DELIMITER ;;
CREATE TRIGGER `inventario_prestamosINSERTafter` AFTER INSERT ON `inventario_prestamos` FOR EACH ROW BEGIN
     IF(NEW.prestamos_devolucion = 'true')THEN
            INSERT INTO historico_equipos  (tipo,tipo_nombre,id_equipo,fecha,tipo_user,id_usuario,id_evento)VALUES(2,'Prestamo',NEW.id_equipo,NEW.fecha,0,NEW.id_usuario,NEW.id);
      ELSE
             INSERT INTO historico_equipos  (tipo,tipo_nombre,id_equipo,fecha,tipo_user,id_usuario,id_evento)VALUES(2,'Devolucion de prestamo',NEW.id_equipo,NEW.fecha,0,NEW.id_usuario,NEW.id);
      END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventario_prestamosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `inventario_prestamosUPDATE` BEFORE UPDATE ON `inventario_prestamos` FOR EACH ROW BEGIN

SET NEW.nombre_empresa_origen = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa_origen);
SET NEW.id_zona_origen =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_origen);
SET NEW.nombre_sucursal_origen = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_origen);
SET NEW.nombre_bodega_origen = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega_origen);
SET NEW.nombre_empresa_destino = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa_destino);
SET NEW.id_zona_destino =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_destino);
SET NEW.nombre_sucursal_destino = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_destino);
SET NEW.nombre_bodega_destino = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega_destino);
SET NEW.nombre_equipo = (SELECT nombre_equipo FROM inventarios WHERE id = NEW.id_equipo);
SET NEW.nombre_usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
SET NEW.codigo = (SELECT codigo FROM inventarios WHERE id = NEW.id_equipo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `InventarioProcesoINSERT`;
DELIMITER ;;
CREATE TRIGGER `InventarioProcesoINSERT` BEFORE INSERT ON `inventario_proceso` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.bodega = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `InventarioProcesoUPDATE`;
DELIMITER ;;
CREATE TRIGGER `InventarioProcesoUPDATE` BEFORE UPDATE ON `inventario_proceso` FOR EACH ROW BEGIN

DECLARE cont INT(11);
SET cont= (SELECT COUNT(*) FROM empleados WHERE username = NEW.usuario_inventario);

IF cont =1 THEN
SET NEW.id_usuario_inventario = (SELECT id FROM empleados WHERE username = NEW.usuario_inventario);
SET NEW.nombre_usuario_inventario = (SELECT nombre FROM empleados WHERE username = NEW.usuario_inventario);
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventarios_proceso_items_outINSERT`;
DELIMITER ;;
CREATE TRIGGER `inventarios_proceso_items_outINSERT` BEFORE INSERT ON `inventario_proceso_items_out` FOR EACH ROW BEGIN

DECLARE cont INT(11);
DECLARE prestamo VARCHAR(20);
DECLARE es_prestado VARCHAR(20);


SET cont= (SELECT COUNT(*) FROM inventarios WHERE codigo = NEW.codigo);

IF cont > 0 THEN
SET NEW.id_equipo  = (SELECT id FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.equipo  = (SELECT nombre_equipo FROM inventarios WHERE codigo = NEW.codigo);

SET NEW.id_empresa  = (SELECT id_empresa FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.empresa  = (SELECT empresa FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.id_sucursal  = (SELECT id_sucursal FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.sucursal  = (SELECT sucursal FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.id_bodega  = (SELECT id_ubicacion FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.bodega  = (SELECT ubicacion FROM inventarios WHERE codigo = NEW.codigo);

SET NEW.id_empresa_prestamo  = (SELECT id_empresa_prestamo FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.empresa_prestamo  = (SELECT empresa_prestamo FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.id_sucursal_prestamo  = (SELECT id_sucursal_prestamo FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.sucursal_prestamo  = (SELECT sucursal_prestamo FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.id_bodega_prestamo  = (SELECT id_bodega_prestamo FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.bodega_prestamo  = (SELECT bodega_prestamo FROM inventarios WHERE codigo = NEW.codigo);

SET NEW.prestado  = (SELECT prestado FROM inventarios WHERE codigo = NEW.codigo);
SET NEW.pertenece_inventario_global  = 'true';
ELSE
SET NEW.pertenece_inventario_global  = 'false';
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventario_trasladosINSERT`;
DELIMITER ;;
CREATE TRIGGER `inventario_trasladosINSERT` BEFORE INSERT ON `inventario_traslados` FOR EACH ROW BEGIN
SET NEW.nombre_empresa_origen = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa_origen);
SET NEW.id_zona_origen =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_origen);
SET NEW.nombre_sucursal_origen = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_origen);
SET NEW.nombre_bodega_origen = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega_origen);
SET NEW.nombre_empresa_destino = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa_destino);
SET NEW.id_zona_destino =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_destino);
SET NEW.nombre_sucursal_destino = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_destino);
SET NEW.nombre_bodega_destino = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega_destino);
SET NEW.nombre_equipo = (SELECT nombre_equipo FROM inventarios WHERE id = NEW.id_equipo);
SET NEW.nombre_usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
SET NEW.codigo = (SELECT codigo FROM inventarios WHERE id = NEW.id_equipo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventario_trasladosINSERTafter`;
DELIMITER ;;
CREATE TRIGGER `inventario_trasladosINSERTafter` AFTER INSERT ON `inventario_traslados` FOR EACH ROW BEGIN

INSERT INTO historico_equipos (tipo,tipo_nombre,id_equipo,fecha,tipo_user,id_usuario,id_evento)VALUES(1,'Traslado',NEW.id_equipo,NEW.fecha,0,NEW.id_usuario,NEW.id);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventario_trasladosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `inventario_trasladosUPDATE` BEFORE UPDATE ON `inventario_traslados` FOR EACH ROW BEGIN
SET NEW.nombre_empresa_origen = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa_origen);
SET NEW.id_zona_origen =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_origen);
SET NEW.nombre_sucursal_origen = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_origen);
SET NEW.nombre_bodega_origen = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega_origen);
SET NEW.nombre_empresa_destino = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa_destino);
SET NEW.id_zona_destino =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_destino);
SET NEW.nombre_sucursal_destino = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_destino);
SET NEW.nombre_bodega_destino = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega_destino);
SET NEW.nombre_equipo = (SELECT nombre_equipo FROM inventarios WHERE id = NEW.id_equipo);
SET NEW.nombre_usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
SET NEW.codigo = (SELECT codigo FROM inventarios WHERE id = NEW.id_equipo);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventariosINSERT`;
DELIMITER ;;
CREATE TRIGGER `inventariosINSERT` BEFORE INSERT ON `inventarios` FOR EACH ROW BEGIN
SET NEW.ubicacion = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_ubicacion);
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.grupo= (SELECT nombre_grupo FROM inventario_grupo WHERE id = NEW.id_grupo);
SET NEW.cod_grupo= (SELECT codigo_grupo FROM inventario_grupo WHERE id = NEW.id_grupo);
SET NEW.subgrupo= (SELECT nombre_subgrupo FROM inventario_grupo_subgrupo WHERE id = NEW.id_subgrupo);
SET NEW.cod_subgrupo= (SELECT codigo_subgrupo FROM inventario_grupo_subgrupo WHERE id = NEW.id_subgrupo);
SET NEW.id_subgrupo2=  NEW.id_subgrupo;
SET NEW.checklist = (SELECT nombre FROM configuracion_mantenimiento_checklist WHERE id = NEW.id_checklist);
SET NEW.codigo = CONCAT(LPAD(NEW.cod_grupo,2,0),LPAD(NEW.cod_subgrupo,2,0),LPAD(ObtenerActualizarConsecutivoInventario(),6,0) );
SET NEW.fecha_creacion_en_inventario =now();
SET NEW.ubicacion_baja = (SELECT nombre FROM configuracion_dados_de_baja_ubicaciones WHERE id = NEW.id_ubicacion_baja);
SET NEW.nit_proveedor =(SELECT numero_identificacion FROM terceros WHERE id=NEW.id_proveedor);
SET NEW.proveedor =(SELECT nombre FROM terceros WHERE id=NEW.id_proveedor);

SET NEW.id_zona =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.zona =  (SELECT zona_nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal); 
SET NEW.id_zona_prestamo =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_prestamo);
SET NEW.zona_prestamo =  (SELECT zona_nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_prestamo); 

SET NEW.area = (SELECT nombre FROM terceros_direcciones_areas WHERE id = NEW.id_area);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventariosINSERTafter`;
DELIMITER ;;
CREATE TRIGGER `inventariosINSERTafter` AFTER INSERT ON `inventarios` FOR EACH ROW BEGIN
INSERT INTO historico_equipos (tipo,tipo_nombre,id_equipo,fecha,tipo_user,id_usuario,id_evento)VALUES(0,'Creacion',NEW.id,NEW.fecha_creacion_en_inventario,0,NEW.id_usuario_creacion,NEW.id);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `inventariosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `inventariosUPDATE` BEFORE UPDATE ON `inventarios` FOR EACH ROW BEGIN
SET NEW.ubicacion = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_ubicacion);
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.grupo= (SELECT nombre_grupo FROM inventario_grupo WHERE id = NEW.id_grupo);
SET NEW.subgrupo= (SELECT nombre_subgrupo FROM inventario_grupo_subgrupo WHERE id = NEW.id_subgrupo);
SET NEW.id_subgrupo2=  NEW.id_subgrupo;
SET NEW.checklist = (SELECT nombre FROM configuracion_mantenimiento_checklist WHERE id = NEW.id_checklist);
SET NEW.nit_proveedor =(SELECT numero_identificacion FROM terceros WHERE id=NEW.id_proveedor);
SET NEW.proveedor =(SELECT nombre FROM terceros WHERE id=NEW.id_proveedor);

IF (NEW.dado_baja = 'false') THEN
SET NEW.id_ubicacion_baja = 0;
SET NEW.fecha_dado_baja = NULL;
SET NEW.usuario_dado_baja = NULL;
END IF;

#DAR DE BAJA A EQUIPO
IF (OLD.dado_baja = 'false' AND NEW.dado_baja = 'true') THEN
SET NEW.fecha_dado_baja = NOW();
SET NEW.usuario_dado_baja = NEW.id_usuario_creacion;
END IF;

SET NEW.ubicacion_baja = (SELECT nombre FROM configuracion_dados_de_baja_ubicaciones WHERE id = NEW.id_ubicacion_baja);

IF (NEW.id_usuario_encargado >0) THEN
SET NEW.nombre_usuario_encargado = (SELECT nombre FROM empleados WHERE id= NEW.id_usuario_encargado );
END IF;

SET NEW.id_zona =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.zona =  (SELECT zona_nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal); 
SET NEW.id_zona_prestamo =  (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal_prestamo);
SET NEW.zona_prestamo =  (SELECT zona_nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal_prestamo); 

SET NEW.area = (SELECT nombre FROM terceros_direcciones_areas WHERE id = NEW.id_area);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `itemsINSERT`;
DELIMITER ;;
CREATE TRIGGER `itemsINSERT` BEFORE INSERT ON `items` FOR EACH ROW BEGIN

SET NEW.codigo =(SELECT codigo FROM items_general WHERE id = NEW.id_items_general);
SET NEW.nombre =(SELECT nombre FROM items_general WHERE id = NEW.id_items_general);
SET NEW.name =(SELECT name FROM items_general WHERE id = NEW.id_items_general);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `items_familia_grupoINSERT`;
DELIMITER ;;
CREATE TRIGGER `items_familia_grupoINSERT` BEFORE INSERT ON `items_familia_grupo` FOR EACH ROW BEGIN

     SET NEW.familia = (SELECT nombre FROM items_familia WHERE id = NEW.id_familia);
     SET NEW.cod_familia = (SELECT codigo FROM items_familia WHERE id = NEW.id_familia);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `items_familia_grupoUPDATE`;
DELIMITER ;;
CREATE TRIGGER `items_familia_grupoUPDATE` BEFORE UPDATE ON `items_familia_grupo` FOR EACH ROW BEGIN

     SET NEW.familia = (SELECT nombre FROM items_familia WHERE id = NEW.id_familia);
     SET NEW.cod_familia = (SELECT codigo FROM items_familia WHERE id = NEW.id_familia);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `items_familia_grupo_subgrupoINSERT`;
DELIMITER ;;
CREATE TRIGGER `items_familia_grupo_subgrupoINSERT` BEFORE INSERT ON `items_familia_grupo_subgrupo` FOR EACH ROW BEGIN

     SET NEW.grupo = (SELECT nombre FROM items_familia_grupo WHERE id = NEW.id_grupo);
     SET NEW.cod_grupo = (SELECT codigo FROM items_familia_grupo WHERE id = NEW.id_grupo);
     SET NEW.id_familia = (SELECT id_familia FROM items_familia_grupo WHERE id = NEW.id_grupo);
     SET NEW.cod_familia = (SELECT cod_familia FROM items_familia_grupo WHERE id = NEW.id_grupo);
     SET NEW.familia = (SELECT familia FROM items_familia_grupo WHERE id = NEW.id_grupo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `items_familia_grupo_subgrupoUPDATE`;
DELIMITER ;;
CREATE TRIGGER `items_familia_grupo_subgrupoUPDATE` BEFORE UPDATE ON `items_familia_grupo_subgrupo` FOR EACH ROW BEGIN

     SET NEW.grupo = (SELECT nombre FROM items_familia_grupo WHERE id = NEW.id_grupo);
     SET NEW.cod_grupo = (SELECT codigo FROM items_familia_grupo WHERE id = NEW.id_grupo);
     SET NEW.id_familia = (SELECT id_familia FROM items_familia_grupo WHERE id = NEW.id_grupo);
     SET NEW.cod_familia = (SELECT cod_familia FROM items_familia_grupo WHERE id = NEW.id_grupo);
     SET NEW.familia = (SELECT familia FROM items_familia_grupo WHERE id = NEW.id_grupo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `items_general_INSERT`;
DELIMITER ;;
CREATE TRIGGER `items_general_INSERT` BEFORE INSERT ON `items_general` FOR EACH ROW BEGIN

DECLARE cuantos INT;

SET cuantos = (SELECT count(id) FROM items_general WHERE id_familia = NEW.id_familia AND id_grupo = NEW.id_grupo AND id_subgrupo = NEW.id_subgrupo);
SET NEW.codigo = CONCAT(
                                            (SELECT codigo FROM items_familia WHERE id = NEW.id_familia),
                                            (SELECT codigo FROM items_familia_grupo WHERE id = NEW.id_grupo),
                                            (SELECT codigo FROM items_familia_grupo_subgrupo WHERE id = NEW.id_subgrupo),
                                            LPAD(cuantos+1,4,'0')
                                      );

SET NEW.familia = (SELECT nombre FROM items_familia WHERE id = NEW.id_familia);
SET NEW.grupo = (SELECT nombre FROM items_familia_grupo WHERE id = NEW.id_grupo);
SET NEW.subgrupo = (SELECT nombre FROM items_familia_grupo_subgrupo WHERE id = NEW.id_subgrupo);



END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `items_general_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `items_general_UPDATE` BEFORE UPDATE ON `items_general` FOR EACH ROW BEGIN

SET NEW.familia = (SELECT nombre FROM items_familia WHERE id = NEW.id_familia);
SET NEW.grupo = (SELECT nombre FROM items_familia_grupo WHERE id = NEW.id_grupo);
SET NEW.subgrupo = (SELECT nombre FROM items_familia_grupo_subgrupo WHERE id = NEW.id_subgrupo);

#SI ACTUALIZO EL NOMBRE DEL ITEM GENERAL LO ACTUALIZO EN LOS ITEMS POR EMPRESA
UPDATE items SET nombre = NEW.nombre,name = NEW.name WHERE id_items_general = NEW.id;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `logINSERT`;
DELIMITER ;;
CREATE TRIGGER `logINSERT` BEFORE INSERT ON `log` FOR EACH ROW BEGIN

SET NEW.username = (SELECT username FROM empleados WHERE id = NEW.user);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `logs_mysqlINSERT`;
DELIMITER ;;
CREATE TRIGGER `logs_mysqlINSERT` BEFORE INSERT ON `logs_mysql` FOR EACH ROW BEGIN
     SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mantenimientoINSERT`;
DELIMITER ;;
CREATE TRIGGER `mantenimientoINSERT` BEFORE INSERT ON `mantenimiento` FOR EACH ROW BEGIN

SET NEW.bodega = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega);
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.equipo = (SELECT nombre_equipo FROM inventarios WHERE id = NEW.id_inventario);
SET NEW.cod_equipo = (SELECT codigo FROM inventarios WHERE id = NEW.id_inventario);
SET NEW.nombre_usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mantenimientoINSERTafter`;
DELIMITER ;;
CREATE TRIGGER `mantenimientoINSERTafter` AFTER INSERT ON `mantenimiento` FOR EACH ROW BEGIN

INSERT INTO historico_equipos (tipo,tipo_nombre,id_equipo,fecha,tipo_user,id_usuario,id_evento)VALUES(3,'Informe mantenimiento',NEW.id_inventario,NEW.fecha_hora_mantenimiento,0,NEW.id_usuario,NEW.id);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mantenimientoUPDATE`;
DELIMITER ;;
CREATE TRIGGER `mantenimientoUPDATE` BEFORE UPDATE ON `mantenimiento` FOR EACH ROW BEGIN

SET NEW.bodega = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega);
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.equipo = (SELECT nombre_equipo FROM inventarios WHERE id = NEW.id_inventario);
SET NEW.cod_equipo = (SELECT codigo FROM inventarios WHERE id = NEW.id_inventario);
SET NEW.nombre_usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mantenimiento_datosINSERT`;
DELIMITER ;;
CREATE TRIGGER `mantenimiento_datosINSERT` BEFORE INSERT ON `mantenimiento_datos` FOR EACH ROW BEGIN
SET NEW.checklist = (SELECT nombre FROM configuracion_mantenimiento_checklist WHERE id = NEW.id_checklist);
SET NEW.checklist_detalle = (SELECT nombre FROM configuracion_mantenimiento_checklist_detalles WHERE id = NEW.id_checklist_detalle);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `mantenimiento_datosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `mantenimiento_datosUPDATE` BEFORE UPDATE ON `mantenimiento_datos` FOR EACH ROW BEGIN
SET NEW.checklist = (SELECT nombre FROM configuracion_mantenimiento_checklist WHERE id = NEW.id_checklist);
SET NEW.checklist_detalle = (SELECT nombre FROM configuracion_mantenimiento_checklist_detalles WHERE id = NEW.id_checklist_detalle);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedidoINSERT`;
DELIMITER ;;
CREATE TRIGGER `pedidoINSERT` BEFORE INSERT ON `pedido` FOR EACH ROW BEGIN

SET NEW.fecha_documento=now();
SET NEW.hora_documento=now();
SET NEW.empresa=(SELECT nombre FROM empresas WHERE id=NEW.id_empresa);
SET NEW.sucursal=(SELECT  nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal);
SET NEW.id_zona=(SELECT  zona FROM vista_sucursales_empresas WHERE id_sucursal=NEW.id_sucursal);
SET NEW.zona=(SELECT  zona_nombre FROM vista_sucursales_empresas WHERE id_sucursal=NEW.id_sucursal);

SET NEW.moneda_base=(SELECT id_moneda FROM empresas WHERE id = NEW.id_empresa);
SET NEW.moneda_documento=(SELECT id_moneda FROM empresas WHERE id = NEW.id_empresa);
SET NEW.simbolo_moneda=(SELECT simbolo_moneda FROM empresas WHERE id = NEW.id_empresa);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedidoUPDATE`;
DELIMITER ;;
CREATE TRIGGER `pedidoUPDATE` BEFORE UPDATE ON `pedido` FOR EACH ROW BEGIN

DECLARE CualDireccion CHAR;
#cuantas cotizaciones tiene mi tercero
DECLARE acumCotizaciones INT;

SET CualDireccion =  (SELECT direccion_principal FROM  terceros_direcciones WHERE id = NEW.id_terceros_direcciones);

SET NEW.empresa=(SELECT nombre FROM empresas WHERE id=NEW.id_empresa);
SET NEW.sucursal=(SELECT  nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal);

SET NEW.id_zona=(SELECT  zona FROM vista_sucursales_empresas WHERE id_sucursal=NEW.id_sucursal);
SET NEW.zona=(SELECT  zona_nombre FROM vista_sucursales_empresas WHERE id_sucursal=NEW.id_sucursal);

SET NEW.tipo_identificacion=(SELECT tipo_identificacion FROM terceros WHERE id=NEW.id_cliente LIMIT 0,1);
SET NEW.contacto=(SELECT nombre FROM terceros_contactos WHERE id=NEW.id_contacto);
SET NEW.forma_pago=(SELECT nombre FROM configuracion_formas_pago WHERE id=NEW.id_forma_pago);

SET NEW.vendedor=(SELECT nombre FROM empleados WHERE id=NEW.id_vendedor);

SET NEW.simbolo_moneda=(SELECT simbolo FROM configuracion_moneda WHERE id = NEW.moneda_documento);

IF(CualDireccion  = 1) THEN
      SET NEW.nombre_comercial=(SELECT nombre_comercial FROM terceros WHERE id=NEW.id_cliente);
      SET NEW.direccion_cliente=(SELECT direccion FROM terceros WHERE id=NEW.id_cliente);
      SET NEW.telefono_cliente=(SELECT telefono1 FROM terceros WHERE id=NEW.id_cliente);      
END IF;

IF(CualDireccion  = 0) THEN
     SET NEW.nombre_comercial=(SELECT nombre FROM terceros_direcciones WHERE id= NEW.id_terceros_direcciones);
     SET NEW.direccion_cliente=(SELECT direccion FROM terceros_direcciones WHERE id= NEW.id_terceros_direcciones);
     SET NEW.telefono_cliente=(SELECT telefono1 FROM terceros_direcciones WHERE id= NEW.id_terceros_direcciones);
END IF;

SET NEW.telefono=(SELECT telefono1 FROM terceros_contactos WHERE id=NEW.id_contacto LIMIT 1);
SET NEW.contacto_cargo=(SELECT cargo FROM terceros_contactos WHERE id=NEW.id_contacto LIMIT 1);
SET NEW.contacto_email=(SELECT email FROM terceros_contactos_email WHERE id_contacto=NEW.id_contacto LIMIT 1);


IF(NEW.id_bodega != '') THEN
    SET NEW.bodega=(SELECT  nombre FROM empresas_sucursales_bodegas WHERE id=NEW.id_bodega);
    UPDATE compras_ordenes SET id_bodega = NEW.id_bodega WHERE id_pedido = NEW.id; #ACTUALIZA LA BODEGA EN LA OC
END IF;

SET NEW.codigo_documento=   CASE NEW.estado
                                                                    WHEN 1 THEN CONCAT('D',LPAD(NEW.consecutivo_cotizacion,7,0))
                                                                    WHEN 2 THEN CONCAT('C',LPAD(NEW.consecutivo_cotizacion,7,0))
                                                                    WHEN 3 THEN CONCAT('P',LPAD(NEW.consecutivo_cotizacion,7,0))
                                                                    WHEN 4 THEN NEW.codigo_documento
                                                          END;

SET NEW.moneda_base=(SELECT id_moneda FROM empresas WHERE id = NEW.id_empresa);


#####  CONDICIONAL SI EL PEDIDIO PASA A ACTIVO PARA QUE GUARDE LAS ESTADISTICAS DE LOS EQUIPOS
IF(NEW.estado_pedido = 4) THEN
    UPDATE pedido_equipo SET guarda_estadisticas_uso = NOW() WHERE id_pedido = NEW.id;
END IF;

#####  CONDICIONAL PARA SABER CUANDO UN PROSPECTO SE CONVIERTE EN CLIENTE AL HACERLE LA PRIMERA COTIZACION

IF(OLD.estado = 1 AND NEW.estado = 2) THEN
        SET acumCotizaciones= (SELECT COUNT(*) FROM pedido WHERE estado = 2 AND activo = 1 AND id_cliente = NEW.id_cliente);      
        IF(acumCotizaciones = 0) THEN
                 INSERT INTO terceros_log(id_tercero,fecha,hora,id_usuario,accion)  values(NEW.id_cliente,NOW(),NOW(),NEW.id_vendedor,'cliente');
        END IF;          
END IF;

##### TRIGGER PARA ACTUALIZAR LA REMISION EN LAS ORDENES DE COMPRA CUANDO EL PEDIDO ES DESPACHADO DESPUES DE GENERAR ESTAS

IF(OLD.id_remision_erp IS NULL AND NEW.id_remision_erp  IS NOT NULL) THEN        
        UPDATE compras_ordenes SET id_remision_pedido = NEW.id_remision_erp,remision_pedido = NEW.numero_remision_erp  WHERE id_pedido = NEW.id;
END IF;

##### TRIGGER QUE ACTUALIZA EL IVA DE LOS ITEMS EN CASO DE QUE EL CLIENTE SEA EXENTO DE IVA

IF(NEW.id_empresa < 3 OR NEW.id_empresa = 20) THEN
        UPDATE pedido_requerimientos SET change_update = '' WHERE id_intercambio = NEW.id;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERTpedido_actas_video`;
DELIMITER ;;
CREATE TRIGGER `INSERTpedido_actas_video` BEFORE INSERT ON `pedido_actas_video` FOR EACH ROW BEGIN
         SET @contador=(SELECT consecutivo FROM pedido_actas_video WHERE id_sucursal=NEW.id_sucursal GROUP BY consecutivo DESC LIMIT 0,1);

         IF @contador >0 THEN
             SET NEW.consecutivo=@contador+1;
             SET NEW.nombre_orden=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                (RIGHT(CONCAT('000000',@contador+1),7))
                                                                           );
      ELSE 
             SET NEW.consecutivo=1;
             SET NEW.nombre_orden=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                '0000001'
                                                                            );
      END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERTpedido_destiempos_documentos`;
DELIMITER ;;
CREATE TRIGGER `INSERTpedido_destiempos_documentos` BEFORE INSERT ON `pedido_destiempos_excusas` FOR EACH ROW BEGIN
         SET @contador=(SELECT consecutivo FROM pedido_destiempos_excusas WHERE id_sucursal=NEW.id_sucursal GROUP BY consecutivo DESC LIMIT 0,1);

         IF @contador >0 THEN
             SET NEW.consecutivo=@contador+1;
             SET NEW.nombre_excusa=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                (RIGHT(CONCAT('000000',@contador+1),7))
                                                                           );
      ELSE 
             SET NEW.consecutivo=1;
             SET NEW.nombre_excusa=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                '0000001'
                                                                            );
      END IF;     

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_destiempos_requisicionINSERT`;
DELIMITER ;;
CREATE TRIGGER `pedido_destiempos_requisicionINSERT` BEFORE INSERT ON `pedido_destiempos_requisicion` FOR EACH ROW BEGIN

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
SET NEW.codigo_pedido=(SELECT codigo_documento FROM pedido WHERE activo=1 AND id=NEW.id_pedido);
SET NEW.id_empresa =(SELECT id_empresa FROM pedido WHERE activo=1 AND id=NEW.id_pedido);
SET NEW.id_sucursal =(SELECT id_sucursal FROM pedido WHERE activo=1 AND id=NEW.id_pedido);
SET NEW.sucursal=(SELECT nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal );
SET NEW.tipo_pedido = (SELECT tipo_evento FROM pedido WHERE id=NEW.id_pedido );

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_destiempos_requisicionUPDATE`;
DELIMITER ;;
CREATE TRIGGER `pedido_destiempos_requisicionUPDATE` BEFORE UPDATE ON `pedido_destiempos_requisicion` FOR EACH ROW BEGIN

SET NEW.usuario_verifica=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario_verifica);
SET NEW.sucursal=(SELECT nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal );

SET NEW.tipo_pedido = (SELECT tipo_evento FROM pedido WHERE id=NEW.id_pedido );

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_eliminado`;
DELIMITER ;;
CREATE TRIGGER `pedido_eliminado` BEFORE INSERT ON `pedido_eliminado` FOR EACH ROW BEGIN
         SET NEW.tipo_documento=SUBSTR( (SELECT  codigo_documento FROM pedido WHERE id=NEW.id_pedido), 1, 1 );
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_equipoINSERT`;
DELIMITER ;;
CREATE TRIGGER `pedido_equipoINSERT` BEFORE INSERT ON `pedido_equipo` FOR EACH ROW BEGIN
SET NEW.fecha_instalacion=(SELECT fecha_entrega_instalacion FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_instalacion=(SELECT hora_entrega_instalacion FROM pedido WHERE id=NEW.id_pedido);
SET NEW.fecha_inicio=(SELECT fecha_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_inicio=(SELECT hora_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW.fecha_fin=(SELECT fecha_final FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_fin=(SELECT hora_final FROM pedido WHERE id=NEW.id_pedido);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_equipoUPDATE`;
DELIMITER ;;
CREATE TRIGGER `pedido_equipoUPDATE` BEFORE UPDATE ON `pedido_equipo` FOR EACH ROW BEGIN

IF(NEW.guarda_estadisticas_uso != OLD.guarda_estadisticas_uso) THEN
     IF(NEW.activo = 1) THEN     
                     INSERT INTO inventario_estadisticas_uso (
                                                                    id_equipo,
                                                                    codigo,
                                                                    pedido,
                                                                    id_pedido,
                                                                    id_cliente,
                                                                    desde,
                                                                    hasta
                                                          )VALUES(
                                                                    NEW.id_inventario,
                                                                    NEW.codigo_inventario,
                                                                    (SELECT codigo_documento FROM pedido WHERE id = NEW.id_pedido ),
                                                                    NEW.id_pedido,
                                                                    (SELECT id_cliente FROM pedido WHERE id = NEW.id_pedido ),
                                                                    CONCAT(NEW.fecha_instalacion," ", NEW.hora_instalacion),
                                                                    CONCAT(NEW.fecha_fin," ", NEW.hora_fin)
                                                           );
     END IF;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_eventos_operarior_conductoresINSERT`;
DELIMITER ;;
CREATE TRIGGER `pedido_eventos_operarior_conductoresINSERT` BEFORE INSERT ON `pedido_eventos_operarios_conductores` FOR EACH ROW BEGIN

SET NEW.empleado		=	(SELECT nombre FROM empleados WHERE id=NEW.id_empleado);
SET NEW.codigo_documento	=	(SELECT codigo_documento FROM pedido WHERE id=NEW.id_pedido);
SET NEW.nombre_evento	=	(SELECT nombre_evento FROM pedido WHERE id=NEW.id_pedido);
SET NEW.id_direccion_tercero	=	(SELECT id_terceros_direcciones FROM pedido WHERE id=NEW.id_pedido);
SET NEW.nombre_comercial	=	(SELECT nombre_comercial FROM pedido WHERE id=NEW.id_pedido);
SET NEW.fecha_inicio	=	(SELECT fecha_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_inicio		=	(SELECT hora_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW. fecha_final		=	(SELECT fecha_final FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_final		=	(SELECT hora_final FROM pedido WHERE id=NEW.id_pedido);

SET NEW.codigo_centro_costos      =  (SELECT codigo_centro_costos FROM pedido WHERE id=NEW.id_pedido);
SET NEW.nombre_centro_costos     =  (SELECT nombre_centro_costos FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_entrega_instalacion = (SELECT hora_entrega_instalacion FROM pedido WHERE id=NEW.id_pedido);

SET NEW.fecha_suceso = NOW();

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_eventos_operarior_conductoresUPDATE`;
DELIMITER ;;
CREATE TRIGGER `pedido_eventos_operarior_conductoresUPDATE` BEFORE UPDATE ON `pedido_eventos_operarios_conductores` FOR EACH ROW BEGIN

SET NEW.empleado		=	(SELECT nombre FROM empleados WHERE id=NEW.id_empleado);
SET NEW.codigo_documento	=	(SELECT codigo_documento FROM pedido WHERE id=NEW.id_pedido);
SET NEW.nombre_evento	=	(SELECT nombre_evento FROM pedido WHERE id=NEW.id_pedido);
SET NEW.id_direccion_tercero	=	(SELECT id_terceros_direcciones FROM pedido WHERE id=NEW.id_pedido);
SET NEW.nombre_comercial	=	(SELECT nombre_comercial FROM pedido WHERE id=NEW.id_pedido);
SET NEW.fecha_inicio	=	(SELECT fecha_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_inicio		=	(SELECT hora_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW. fecha_final		=	(SELECT fecha_final FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_final		=	(SELECT hora_final FROM pedido WHERE id=NEW.id_pedido);

SET NEW.codigo_centro_costos      =  (SELECT codigo_centro_costos FROM pedido WHERE id=NEW.id_pedido);
SET NEW.nombre_centro_costos     =  (SELECT nombre_centro_costos FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_entrega_instalacion = (SELECT hora_entrega_instalacion FROM pedido WHERE id=NEW.id_pedido);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_logINSERT`;
DELIMITER ;;
CREATE TRIGGER `pedido_logINSERT` BEFORE INSERT ON `pedido_log` FOR EACH ROW BEGIN

	DECLARE VencimientoCotizacion INT; 
                   DECLARE fechaInicio DATE; 
                   DECLARE idEmpresa INT;
                   DECLARE fechaVencimiento DATE;	
	
	SET NEW.estado_general=(SELECT estado FROM pedido WHERE id=NEW.id_pedido);
	SET NEW.estado_pedido=(SELECT estado_pedido FROM pedido WHERE id=NEW.id_pedido);
	SET NEW.nombre=(SELECT nombre FROM empleados WHERE username=NEW.usuario AND activo = 1 limit 1);

	####CUANDO UN DOCUEMNTO MAESTRO SE CONVIERTE EN COTIZACION CREA LA FECHA DE VENCIMIENTO POR DEFAULT.
	####EN EL CASO DE COLOMBIA RESTARA UN DIA AL INICIO DEL EVENTO
                   ####PARA LOS PAISES SEGUIRA SIENDO IGUAL   
 
		IF(NEW.accion = 'documento maestro a cotizacion') THEN
			IF((SELECT vencimiento_cotizacion FROM pedido WHERE id = NEW.id_pedido) IS NULL) THEN
                                                                           SET idEmpresa = (SELECT id_empresa FROM pedido WHERE id = NEW.id_pedido);
                                                                           SET fechaInicio = (SELECT fecha_inicio FROM pedido WHERE id =  NEW.id_pedido);
				SET VencimientoCotizacion = (SELECT vencimiento_cotizacion FROM empresas WHERE id = (SELECT id_empresa FROM pedido WHERE id = NEW.id_pedido));

                                                                           IF(idEmpresa < 3) THEN  
                                                                                 SET fechaVencimiento =  DATE_SUB(fechaInicio,INTERVAL VencimientoCotizacion DAY);
                                                                           ELSE 
                                                                                 SET fechaVencimiento =  DATE_ADD(NOW(),INTERVAL VencimientoCotizacion DAY);
                                                                           END IF;

				UPDATE pedido SET vencimiento_cotizacion =  fechaVencimiento,fecha_cotizacion =  NOW(),hora_cotizacion =  NOW() WHERE id = NEW.id_pedido;			
			END IF;
		END IF;

	###################################################################################################

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_logisticoINSERT`;
DELIMITER ;;
CREATE TRIGGER `pedido_logisticoINSERT` BEFORE INSERT ON `pedido_logistico` FOR EACH ROW BEGIN
     #SET NEW.fecha_programado=now();
     #SET NEW.hora_programado=now();
     SET NEW.conductor_envio=(SELECT nombre FROM empleados WHERE id=NEW.id_conductor_envio);
     SET NEW.vehiculo_envio=(SELECT vehiculo FROM logistico_vehiculos WHERE id=NEW.id_vehiculo_envio);
     SET NEW.estado_pedido=(SELECT estado_pedido FROM pedido WHERE id=NEW.id_pedido);

     SET NEW.usuario_programo=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario_programo);

     INSERT INTO pedido_eventos_operarios_conductores (
	id_pedido,
	id_empleado,
	tipo
     ) VALUES (
	NEW.id_pedido,
	NEW.id_conductor_envio,
	'CO_E'
     );


END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_logisticoUPDATE`;
DELIMITER ;;
CREATE TRIGGER `pedido_logisticoUPDATE` BEFORE UPDATE ON `pedido_logistico` FOR EACH ROW BEGIN
     DECLARE FechaProgramada DATETIME;
     DECLARE FechaReal DATETIME;
     DECLARE FechaDiferencia INT;


     SET NEW.estado_pedido=(SELECT estado_pedido FROM pedido WHERE id=NEW.id_pedido);
     SET NEW.conductor_envio=(SELECT nombre FROM empleados WHERE id=NEW.id_conductor_envio);
     SET NEW.vehiculo_envio=(SELECT vehiculo FROM logistico_vehiculos WHERE id=NEW.id_vehiculo_envio);
     SET NEW.conductor_por_recogida=(SELECT nombre FROM empleados WHERE id=NEW.id_conductor_por_recogida);

     SET NEW.usuario_programo=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario_programo);
     SET NEW.usuario_despacho=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario_despacho);
     SET NEW.usuario_entrega=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario_entrega);
     SET NEW.usuario_servicio_activo=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario_servicio_activo);
     SET NEW.usuario_por_recogida=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario_por_recogida);
     SET NEW.usuario_entrar_bodega=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario_entrar_bodega);
     SET NEW.vehiculo_por_recogida=(SELECT vehiculo FROM logistico_vehiculos WHERE id=NEW.id_vehiculo_por_recogida);

    IF(NEW.fecha_despacho <>'') THEN
         SET FechaProgramada  = (SELECT CONCAT(fecha_entrega_instalacion,' ',hora_entrega_instalacion) FROM pedido WHERE id = NEW.id_pedido);
         SET FechaReal = CONCAT(NEW.fecha_despacho,' ',NEW.hora_despacho) ; 
         SET FechaDiferencia = UNIX_TIMESTAMP(FechaProgramada) -UNIX_TIMESTAMP (FechaReal);
         IF(FechaDiferencia   >= 0 ) THEN
              SET NEW.despacho_atiempo = 'true';
         ELSE
              SET NEW.despacho_atiempo = 'false';
         END IF; 
    ELSE
         SET FechaProgramada  = (SELECT CONCAT(fecha_entrega_instalacion,' ',hora_entrega_instalacion) FROM pedido WHERE id = NEW.id_pedido);
         SET FechaReal =NOW() ; 
         SET FechaDiferencia = UNIX_TIMESTAMP(FechaProgramada) -UNIX_TIMESTAMP (FechaReal);
         IF(FechaDiferencia   >= 0 ) THEN
              SET NEW.despacho_atiempo = 'true';
         ELSE
              SET NEW.despacho_atiempo = 'false';
         END IF; 
    END IF;

    IF(NEW.fecha_entrega <>'') THEN
         SET FechaProgramada  = (SELECT CONCAT(fecha_inicio,' ',hora_inicio) FROM pedido WHERE id = NEW.id_pedido);
         SET FechaReal = CONCAT(NEW.fecha_entrega,' ',NEW.hora_entrega) ; 
         SET FechaDiferencia = UNIX_TIMESTAMP(FechaProgramada) -UNIX_TIMESTAMP (FechaReal);
         IF(FechaDiferencia   >= 0 ) THEN
              SET NEW.entrega_atiempo = 'true';
         ELSE
              SET NEW.entrega_atiempo = 'false';
         END IF;  
    ELSE
         SET FechaProgramada  = (SELECT CONCAT(fecha_inicio,' ',hora_inicio) FROM pedido WHERE id = NEW.id_pedido);
         SET FechaReal = NOW() ;  
         SET FechaDiferencia = UNIX_TIMESTAMP(FechaProgramada) -UNIX_TIMESTAMP (FechaReal);
         IF(FechaDiferencia   >= 0 ) THEN
              SET NEW.entrega_atiempo = 'true';
         ELSE
              SET NEW.entrega_atiempo = 'false';
         END IF;  
    END IF;


	IF(NEW.id_conductor_por_recogida IS NOT NULL) THEN
		IF(OLD.id_conductor_por_recogida IS NULL) THEN
			INSERT INTO pedido_eventos_operarios_conductores (
				id_pedido,
				id_empleado,
				tipo
			) VALUES (
				NEW.id_pedido,
				NEW.id_conductor_por_recogida,
				'CO_R'
			);
		ELSE
			IF(NEW.id_conductor_por_recogida <> OLD.id_conductor_por_recogida) THEN
				DELETE FROM pedido_eventos_operarios_conductores WHERE id_pedido = NEW.id_pedido AND id_empleado = OLD.id_conductor_por_recogida AND tipo = 'CO_R';				
				INSERT INTO pedido_eventos_operarios_conductores (
					id_pedido,
					id_empleado,
					tipo
				) VALUES (
					NEW.id_pedido,
					NEW.id_conductor_por_recogida,
					'CO_R'
				);
			END IF;
		END IF;
	 END IF;  

	IF(NEW.id_conductor_envio <> OLD.id_conductor_envio) THEN
		DELETE FROM pedido_eventos_operarios_conductores WHERE id_pedido = NEW.id_pedido AND id_empleado = OLD.id_conductor_envio AND tipo = 'CO_E';				
		INSERT INTO pedido_eventos_operarios_conductores (
			id_pedido,
			id_empleado,
			tipo
		) VALUES (
			NEW.id_pedido,
			NEW.id_conductor_envio,
			'CO_E'
		);
	END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_logistico_operarioINSERT`;
DELIMITER ;;
CREATE TRIGGER `pedido_logistico_operarioINSERT` BEFORE INSERT ON `pedido_logistico_operarios` FOR EACH ROW BEGIN

SET NEW.nombre_empleado=(SELECT nombre FROM empleados WHERE id=NEW.id_empleado);

SET NEW.hora_entrega_instalacion = (SELECT hora_entrega_instalacion FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_final = (SELECT hora_final FROM pedido WHERE id=NEW.id_pedido);
SET NEW.codigo_centro_costos = (SELECT codigo_centro_costos FROM pedido WHERE id=NEW.id_pedido);
SET NEW.nombre_centro_costos = (SELECT nombre_centro_costos FROM pedido WHERE id=NEW.id_pedido);
SET NEW.fecha_inicio = (SELECT fecha_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_inicio = (SELECT hora_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW.fecha_final = (SELECT fecha_final FROM pedido WHERE id=NEW.id_pedido);


INSERT INTO pedido_eventos_operarios_conductores (
	id_pedido,
	id_empleado,
	tipo
) VALUES (
	NEW.id_pedido,
	NEW.id_empleado,
	'OP'
);

SET NEW.fecha_suceso = NOW();

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_logistico_operarioUPDATE`;
DELIMITER ;;
CREATE TRIGGER `pedido_logistico_operarioUPDATE` BEFORE UPDATE ON `pedido_logistico_operarios` FOR EACH ROW BEGIN

SET NEW.hora_entrega_instalacion = (SELECT hora_entrega_instalacion FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_final = (SELECT hora_final FROM pedido WHERE id=NEW.id_pedido);
SET NEW.codigo_centro_costos = (SELECT codigo_centro_costos FROM pedido WHERE id=NEW.id_pedido);
SET NEW.nombre_centro_costos = (SELECT nombre_centro_costos FROM pedido WHERE id=NEW.id_pedido);
SET NEW.fecha_inicio = (SELECT fecha_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW.hora_inicio = (SELECT hora_inicio FROM pedido WHERE id=NEW.id_pedido);
SET NEW.fecha_final = (SELECT fecha_final FROM pedido WHERE id=NEW.id_pedido);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_logistico_operarioDELETE`;
DELIMITER ;;
CREATE TRIGGER `pedido_logistico_operarioDELETE` BEFORE DELETE ON `pedido_logistico_operarios` FOR EACH ROW BEGIN

DELETE FROM pedido_eventos_operarios_conductores WHERE id_pedido = OLD.id_pedido AND id_empleado = OLD.id_empleado AND tipo = 'OP';

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERTpedido_orden`;
DELIMITER ;;
CREATE TRIGGER `INSERTpedido_orden` BEFORE INSERT ON `pedido_orden` FOR EACH ROW BEGIN
         SET @contador=(SELECT consecutivo FROM pedido_orden WHERE id_sucursal=NEW.id_sucursal GROUP BY consecutivo DESC LIMIT 0,1);

         IF @contador >0 THEN
             SET NEW.consecutivo=@contador+1;
             SET NEW.nombre_orden=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                (RIGHT(CONCAT('000000',@contador+1),7))
                                                                           );
      ELSE 
             SET NEW.consecutivo=1;
             SET NEW.nombre_orden=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                '0000001'
                                                                            );
      END IF;

      UPDATE compras_ordenes SET fecha_orden_pedido = NEW.fecha_hora_real  WHERE id_pedido = NEW.id_pedido;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERTpedido_ordenes_cancelacion`;
DELIMITER ;;
CREATE TRIGGER `INSERTpedido_ordenes_cancelacion` BEFORE INSERT ON `pedido_ordenes_cancelacion` FOR EACH ROW BEGIN
         SET @contador=(SELECT consecutivo FROM pedido_ordenes_cancelacion WHERE id_sucursal=NEW.id_sucursal GROUP BY consecutivo DESC LIMIT 0,1);

         IF @contador >0 THEN
             SET NEW.consecutivo=@contador+1;
             SET NEW.nombre_orden=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                (RIGHT(CONCAT('000000',@contador+1),7))
                                                                           );
      ELSE 
             SET NEW.consecutivo=1;
             SET NEW.nombre_orden=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                '0000001'
                                                                            );
      END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERTpedido_remision`;
DELIMITER ;;
CREATE TRIGGER `INSERTpedido_remision` BEFORE INSERT ON `pedido_remision` FOR EACH ROW BEGIN
         SET @contador=(SELECT consecutivo FROM pedido_remision WHERE id_sucursal=NEW.id_sucursal GROUP BY consecutivo DESC LIMIT 0,1);

         IF @contador >0 THEN
             SET NEW.consecutivo=@contador+1;
             SET NEW.nombre_remision=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                (RIGHT(CONCAT('000000',@contador+1),7))
                                                                           );
      ELSE 
             SET NEW.consecutivo=1;
             SET NEW.nombre_remision=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                '0000001'
                                                                            );
      END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_requerimientosINSERT`;
DELIMITER ;;
CREATE TRIGGER `pedido_requerimientosINSERT` BEFORE INSERT ON `pedido_requerimientos` FOR EACH ROW BEGIN

#VALIDAR SI EL CLIENTE ES EXENTO DE IVA
DECLARE cliente_exento VARCHAR(2);
DECLARE cliente INT;

SET cliente = (SELECT id_cliente FROM pedido WHERE id =NEW.id_intercambio);
SET cliente_exento = (SELECT exento_iva FROM terceros WHERE id = cliente);

#INSERT INTO debug(debug) VALUES (CONCAT(cliente,'',cliente_exento));

SET NEW.id_empresa = (SELECT id_empresa FROM pedido WHERE id = NEW.id_intercambio);
SET NEW.codigo_items = (SELECT codigo FROM items WHERE id = NEW.id_items);
SET NEW.impuesto = (SELECT impuesto FROM items WHERE id = NEW.id_items AND id_empresa = NEW.id_empresa);

SET NEW.valor_descuento =  IF(
					NEW.tipo_descuento = '$', 
					NEW.descuento, 
					((NEW.cantidad * NEW.valor_unitario) * NEW.descuento)/100
			 );

SET NEW.valor_impuesto = IF(
					NEW.liquida_impuesto = 'true' AND (((NEW.id_empresa < 3  OR NEW.id_empresa = 20) AND cliente_exento = 'No') OR (NEW.id_empresa > 2 AND NEW.id_empresa <> 20)),	
						IF(
						         NEW.tipo_descuento = '$',
					                           ( ( (NEW.cantidad * NEW.valor_unitario) - NEW.descuento) * NEW.impuesto )/100,
						        ( ( (NEW.cantidad * NEW.valor_unitario) - ((NEW.cantidad * NEW.valor_unitario) * NEW.descuento)/100) * NEW.impuesto )/100
					                   ),
						0
					);

SET NEW.Subtotal_Con_Descuento = (NEW.cantidad * NEW.valor_unitario) - NEW.valor_descuento;
SET NEW.Subtotal_Sin_Descuento = (NEW.cantidad * NEW.valor_unitario);


END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `pedido_requerimientosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `pedido_requerimientosUPDATE` BEFORE UPDATE ON `pedido_requerimientos` FOR EACH ROW BEGIN

#VALIDAR SI EL CLIENTE ES EXENTO DE IVA
DECLARE cliente_exento VARCHAR(2);
DECLARE cliente INT;

SET cliente = (SELECT id_cliente FROM pedido WHERE id =NEW.id_intercambio);
SET cliente_exento = (SELECT exento_iva FROM terceros WHERE id = cliente);

#INSERT INTO debug(debug) VALUES (CONCAT(cliente,'',cliente_exento));

SET NEW.id_empresa = (SELECT id_empresa FROM pedido WHERE id = NEW.id_intercambio);
SET NEW.codigo_items = (SELECT codigo FROM items WHERE id = NEW.id_items);
SET NEW.impuesto = (SELECT impuesto FROM items WHERE id = NEW.id_items AND id_empresa = NEW.id_empresa);

SET NEW.valor_descuento =  IF(
					NEW.tipo_descuento = '$', 
					NEW.descuento, 
					((NEW.cantidad * NEW.valor_unitario) * NEW.descuento)/100
			 );

SET NEW.valor_impuesto = IF(
					NEW.liquida_impuesto = 'true' AND (((NEW.id_empresa < 3  OR NEW.id_empresa = 20) AND cliente_exento = 'No') OR (NEW.id_empresa > 2 AND NEW.id_empresa <> 20)),	
						IF(
						         NEW.tipo_descuento = '$',
					                           ( ( (NEW.cantidad * NEW.valor_unitario) - NEW.descuento) * NEW.impuesto )/100,
						        ( ( (NEW.cantidad * NEW.valor_unitario) - ((NEW.cantidad * NEW.valor_unitario) * NEW.descuento)/100) * NEW.impuesto )/100
					                   ),
						0
					);

SET NEW.Subtotal_Con_Descuento = (NEW.cantidad * NEW.valor_unitario) - NEW.valor_descuento;
SET NEW.Subtotal_Sin_Descuento = (NEW.cantidad * NEW.valor_unitario);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `INSERTpedido_solicitudes_cancelacion_anexos`;
DELIMITER ;;
CREATE TRIGGER `INSERTpedido_solicitudes_cancelacion_anexos` BEFORE INSERT ON `pedido_solicitudes_cancelacion_anexos` FOR EACH ROW BEGIN
         SET @contador=(SELECT consecutivo FROM pedido_solicitudes_cancelacion_anexos WHERE id_sucursal=NEW.id_sucursal GROUP BY consecutivo DESC LIMIT 0,1);

         IF @contador >0 THEN
             SET NEW.consecutivo=@contador+1;
             SET NEW.nombre_excusa=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                (RIGHT(CONCAT('000000',@contador+1),7))
                                                                           );
      ELSE 
             SET NEW.consecutivo=1;
             SET NEW.nombre_excusa=CONCAT(
                                                                                (RIGHT(CONCAT('0',NEW.id_empresa),2)),
                                                                                (RIGHT(CONCAT('00',NEW.id_sucursal),3)),
                                                                                '0000001'
                                                                            );
      END IF;     

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reparacionINSERT`;
DELIMITER ;;
CREATE TRIGGER `reparacionINSERT` BEFORE INSERT ON `reparacion` FOR EACH ROW BEGIN

SET NEW.nombre_usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.bodega = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega);
SET NEW.cod_equipo = (SELECT codigo FROM inventarios WHERE id = NEW.id_inventario);
SET NEW.equipo = (SELECT nombre_equipo FROM inventarios WHERE id = NEW.id_inventario);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reparacionINSERTafter`;
DELIMITER ;;
CREATE TRIGGER `reparacionINSERTafter` AFTER INSERT ON `reparacion` FOR EACH ROW BEGIN

INSERT INTO historico_equipos (tipo,tipo_nombre,id_equipo,fecha,tipo_user,id_usuario,id_evento)VALUES(4,'Informe reparacion',NEW.id_inventario,NEW.fecha_registro,0,NEW.id_usuario,NEW.id);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reparacionUPDATE`;
DELIMITER ;;
CREATE TRIGGER `reparacionUPDATE` BEFORE UPDATE ON `reparacion` FOR EACH ROW BEGIN
SET NEW.nombre_usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.bodega = (SELECT nombre FROM empresas_sucursales_bodegas WHERE id = NEW.id_bodega);
SET NEW.cod_equipo = (SELECT codigo FROM inventarios WHERE id = NEW.id_inventario);
SET NEW.equipo = (SELECT nombre_equipo FROM inventarios WHERE id = NEW.id_inventario);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_coopeINSERT`;
DELIMITER ;;
CREATE TRIGGER `reunion_coopeINSERT` BEFORE INSERT ON `reunion_coope` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.fecha = NOW();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_coopeUPDATE`;
DELIMITER ;;
CREATE TRIGGER `reunion_coopeUPDATE` BEFORE UPDATE ON `reunion_coope` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_coope_datosINSERT`;
DELIMITER ;;
CREATE TRIGGER `reunion_coope_datosINSERT` BEFORE INSERT ON `reunion_coope_datos` FOR EACH ROW BEGIN
SET NEW.checklist_detalle = (SELECT nombre FROM configuracion_reunion_coope_checklist_detalles  WHERE id = NEW.id_checklist_detalle);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_coope_datosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `reunion_coope_datosUPDATE` BEFORE UPDATE ON `reunion_coope_datos` FOR EACH ROW BEGIN
SET NEW.checklist_detalle = (SELECT nombre FROM configuracion_reunion_coope_checklist_detalles  WHERE id = NEW.id_checklist_detalle);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativaINSERT_copy`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativaINSERT_copy` BEFORE INSERT ON `reunion_operativa` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);

SET NEW.fecha_hora = NOW();

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativaUPDATE_copy`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativaUPDATE_copy` BEFORE UPDATE ON `reunion_operativa` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);
SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativa_alertas_usuario`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativa_alertas_usuario` BEFORE INSERT ON `reunion_operativa_alertas_usuarios` FOR EACH ROW BEGIN

      SET NEW.nombre=(SELECT nombre FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.id_empresa=(SELECT id_empresa FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.empresa=(SELECT empresa FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.id_sucursal=(SELECT id_sucursal FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.sucursal=(SELECT sucursal FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.email=(SELECT email_empresa FROM empleados WHERE id=NEW.id_empleado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativa_alertas_usuarioUPDATE`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativa_alertas_usuarioUPDATE` BEFORE UPDATE ON `reunion_operativa_alertas_usuarios` FOR EACH ROW BEGIN

      SET NEW.nombre=(SELECT nombre FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.id_empresa=(SELECT id_empresa FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.empresa=(SELECT empresa FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.id_sucursal=(SELECT id_sucursal FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.sucursal=(SELECT sucursal FROM empleados WHERE id=NEW.id_empleado);
      SET NEW.email=(SELECT email_empresa FROM empleados WHERE id=NEW.id_empleado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativa_usuarios_sucursalesINSERT_copy`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativa_usuarios_sucursalesINSERT_copy` BEFORE INSERT ON `reunion_operativa_alertas_usuarios_sucursales` FOR EACH ROW BEGIN

          SET NEW.id_zona = (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativa_usuarios_sucursalesUPDATE_copy`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativa_usuarios_sucursalesUPDATE_copy` BEFORE UPDATE ON `reunion_operativa_alertas_usuarios_sucursales` FOR EACH ROW BEGIN

          SET NEW.id_zona = (SELECT zona FROM empresas_sucursales WHERE id = NEW.id_sucursal);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativa_logINSERT`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativa_logINSERT` BEFORE INSERT ON `reunion_operativa_log` FOR EACH ROW BEGIN

      SET NEW.usuario=(SELECT nombre FROM empleados WHERE id=NEW.id_usuario);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativa_personasINSERT_copy`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativa_personasINSERT_copy` BEFORE INSERT ON `reunion_operativa_personas` FOR EACH ROW BEGIN

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativa_preguntasINSERT`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativa_preguntasINSERT` BEFORE INSERT ON `reunion_operativa_preguntas` FOR EACH ROW BEGIN
         IF(NEW.clase_pregunta > 1) THEN SET NEW.validacion_items = 'false';
         END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `reunion_operativa_preguntasUPDATE`;
DELIMITER ;;
CREATE TRIGGER `reunion_operativa_preguntasUPDATE` BEFORE UPDATE ON `reunion_operativa_preguntas` FOR EACH ROW BEGIN
         IF(NEW.clase_pregunta > 1) THEN SET NEW.validacion_items = 'false';
         END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `rpedido_INSERT`;
DELIMITER ;;
CREATE TRIGGER `rpedido_INSERT` BEFORE INSERT ON `rpedido` FOR EACH ROW BEGIN

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
SET NEW.cod_pedido=(SELECT codigo_documento FROM pedido WHERE activo=1 AND id=NEW.id_pedido);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `rpedido_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `rpedido_UPDATE` BEFORE UPDATE ON `rpedido` FOR EACH ROW BEGIN 

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
SET NEW.cod_pedido=(SELECT codigo_documento FROM pedido WHERE activo=1 AND id=NEW.id_pedido);

#CONSECUTIVO REVISIONES
IF (OLD.estado_revision = 0 AND new.estado_revision = 1 AND (OLD.revision<1 OR ISNULL(OLD.revision))) THEN
     SET NEW.revision=(SELECT revision FROM rpedido WHERE id_pedido=NEW.id_pedido AND estado_documento = NEW.estado_documento ORDER BY revision DESC LIMIT 0,1);

     IF NEW.revision > 0 THEN  SET NEW.revision = NEW.revision+1;
     ELSE  SET NEW.revision=1; 
     END IF;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `rpedido_log_INSERT`;
DELIMITER ;;
CREATE TRIGGER `rpedido_log_INSERT` BEFORE INSERT ON `rpedido_log` FOR EACH ROW BEGIN

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `solicitudes_estado_documentosINSERT`;
DELIMITER ;;
CREATE TRIGGER `solicitudes_estado_documentosINSERT` BEFORE INSERT ON `solicitudes_estado_documentos_erp` FOR EACH ROW BEGIN

    DECLARE contOC FLOAT;
    DECLARE acumOC VARCHAR(255);

    DECLARE done BOOL DEFAULT FALSE;
    DECLARE cursor1 CURSOR FOR SELECT consecutivo FROM compras_ordenes WHERE activo = 1 AND estado = 1 AND id_pedido = NEW.id_pedido ORDER BY consecutivo;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SET NEW.fecha_solicitud = NOW();
   
    IF(NEW.tipo_documento = 'remision') THEN
        SET NEW.tipo_solicitud = (SELECT nombre FROM configuracion_solicitudes_remisiones_tipos WHERE id = NEW.id_tipo_solicitud);
        SET NEW.motivo_solicitud = (SELECT nombre FROM configuracion_solicitudes_remisiones_motivos WHERE id = NEW.id_motivo_solicitud);
    ELSE
        SET NEW.tipo_solicitud = (SELECT nombre FROM configuracion_solicitudes_facturas_tipos WHERE id = NEW.id_tipo_solicitud);
        SET NEW.motivo_solicitud = (SELECT nombre FROM configuracion_solicitudes_facturas_motivos WHERE id = NEW.id_motivo_solicitud);
    END IF;

    #CONSECUTIVO DOCUMENTO
     SET NEW.consecutivo=(SELECT consecutivo FROM solicitudes_estado_documentos_erp WHERE id_empresa=NEW.id_empresa AND id_sucursal = NEW.id_sucursal ORDER BY consecutivo DESC LIMIT 0,1);     

     IF NEW.consecutivo > 0 THEN  SET NEW.consecutivo = NEW.consecutivo+1;
     ELSE  SET NEW.consecutivo=1; 
     END IF;

     SET NEW.cod_pedido = (SELECT codigo_documento FROM pedido WHERE id = NEW.id_pedido);
     SET NEW.id_zona=(SELECT id_zona FROM pedido WHERE id=NEW.id_pedido);

     #EXAMINAR SI TIENE ORDENES DE COMPRA ACTIVAS PARA IMPLICAR AL DIRECTOR DE COMPRAS
     SET acumOC = '';

     OPEN cursor1;
     read_cursor1: LOOP
              FETCH cursor1 INTO contOC;

              IF done THEN
                   CLOSE cursor1;
                   LEAVE read_cursor1;
              END IF;

              
     SET acumOC= CONCAT(acumOC,',',contOC);

     END LOOP;

     #ELIMINAR COMA AL INICIO
     SET acumOC=SUBSTR(acumOC,2);
     SET NEW.consecutivos_oc = acumOC;			

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `solicitudes_estado_documentosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `solicitudes_estado_documentosUPDATE` BEFORE UPDATE ON `solicitudes_estado_documentos_erp` FOR EACH ROW BEGIN

    DECLARE contOC FLOAT;
    DECLARE acumOC VARCHAR(255);

    DECLARE done BOOL DEFAULT FALSE;
    DECLARE cursor1 CURSOR FOR SELECT consecutivo FROM compras_ordenes WHERE activo = 1 AND estado = 1 AND id_pedido = NEW.id_pedido ORDER BY consecutivo;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;			

    IF(NEW.tipo_documento = 'remision') THEN
        SET NEW.tipo_solicitud = (SELECT nombre FROM configuracion_solicitudes_remisiones_tipos WHERE id = NEW.id_tipo_solicitud);
        SET NEW.motivo_solicitud = (SELECT nombre FROM configuracion_solicitudes_remisiones_motivos WHERE id = NEW.id_motivo_solicitud);
    ELSE
        SET NEW.tipo_solicitud = (SELECT nombre FROM configuracion_solicitudes_facturas_tipos WHERE id = NEW.id_tipo_solicitud);
        SET NEW.motivo_solicitud = (SELECT nombre FROM configuracion_solicitudes_facturas_motivos WHERE id = NEW.id_motivo_solicitud);
    END IF;

    SET NEW.cod_pedido = (SELECT codigo_documento FROM pedido WHERE id = NEW.id_pedido);
    SET NEW.id_zona=(SELECT id_zona FROM pedido WHERE id=NEW.id_pedido);

    #EXAMINAR SI TIENE ORDENES DE COMPRA ACTIVAS PARA IMPLICAR AL DIRECTOR DE COMPRAS
     SET acumOC = '';

     OPEN cursor1;
     read_cursor1: LOOP
              FETCH cursor1 INTO contOC;

              IF done THEN
                   CLOSE cursor1;
                   LEAVE read_cursor1;
              END IF;
              
     SET acumOC= CONCAT(acumOC,',',contOC);

     END LOOP;

     #ELIMINAR COMA AL INICIO
     SET acumOC=SUBSTR(acumOC,2);
     SET NEW.consecutivos_oc = acumOC;		

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `solicitudes_estado_documentos_erp_seguimientosINSERT`;
DELIMITER ;;
CREATE TRIGGER `solicitudes_estado_documentos_erp_seguimientosINSERT` BEFORE INSERT ON `solicitudes_estado_documentos_erp_seguimientos` FOR EACH ROW BEGIN 
       SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `solicitudes_estado_documentos_erp_seguimientosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `solicitudes_estado_documentos_erp_seguimientosUPDATE` BEFORE UPDATE ON `solicitudes_estado_documentos_erp_seguimientos` FOR EACH ROW BEGIN 
       SET NEW.usuario = (SELECT nombre FROM empleados WHERE id = NEW.id_usuario);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `solicitudes_estado_ordenesINSERT_copy`;
DELIMITER ;;
CREATE TRIGGER `solicitudes_estado_ordenesINSERT_copy` BEFORE INSERT ON `solicitudes_estado_ordenes_compra` FOR EACH ROW BEGIN

    SET NEW.fecha_solicitud = NOW();   
 
    SET NEW.tipo_solicitud = (SELECT nombre FROM configuracion_solicitudes_ordenes_tipos WHERE id = NEW.id_tipo_solicitud);
    SET NEW.motivo_solicitud = (SELECT nombre FROM configuracion_solicitudes_ordenes_motivos WHERE id = NEW.id_motivo_solicitud); 

    #CONSECUTIVO DOCUMENTO
     SET NEW.consecutivo=(SELECT consecutivo FROM solicitudes_estado_ordenes_compra WHERE id_empresa=NEW.id_empresa AND id_sucursal = NEW.id_sucursal ORDER BY consecutivo DESC LIMIT 0,1);     

     IF NEW.consecutivo > 0 THEN  SET NEW.consecutivo = NEW.consecutivo+1;
     ELSE  SET NEW.consecutivo=1; 
     END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `solicitudes_estado_ordenesUPDATE_copy`;
DELIMITER ;;
CREATE TRIGGER `solicitudes_estado_ordenesUPDATE_copy` BEFORE UPDATE ON `solicitudes_estado_ordenes_compra` FOR EACH ROW BEGIN

SET NEW.tipo_solicitud = (SELECT nombre FROM configuracion_solicitudes_ordenes_tipos WHERE id = NEW.id_tipo_solicitud);
SET NEW.motivo_solicitud = (SELECT nombre FROM configuracion_solicitudes_ordenes_motivos WHERE id = NEW.id_motivo_solicitud); 

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosINSERT`;
DELIMITER ;;
CREATE TRIGGER `TercerosINSERT` BEFORE INSERT ON `terceros` FOR EACH ROW BEGIN

SET NEW.numero_identificacion = TRIM(NEW.numero_identificacion);

SET NEW.fecha_creacion = NOW();

IF((SELECT tipo FROM tipo_documento WHERE id = NEW.id_tipo_identificacion ) ='Persona') THEN
     SET NEW.contactos = 1;
END IF;

IF(NEW.asisteH = 0) THEN
     SET NEW.asisteH_ = 'NO';
ELSE
     SET NEW.asisteH_ = 'SI';
END IF;

IF(NEW.asisteS = 0) THEN
     SET NEW.asisteS_ = 'NO';
ELSE
     SET NEW.asisteS_ = 'SI';
END IF;

IF(NEW.survey = 0) THEN
     SET NEW.survey_ = 'NO';
ELSE
     SET NEW.survey_ = 'SI';
END IF;

IF(NEW.hotels = 0) THEN
     SET NEW.hotels_ = 'NO';
ELSE
     SET NEW.hotels_ = 'SI';
END IF;

IF(NEW.contler = 0) THEN
     SET NEW.contler_ = 'NO';
ELSE
     SET NEW.contler_ = 'SI';
END IF;

IF(NEW.erp_facse = 0) THEN
     SET NEW.erp_facse_ = 'NO';
ELSE
     SET NEW.erp_facse_ = 'SI';
END IF;

IF(NEW.hunty = 0) THEN
     SET NEW.hunty_ = 'NO';
ELSE
     SET NEW.hunty_ = 'SI';
END IF;

IF(NEW.cliente_activo = 0) THEN
     SET NEW.cliente_activo_ = 'NO';
ELSE
     SET NEW.cliente_activo_ = 'SI';
END IF;

#SI NO ES CLIENTE ENTONCES DESACTIVA LA ENCUESTA
IF(NEW.tipo_cliente = 'No') THEN
     SET NEW.encuesta = 'false';
     SET NEW.encuesta_destinatario = '';
     SET NEW.encuesta_email = '';  
     SET NEW.encuesta_telefono = '';
     SET NEW.encuesta_celular = '';     
     SET NEW.facturacion_frecuencia = 0;
     SET NEW.facturacion_provision = 0;
     SET NEW.facturacion_provision_detalle = '';
     SET NEW.facturacion_dias = 0;
     SET NEW.facturacion_dia_cierre = 0;
     SET NEW.facturacion_observaciones = '';
     #SET NEW.zona_comercial = '';
END IF;

#INSERT INTO terceros_direcciones(id_tercero, direccion, id_departamento, id_ciudad, nombre, direccion_principal )
#VALUES(NEW.id, NEW.direccion, NEW.id_departamento, NEW.id_ciudad, NEW.nombre,1 );

SET NEW.pais =(SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);
SET NEW.departamento =(SELECT departamento FROM ubicacion_departamento WHERE id = NEW.id_departamento);
SET NEW.ciudad =(SELECT ciudad FROM ubicacion_ciudad WHERE id = NEW.id_ciudad);
SET NEW.iso2 =(SELECT iso2 FROM ubicacion_pais WHERE id = NEW.id_pais);
SET NEW.tipo_identificacion = (SELECT nombre FROM tipo_documento WHERE id = NEW.id_tipo_identificacion );
SET NEW.tipo = (SELECT tipo FROM tipo_documento WHERE id = NEW.id_tipo_identificacion );
SET NEW.sector_empresarial = (SELECT nombre FROM configuracion_sector_empresarial WHERE id = NEW.id_sector_empresarial );
SET NEW.tipo_cliente_comercial = (SELECT nombre FROM terceros_tipo_cliente WHERE id = NEW.id_tipo_cliente_comercial );
SET NEW.nombre_zona_comercial =(SELECT nombre FROM terceros_zona_comercial WHERE id=NEW.zona_comercial);
SET NEW.origen_contacto = (SELECT nombre FROM configuracion_origenes_contacto_terceros WHERE id = NEW.id_origen_contacto);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `Persona_Natural_INSERT`;
DELIMITER ;;
CREATE TRIGGER `Persona_Natural_INSERT` AFTER INSERT ON `terceros` FOR EACH ROW BEGIN

	######ACTUALIZACION DE TERCEROS_DIRECCIONES DESPUES DEL UPDATE
	INSERT INTO terceros_direcciones(
		id_tercero, 
		direccion, 
		id_departamento, 
		id_ciudad, 
		nombre, 
		direccion_principal, 
		telefono1,
		encuesta,
		encuesta_destinatario,
		encuesta_email,   
                                     encuesta_telefono,
		encuesta_celular,    
		zona_comercial,
		id_pais,
		pais,
                                     id_tipo_cliente_comercial,
                                     tipo_operacion
	)VALUES(
		NEW.id, 
		NEW.direccion, 
		NEW.id_departamento, 
		NEW.id_ciudad, 
		NEW.nombre_comercial,
		1,
		NEW.telefono1,
		NEW.encuesta,
		NEW.encuesta_destinatario,
		NEW.encuesta_email,   
                                     NEW.encuesta_telefono,  
                                     NEW.encuesta_celular,                                   
		NEW.zona_comercial,
		NEW.id_pais,
		NEW.pais,
                                     NEW.id_tipo_cliente_comercial,
                                     NEW.tipo_operacion		
	);
	######

	IF((SELECT tipo FROM tipo_documento WHERE id = NEW.id_tipo_identificacion ) = 'Persona') THEN

		INSERT INTO terceros_contactos(
			id_tercero,
			nombre,
			identificacion,
			id_tipo_identificacion,
			ContactoAuto
		)VALUES(
			NEW.id,
			NEW.nombre,
			NEW.numero_identificacion,
			NEW.id_tipo_identificacion,
			1
		);
	END IF;

 #INSERTA EN EL LOG DE TERCEROS SI SE CREO UN PROSPECTO O UN TERCERO

IF(NEW.tercero = 0) THEN
       INSERT INTO terceros_log(id_tercero,fecha,hora,id_usuario,accion)  values(NEW.id,NOW(),NOW(),NEW.usuario_log,'prospecto');
END IF;

IF(NEW.tercero = 1) THEN
       INSERT INTO terceros_log(id_tercero,fecha,hora,id_usuario,accion)  values(NEW.id,NOW(),NOW(),NEW.usuario_log,'tercero');
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `TercerosUPDATE` BEFORE UPDATE ON `terceros` FOR EACH ROW BEGIN

SET NEW.numero_identificacion = TRIM(NEW.numero_identificacion);

#INSERTA EN EL LOG DE TERCEROS

IF(OLD.tercero = 0 AND NEW.tercero = 1) THEN
       INSERT INTO terceros_log(id_tercero,fecha,hora,id_usuario,accion)  values(NEW.id,NOW(),NOW(),NEW.usuario_log,'prospecto-tercero');
END IF;

######ACTUALIZACION DE TERCEROS_DIRECCIONES DESPUES DEL UPDATE

IF(OLD.direcciones = NEW.direcciones) THEN	
       	UPDATE  
		terceros_direcciones 
	SET 
		nombre = NEW.nombre_comercial,
		direccion = NEW.direccion,
		id_departamento = NEW.id_departamento,
		id_ciudad = NEW.id_ciudad,
		telefono1 = NEW.telefono1,
		encuesta = NEW.encuesta,
		encuesta_destinatario = NEW.encuesta_destinatario,
		encuesta_email = NEW.encuesta_email,        
                                     encuesta_telefono = NEW.encuesta_telefono,   
                                     encuesta_celular = NEW.encuesta_celular,                              
		zona_comercial = NEW.zona_comercial,
		id_pais = NEW.id_pais,
		pais = NEW.pais,
                                     direccion_principal = 1,
                                     id_tipo_cliente_comercial = NEW.id_tipo_cliente_comercial,
                                     tipo_operacion = NEW.tipo_operacion
	WHERE
		id_tercero = NEW.id 
		AND direccion_principal = 1;
                
END IF;
######


IF(NEW.asisteH = 0) THEN
     SET NEW.asisteH_ = 'NO';
ELSE
     SET NEW.asisteH_ = 'SI';
END IF;

IF(NEW.asisteS = 0) THEN
     SET NEW.asisteS_ = 'NO';
ELSE
     SET NEW.asisteS_ = 'SI';
END IF;

#SI NO ES CLIENTE ENTONCES DESACTIVA LA ENCUESTA
IF(NEW.tipo_cliente = 'No') THEN
     SET NEW.encuesta = 'false';
     SET NEW.encuesta_destinatario = '';
     ##SET NEW.encuesta_email = '';    
     SET NEW.encuesta_telefono = '';
     SET NEW.encuesta_celular = '';  
     SET NEW.facturacion_frecuencia = 0;
     SET NEW.facturacion_provision = 0;
     SET NEW.facturacion_provision_detalle = '';
     SET NEW.facturacion_dias = 0;
     SET NEW.facturacion_dia_cierre = 0;
     SET NEW.facturacion_observaciones = '';
     #SET NEW.zona_comercial = '';
END IF;

SET NEW.pais =(SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);
SET NEW.departamento =(SELECT departamento FROM ubicacion_departamento WHERE id = NEW.id_departamento);
SET NEW.ciudad =(SELECT ciudad FROM ubicacion_ciudad WHERE id = NEW.id_ciudad);
SET NEW.iso2 =(SELECT iso2 FROM ubicacion_pais WHERE id = NEW.id_pais);
SET NEW.tipo_identificacion = (SELECT nombre FROM tipo_documento WHERE id = NEW.id_tipo_identificacion );
SET NEW.tipo_identificacion_representante = (SELECT nombre FROM tipo_documento WHERE id = NEW.id_tipo_identificacion_representante );
SET NEW.tipo = (SELECT tipo FROM tipo_documento WHERE id = NEW.id_tipo_identificacion );
SET NEW.sector_empresarial = (SELECT nombre FROM configuracion_sector_empresarial WHERE id = NEW.id_sector_empresarial );
SET NEW.tipo_cliente_comercial = (SELECT nombre FROM terceros_tipo_cliente WHERE id = NEW.id_tipo_cliente_comercial );
SET NEW.nombre_zona_comercial =(SELECT nombre FROM terceros_zona_comercial WHERE id=NEW.zona_comercial);
SET NEW.origen_contacto = (SELECT nombre FROM configuracion_origenes_contacto_terceros WHERE id = NEW.id_origen_contacto);


########  LOGS  #########
IF(OLD.tipo_identificacion != NEW.tipo_identificacion)  THEN  call InsertLogs( 'terceros', 'tipo_identificacion', NEW.id, 'UPDATE', OLD.tipo_identificacion, NEW.tipo_identificacion, NEW.UserIdLog);  END IF;
IF(OLD.numero_identificacion != NEW.numero_identificacion)  THEN  call InsertLogs( 'terceros', 'numero_identificacion', NEW.id, 'UPDATE', OLD.numero_identificacion, NEW.numero_identificacion, NEW.UserIdLog);  END IF;
IF(OLD.dv != NEW.dv)  THEN  call InsertLogs( 'terceros', 'dv', NEW.id, 'UPDATE', OLD.dv, NEW.dv, NEW.UserIdLog);  END IF;
IF(OLD.pais != NEW.pais)  THEN  call InsertLogs( 'terceros', 'pais', NEW.id, 'UPDATE', OLD.pais, NEW.pais, NEW.UserIdLog);  END IF;
IF(OLD.departamento != NEW.departamento)  THEN  call InsertLogs( 'terceros', 'departamento', NEW.id, 'UPDATE', OLD.departamento, NEW.departamento, NEW.UserIdLog);  END IF;
IF(OLD.ciudad != NEW.ciudad)  THEN  call InsertLogs( 'terceros', 'ciudad', NEW.id, 'UPDATE', OLD.ciudad, NEW.ciudad, NEW.UserIdLog);  END IF;
IF(OLD.nombre != NEW.nombre)  THEN  call InsertLogs( 'terceros', 'nombre', NEW.id, 'UPDATE', OLD.nombre, NEW.nombre, NEW.UserIdLog);  END IF;
IF(OLD.sector_empresarial != NEW.sector_empresarial)  THEN  call InsertLogs( 'terceros', 'sector_empresarial', NEW.id, 'UPDATE', OLD.sector_empresarial, NEW.sector_empresarial, NEW.UserIdLog);  END IF;
IF(OLD.direccion != NEW.direccion)  THEN  call InsertLogs( 'terceros', 'direccion', NEW.id, 'UPDATE', OLD.direccion, NEW.direccion, NEW.UserIdLog);  END IF;
IF(OLD.telefono1 != NEW.telefono1)  THEN  call InsertLogs( 'terceros', 'telefono1', NEW.id, 'UPDATE', OLD.telefono1, NEW.telefono1, NEW.UserIdLog);  END IF;
IF(OLD.tipo != NEW.tipo)  THEN  call InsertLogs( 'terceros', 'tipo', NEW.id, 'UPDATE', OLD.tipo, NEW.tipo, NEW.UserIdLog);  END IF;
IF(OLD.tipo_cliente_comercial != NEW.tipo_cliente_comercial)  THEN  call InsertLogs( 'terceros', 'tipo_cliente_comercial', NEW.id, 'UPDATE', OLD.tipo_cliente_comercial, NEW.tipo_cliente_comercial, NEW.UserIdLog);  END IF;
IF(OLD.ciudad_identificacion != NEW.ciudad_identificacion)  THEN  call InsertLogs( 'terceros', 'ciudad_identificacion', NEW.id, 'UPDATE', OLD.ciudad_identificacion, NEW.ciudad_identificacion, NEW.UserIdLog);  END IF;
IF(OLD.nombre_comercial != NEW.nombre_comercial)  THEN  call InsertLogs( 'terceros', 'nombre_comercial', NEW.id, 'UPDATE', OLD.nombre_comercial, NEW.nombre_comercial, NEW.UserIdLog);  END IF;
IF(OLD.tipo_cliente != NEW.tipo_cliente)  THEN  call InsertLogs( 'terceros', 'tipo_cliente', NEW.id, 'UPDATE', OLD.tipo_cliente, NEW.tipo_cliente, NEW.UserIdLog);  END IF;
IF(OLD.tipo_proveedor != NEW.tipo_proveedor)  THEN  call InsertLogs( 'terceros', 'tipo_proveedor', NEW.id, 'UPDATE', OLD.tipo_proveedor, NEW.tipo_proveedor, NEW.UserIdLog);  END IF;
IF(OLD.encuesta != NEW.encuesta)  THEN  call InsertLogs( 'terceros', 'encuesta', NEW.id, 'UPDATE', OLD.encuesta, NEW.encuesta, NEW.UserIdLog);  END IF;
IF(OLD.encuesta_destinatario != NEW.encuesta_destinatario)  THEN  call InsertLogs( 'terceros', 'encuesta_destinatario', NEW.id, 'UPDATE', OLD.encuesta_destinatario, NEW.encuesta_destinatario, NEW.UserIdLog);  END IF;
IF(OLD.encuesta_email != NEW.encuesta_email)  THEN  call InsertLogs( 'terceros', 'encuesta_email', NEW.id, 'UPDATE', OLD.encuesta_email, NEW.encuesta_email, NEW.UserIdLog);  END IF;
IF(OLD.encuesta_telefono != NEW.encuesta_telefono)  THEN  call InsertLogs( 'terceros', 'encuesta_telefono', NEW.id, 'UPDATE', OLD.encuesta_telefono, NEW.encuesta_telefono, NEW.UserIdLog);  END IF;
IF(OLD.encuesta_celular != NEW.encuesta_celular)  THEN  call InsertLogs( 'terceros', 'encuesta_celular', NEW.id, 'UPDATE', OLD.encuesta_celular, NEW.encuesta_celular, NEW.UserIdLog);  END IF;
IF(OLD.exento_iva != NEW.exento_iva)  THEN  call InsertLogs( 'terceros', 'exento_iva', NEW.id, 'UPDATE', OLD.exento_iva, NEW.exento_iva, NEW.UserIdLog);  END IF;
IF(OLD.nombre_zona_comercial != NEW.nombre_zona_comercial)  THEN  call InsertLogs( 'terceros', 'nombre_zona_comercial', NEW.id, 'UPDATE', OLD.nombre_zona_comercial, NEW.nombre_zona_comercial, NEW.UserIdLog);  END IF;
IF(OLD.id_tercero_tributario != NEW.id_tercero_tributario)  THEN  call InsertLogs( 'terceros', 'id_tercero_tributario', NEW.id, 'UPDATE', OLD.id_tercero_tributario, NEW.id_tercero_tributario, NEW.UserIdLog);  END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tercerosasignadosINSERT`;
DELIMITER ;;
CREATE TRIGGER `tercerosasignadosINSERT` BEFORE INSERT ON `terceros_asignados` FOR EACH ROW BEGIN

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado );

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tercerosasignadosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `tercerosasignadosUPDATE` BEFORE UPDATE ON `terceros_asignados` FOR EACH ROW BEGIN

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado );

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_bloqueos_INSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_bloqueos_INSERT` BEFORE INSERT ON `terceros_bloqueos_log` FOR EACH ROW BEGIN

SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosContactosINSERT`;
DELIMITER ;;
CREATE TRIGGER `TercerosContactosINSERT` BEFORE INSERT ON `terceros_contactos` FOR EACH ROW BEGIN

SET NEW.tratamiento = (SELECT nombre FROM terceros_tratamiento WHERE id = NEW.id_tratamiento);
SET NEW.tipo_identificacion = (SELECT nombre FROM tipo_documento WHERE id = NEW.id_tipo_identificacion );
SET NEW.sucursal = (SELECT nombre FROM terceros_direcciones WHERE id = NEW.id_sucursal);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosContactosINSERT2`;
DELIMITER ;;
CREATE TRIGGER `TercerosContactosINSERT2` AFTER INSERT ON `terceros_contactos` FOR EACH ROW BEGIN

IF(NEW.ContactoAuto = 0) THEN
     UPDATE terceros SET contactos = (SELECT count(id) FROM terceros_contactos WHERE id_tercero = NEW.id_tercero AND activo = 1) WHERE id = NEW.id_tercero;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TecerosContactosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `TecerosContactosUPDATE` BEFORE UPDATE ON `terceros_contactos` FOR EACH ROW BEGIN

SET NEW.tratamiento = (SELECT nombre FROM terceros_tratamiento WHERE id = NEW.id_tratamiento);
SET NEW.tipo_identificacion = (SELECT nombre FROM tipo_documento WHERE id = NEW.id_tipo_identificacion );
SET NEW.sucursal = (SELECT nombre FROM terceros_direcciones WHERE id = NEW.id_sucursal);  

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosContactosUPDATE2`;
DELIMITER ;;
CREATE TRIGGER `TercerosContactosUPDATE2` AFTER UPDATE ON `terceros_contactos` FOR EACH ROW BEGIN

UPDATE terceros SET contactos = (SELECT count(id) FROM terceros_contactos WHERE id_tercero = NEW.id_tercero AND activo = 1) WHERE id = NEW.id_tercero; 
 
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosContactosEmailINSERT`;
DELIMITER ;;
CREATE TRIGGER `TercerosContactosEmailINSERT` AFTER INSERT ON `terceros_contactos_email` FOR EACH ROW BEGIN
   UPDATE terceros_contactos SET emails = (SELECT count(id) FROM terceros_contactos_email WHERE id_contacto = NEW.id_contacto AND activo = 1) WHERE id = NEW.id_contacto;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosContactosEmailUpdate`;
DELIMITER ;;
CREATE TRIGGER `TercerosContactosEmailUpdate` AFTER UPDATE ON `terceros_contactos_email` FOR EACH ROW BEGIN
   UPDATE terceros_contactos SET emails = (SELECT count(id) FROM terceros_contactos_email WHERE id_contacto = NEW.id_contacto AND activo = 1) WHERE id = NEW.id_contacto;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_direccionesINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_direccionesINSERT` BEFORE INSERT ON `terceros_direcciones` FOR EACH ROW BEGIN

SET NEW.departamento =(SELECT departamento FROM ubicacion_departamento WHERE id = NEW.id_departamento);
SET NEW.ciudad =(SELECT ciudad FROM ubicacion_ciudad WHERE id = NEW.id_ciudad);
SET NEW.tipo_cliente_comercial = (SELECT nombre FROM terceros_tipo_cliente WHERE id = NEW.id_tipo_cliente_comercial );

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_direccionesINSERT2`;
DELIMITER ;;
CREATE TRIGGER `terceros_direccionesINSERT2` AFTER INSERT ON `terceros_direcciones` FOR EACH ROW BEGIN

DECLARE cont INT;
DECLARE cont_tercero INT;

IF(NEW.direccion_principal = 0) THEN 

SET cont = (SELECT count(id) FROM terceros_direcciones WHERE id_tercero = NEW.id_tercero AND activo = 1 AND direccion_principal=0);
SET cont_tercero = (SELECT direcciones FROM terceros WHERE id = NEW.id_tercero);

if(cont <> cont_tercero) THEN
UPDATE terceros SET direcciones = cont WHERE id = NEW.id_tercero;
END IF;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_direccionesUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_direccionesUPDATE` BEFORE UPDATE ON `terceros_direcciones` FOR EACH ROW BEGIN

SET NEW.id_pais =(SELECT id_pais FROM terceros WHERE id = NEW.id_tercero);
SET NEW.pais =(SELECT pais FROM terceros WHERE id = NEW.id_tercero);
SET NEW.departamento =(SELECT departamento FROM ubicacion_departamento WHERE id = NEW.id_departamento);
SET NEW.ciudad =(SELECT ciudad FROM ubicacion_ciudad WHERE id = NEW.id_ciudad);
SET NEW.tipo_cliente_comercial = (SELECT nombre FROM terceros_tipo_cliente WHERE id = NEW.id_tipo_cliente_comercial );

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_direccionesUPDATE2`;
DELIMITER ;;
CREATE TRIGGER `terceros_direccionesUPDATE2` AFTER UPDATE ON `terceros_direcciones` FOR EACH ROW BEGIN

DECLARE cont INT;
DECLARE cont_tercero INT;

IF(NEW.direccion_principal = 0) THEN 

SET cont = (SELECT count(id) FROM terceros_direcciones WHERE id_tercero = NEW.id_tercero AND activo = 1 AND direccion_principal=0);
SET cont_tercero = (SELECT direcciones FROM terceros WHERE id = NEW.id_tercero);

if(cont <> cont_tercero) THEN
UPDATE terceros SET direcciones = cont WHERE id = NEW.id_tercero;
END IF;
END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_direcciones_areasINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_direcciones_areasINSERT` BEFORE INSERT ON `terceros_direcciones_areas` FOR EACH ROW BEGIN
      SET NEW.tipo_area = (SELECT nombre FROM configuracion_tipos_areas WHERE id = NEW.id_tipo_area);
      SET NEW.ubicacion = (SELECT nombre FROM configuracion_tipos_ubicaciones WHERE id = NEW.id_ubicacion);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_direcciones_areasUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_direcciones_areasUPDATE` BEFORE UPDATE ON `terceros_direcciones_areas` FOR EACH ROW BEGIN
      SET NEW.tipo_area = (SELECT nombre FROM configuracion_tipos_areas WHERE id = NEW.id_tipo_area);
      SET NEW.ubicacion = (SELECT nombre FROM configuracion_tipos_ubicaciones WHERE id = NEW.id_ubicacion);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tercerosdireccionesasignadosINSERT_copy`;
DELIMITER ;;
CREATE TRIGGER `tercerosdireccionesasignadosINSERT_copy` BEFORE INSERT ON `terceros_direcciones_asignados` FOR EACH ROW BEGIN

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado );

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tercerosdireccionesasignadosUPDATE_copy`;
DELIMITER ;;
CREATE TRIGGER `tercerosdireccionesasignadosUPDATE_copy` BEFORE UPDATE ON `terceros_direcciones_asignados` FOR EACH ROW BEGIN

     SET NEW.asignado = (SELECT nombre FROM empleados WHERE id = NEW.id_asignado );

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_direcciones_contratosINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_direcciones_contratosINSERT` BEFORE INSERT ON `terceros_direcciones_contratos` FOR EACH ROW BEGIN
       SET NEW.causal_terminacion = (SELECT nombre FROM configuracion_contratos_causales_terminacion WHERE id = NEW.id_causal_terminacion);
       SET NEW.clase_contrato = (SELECT nombre FROM configuracion_contratos_clases WHERE id = NEW.id_clase_contrato);
       SET NEW.tipo_negociacion = (SELECT nombre FROM configuracion_contratos_tipos_negociacion WHERE id = NEW.id_tipo_negociacion);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_direcciones_contratosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_direcciones_contratosUPDATE` BEFORE UPDATE ON `terceros_direcciones_contratos` FOR EACH ROW BEGIN
       SET NEW.causal_terminacion = (SELECT nombre FROM configuracion_contratos_causales_terminacion WHERE id = NEW.id_causal_terminacion);
       SET NEW.clase_contrato = (SELECT nombre FROM configuracion_contratos_clases WHERE id = NEW.id_clase_contrato);
       SET NEW.tipo_negociacion = (SELECT nombre FROM configuracion_contratos_tipos_negociacion WHERE id = NEW.id_tipo_negociacion);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosDireccionesEmailINSERT_copy`;
DELIMITER ;;
CREATE TRIGGER `TercerosDireccionesEmailINSERT_copy` AFTER INSERT ON `terceros_direcciones_email` FOR EACH ROW BEGIN
   UPDATE terceros_direcciones SET emails = (SELECT count(id) FROM terceros_direcciones_email WHERE id_direccion = NEW.id_direccion AND activo = 1) WHERE id = NEW.id_direccion;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosDireccionesEmailUpdate_copy`;
DELIMITER ;;
CREATE TRIGGER `TercerosDireccionesEmailUpdate_copy` AFTER UPDATE ON `terceros_direcciones_email` FOR EACH ROW BEGIN
   UPDATE terceros_direcciones SET emails = (SELECT count(id) FROM terceros_direcciones_email WHERE id_direccion = NEW.id_direccion AND activo = 1) WHERE id = NEW.id_direccion;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `lista_preciosINSERT`;
DELIMITER ;;
CREATE TRIGGER `lista_preciosINSERT` BEFORE INSERT ON `terceros_direcciones_items_precios` FOR EACH ROW BEGIN

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_documentosINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_documentosINSERT` BEFORE INSERT ON `terceros_documentos` FOR EACH ROW BEGIN
SET NEW.tipo_documento_nombre = (SELECT nombre FROM terceros_tipo_documento WHERE id = NEW.tipo_documento);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_documentosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_documentosUPDATE` BEFORE UPDATE ON `terceros_documentos` FOR EACH ROW BEGIN
SET NEW.tipo_documento_nombre = (SELECT nombre FROM terceros_tipo_documento WHERE id = NEW.tipo_documento);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_documentos_confidencialesINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_documentos_confidencialesINSERT` BEFORE INSERT ON `terceros_documentos_confidenciales` FOR EACH ROW BEGIN
SET NEW.tipo_documento_nombre = (SELECT nombre FROM terceros_tipo_documento_confidencial WHERE id = NEW.tipo_documento);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_documentos_confidencialesUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_documentos_confidencialesUPDATE` BEFORE UPDATE ON `terceros_documentos_confidenciales` FOR EACH ROW BEGIN
SET NEW.tipo_documento_nombre = (SELECT nombre FROM terceros_tipo_documento_confidencial WHERE id = NEW.tipo_documento);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_ficha_tecnicaINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_ficha_tecnicaINSERT` BEFORE INSERT ON `terceros_ficha_tecnica` FOR EACH ROW BEGIN

SET NEW.forma_pago =  (SELECT nombre FROM configuracion_formas_pago WHERE id = NEW.id_forma_pago LIMIT 0,1);

UPDATE terceros SET ficha_tecnica = 'true' where id = NEW.id_tercero ;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_ficha_tecnicaUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_ficha_tecnicaUPDATE` BEFORE UPDATE ON `terceros_ficha_tecnica` FOR EACH ROW BEGIN

SET NEW.forma_pago =  (SELECT nombre FROM configuracion_formas_pago WHERE id = NEW.id_forma_pago LIMIT 0,1);

UPDATE terceros SET ficha_tecnica = 'true' where id = NEW.id_tercero ;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosFichaTecnicaEmailINSERT`;
DELIMITER ;;
CREATE TRIGGER `TercerosFichaTecnicaEmailINSERT` BEFORE INSERT ON `terceros_ficha_tecnica_email` FOR EACH ROW BEGIN
       SET NEW.empresa=(SELECT nombre FROM empresas WHERE id=NEW.id_empresa LIMIT 0,1);
       SET NEW.sucursal=(SELECT nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal LIMIT 0,1);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `TercerosFichaTecnicaEmailUpdate`;
DELIMITER ;;
CREATE TRIGGER `TercerosFichaTecnicaEmailUpdate` BEFORE UPDATE ON `terceros_ficha_tecnica_email` FOR EACH ROW BEGIN
       SET NEW.empresa=(SELECT nombre FROM empresas WHERE id=NEW.id_empresa LIMIT 0,1);
       SET NEW.sucursal=(SELECT nombre FROM empresas_sucursales WHERE id=NEW.id_sucursal LIMIT 0,1);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_logINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_logINSERT` BEFORE INSERT ON `terceros_log` FOR EACH ROW BEGIN

      SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
	
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_logUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_logUPDATE` BEFORE UPDATE ON `terceros_log` FOR EACH ROW BEGIN

      SET NEW.usuario=(SELECT nombre FROM empleados WHERE activo=1 AND id=NEW.id_usuario);
	
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_proveedor_serviciosINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_proveedor_serviciosINSERT` BEFORE INSERT ON `terceros_proveedores_servicios` FOR EACH ROW BEGIN
       SET NEW.nombre_servicio = (SELECT nombre FROM configuracion_tipos_servicios_proveedores WHERE id = NEW.id_servicio);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_proveedor_serviciosUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_proveedor_serviciosUPDATE` BEFORE UPDATE ON `terceros_proveedores_servicios` FOR EACH ROW BEGIN
       SET NEW.nombre_servicio = (SELECT nombre FROM configuracion_tipos_servicios_proveedores WHERE id = NEW.id_servicio);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_sucursales_itemsINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_sucursales_itemsINSERT` BEFORE INSERT ON `terceros_sucursales_items` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE  id=NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE  id=NEW.id_sucursal);
SET NEW.codigo = (SELECT codigo FROM items WHERE id = NEW.id_item);
SET NEW.item = (SELECT nombre FROM items WHERE id = NEW.id_item);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_sucursales_itemsUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_sucursales_itemsUPDATE` BEFORE UPDATE ON `terceros_sucursales_items` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE  id=NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE  id=NEW.id_sucursal);
SET NEW.codigo = (SELECT codigo FROM items WHERE id = NEW.id_item);
SET NEW.item = (SELECT nombre FROM items WHERE id = NEW.id_item);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_sucursales_itemsCotINSERT_copy`;
DELIMITER ;;
CREATE TRIGGER `terceros_sucursales_itemsCotINSERT_copy` BEFORE INSERT ON `terceros_sucursales_items_cotizaciones` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE  id=NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE  id=NEW.id_sucursal);
SET NEW.codigo = (SELECT codigo FROM items WHERE id = NEW.id_item);
SET NEW.item = (SELECT nombre FROM items WHERE id = NEW.id_item);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_sucursales_itemsCotUPDATE_copy`;
DELIMITER ;;
CREATE TRIGGER `terceros_sucursales_itemsCotUPDATE_copy` BEFORE UPDATE ON `terceros_sucursales_items_cotizaciones` FOR EACH ROW BEGIN

SET NEW.empresa = (SELECT nombre FROM empresas WHERE  id=NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE  id=NEW.id_sucursal);
SET NEW.codigo = (SELECT codigo FROM items WHERE id = NEW.id_item);
SET NEW.item = (SELECT nombre FROM items WHERE id = NEW.id_item);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_zona_comercialINSERT`;
DELIMITER ;;
CREATE TRIGGER `terceros_zona_comercialINSERT` BEFORE INSERT ON `terceros_zona_comercial` FOR EACH ROW BEGIN

SET NEW.pais =(SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `terceros_zona_comercialUPDATE`;
DELIMITER ;;
CREATE TRIGGER `terceros_zona_comercialUPDATE` BEFORE UPDATE ON `terceros_zona_comercial` FOR EACH ROW BEGIN

SET NEW.pais =(SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `UbicacionCiudadINSERT`;
DELIMITER ;;
CREATE TRIGGER `UbicacionCiudadINSERT` BEFORE INSERT ON `ubicacion_ciudad` FOR EACH ROW BEGIN

SET NEW.pais =(SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);
SET NEW.departamento =(SELECT departamento FROM ubicacion_departamento WHERE id = NEW.id_departamento);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `UbicacionCiudadUPDATE`;
DELIMITER ;;
CREATE TRIGGER `UbicacionCiudadUPDATE` BEFORE UPDATE ON `ubicacion_ciudad` FOR EACH ROW BEGIN

SET NEW.pais =(SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);
SET NEW.departamento =(SELECT departamento FROM ubicacion_departamento WHERE id = NEW.id_departamento);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `UbicacionDepartamentoINSERT`;
DELIMITER ;;
CREATE TRIGGER `UbicacionDepartamentoINSERT` BEFORE INSERT ON `ubicacion_departamento` FOR EACH ROW BEGIN

SET NEW.pais =(SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `UbicacionDepartamentoUPDATE`;
DELIMITER ;;
CREATE TRIGGER `UbicacionDepartamentoUPDATE` BEFORE UPDATE ON `ubicacion_departamento` FOR EACH ROW BEGIN

SET NEW.pais =(SELECT pais FROM ubicacion_pais WHERE id = NEW.id_pais);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `variablesINSERT`;
DELIMITER ;;
CREATE TRIGGER `variablesINSERT` BEFORE INSERT ON `variables` FOR EACH ROW BEGIN

SET NEW.grupo = (SELECT nombre FROM variables_grupos WHERE id = NEW.id_grupo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `variablesUPDATE`;
DELIMITER ;;
CREATE TRIGGER `variablesUPDATE` BEFORE UPDATE ON `variables` FOR EACH ROW BEGIN

SET NEW.grupo = (SELECT nombre FROM variables_grupos WHERE id = NEW.id_grupo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `variablesINSERT_copy`;
DELIMITER ;;
CREATE TRIGGER `variablesINSERT_copy` BEFORE INSERT ON `variables_revisiones` FOR EACH ROW BEGIN

SET NEW.grupo = (SELECT nombre FROM variables_grupos WHERE id = NEW.id_grupo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `variablesUPDATE_copy`;
DELIMITER ;;
CREATE TRIGGER `variablesUPDATE_copy` BEFORE UPDATE ON `variables_revisiones` FOR EACH ROW BEGIN

SET NEW.grupo = (SELECT nombre FROM variables_grupos WHERE id = NEW.id_grupo);

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `voipINSERT`;
DELIMITER ;;
CREATE TRIGGER `voipINSERT` BEFORE INSERT ON `voip` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);

SET NEW.fecha_modificacion = NOW();

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `voipUPDATE`;
DELIMITER ;;
CREATE TRIGGER `voipUPDATE` BEFORE UPDATE ON `voip` FOR EACH ROW BEGIN
SET NEW.empresa = (SELECT nombre FROM empresas WHERE id = NEW.id_empresa);
SET NEW.sucursal = (SELECT nombre FROM empresas_sucursales WHERE id = NEW.id_sucursal);

SET NEW.fecha_modificacion = NOW();

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `voip_cofiguracionDELETE`;
DELIMITER ;;
CREATE TRIGGER `voip_cofiguracionDELETE` BEFORE DELETE ON `voip_configuracion_servidor` FOR EACH ROW BEGIN
DELETE FROM voip WHERE id_configuracion_servidor=old.id;
END
;;
DELIMITER ;
