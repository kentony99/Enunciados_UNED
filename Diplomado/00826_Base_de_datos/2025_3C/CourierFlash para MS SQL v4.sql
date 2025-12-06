
/* SQL Server DDL - Cliente.Estado incluido */
IF DB_ID(N'CourierFlash_III2025') IS NULL BEGIN CREATE DATABASE [CourierFlash_III2025]; END
GO
USE [CourierFlash_III2025];
GO
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO
IF OBJECT_ID('dbo.Pago','U') IS NOT NULL DROP TABLE dbo.Pago;
IF OBJECT_ID('dbo.Movimiento','U') IS NOT NULL DROP TABLE dbo.Movimiento;
IF OBJECT_ID('dbo.Paquete','U') IS NOT NULL DROP TABLE dbo.Paquete;
IF OBJECT_ID('dbo.Envio','U') IS NOT NULL DROP TABLE dbo.Envio;
IF OBJECT_ID('dbo.Sucursal_Empleado','U') IS NOT NULL DROP TABLE dbo.Sucursal_Empleado;
IF OBJECT_ID('dbo.Empleado','U') IS NOT NULL DROP TABLE dbo.Empleado;
IF OBJECT_ID('dbo.Vehiculo','U') IS NOT NULL DROP TABLE dbo.Vehiculo;
IF OBJECT_ID('dbo.Cliente','U') IS NOT NULL DROP TABLE dbo.Cliente;
IF OBJECT_ID('dbo.Sucursal','U') IS NOT NULL DROP TABLE dbo.Sucursal;
GO

CREATE TABLE dbo.Sucursal (
  codigo_interno INT PRIMARY KEY,
  Nombre NVARCHAR(80) NOT NULL,
  Provincia NVARCHAR(50) NOT NULL,
  Ciudad NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE dbo.Cliente (
  Identificacion INT PRIMARY KEY,
  Nombre NVARCHAR(60) NOT NULL,
  Apellidos NVARCHAR(80) NOT NULL,
  Telefono NVARCHAR(20) NOT NULL,
  Email NVARCHAR(120) NOT NULL,
  Provincia NVARCHAR(50) NOT NULL,
  Canton NVARCHAR(50) NOT NULL,
  Distrito NVARCHAR(50) NOT NULL,
  Barrio NVARCHAR(80) NOT NULL,
  Estado NVARCHAR(10) NOT NULL CONSTRAINT DF_Cliente_Estado DEFAULT('Activo')
    CONSTRAINT CHK_Cliente_Estado CHECK (Estado IN (N'Activo', N'Inactivo'))
);
GO

CREATE TABLE dbo.Vehiculo (
  Placa INT PRIMARY KEY,
  Modelo NVARCHAR(40) NOT NULL,
  Capacidad_kg DECIMAL(10,2) NOT NULL,
  Estado NVARCHAR(15) NOT NULL
    CONSTRAINT CHK_Vehiculo_Estado CHECK (Estado IN (N'Disponible', N'En ruta', N'Mantenimiento'))
);
GO

CREATE TABLE dbo.Empleado (
  Codigo_Empleado INT PRIMARY KEY,
  Nombre NVARCHAR(60) NOT NULL,
  Apellidos NVARCHAR(80) NOT NULL,
  Puesto NVARCHAR(25) NOT NULL
    CONSTRAINT CHK_Empleado_Puesto CHECK (Puesto IN (N'Conductor', N'Operador de Bodega', N'Coordinador')),
  Fecha_contratacion DATE NOT NULL
);
GO

CREATE TABLE dbo.Envio (
  Envio_id INT IDENTITY(1,1) PRIMARY KEY,
  sucursal_origen INT NOT NULL REFERENCES dbo.Sucursal(codigo_interno),
  sucursal_destino INT NOT NULL REFERENCES dbo.Sucursal(codigo_interno),
  remitente_identificacion INT NOT NULL REFERENCES dbo.Cliente(Identificacion),
  destinatario_identificacion INT NOT NULL REFERENCES dbo.Cliente(Identificacion),
  fecha_creacion DATETIME2(0) NOT NULL,
  tarifa_pactada DECIMAL(12,2) NOT NULL,
  medio_pago_previsto NVARCHAR(20) NOT NULL
    CONSTRAINT CHK_Envio_MPP CHECK (medio_pago_previsto IN (N'Prepago', N'Contraentrega')),
  prioridad NVARCHAR(10) NOT NULL
    CONSTRAINT CHK_Envio_Prioridad CHECK (prioridad IN (N'Estándar', N'Exprés')),
  estado NVARCHAR(15) NOT NULL
    CONSTRAINT CHK_Envio_Estado CHECK (estado IN (N'Creado', N'En tránsito', N'En reparto', N'Entregado', N'Incidencia', N'Cancelado')),
  vehiculo_placa INT NULL REFERENCES dbo.Vehiculo(Placa),
  conductor_codigo INT NULL REFERENCES dbo.Empleado(Codigo_Empleado)
);
GO

CREATE TABLE dbo.Paquete (
  Etiqueta INT PRIMARY KEY,
  Envio_id INT NOT NULL REFERENCES dbo.Envio(Envio_id),
  peso_kg DECIMAL(10,2) NOT NULL,
  alto_cm DECIMAL(10,2) NOT NULL,
  ancho_cm DECIMAL(10,2) NOT NULL,
  largo_cm DECIMAL(10,2) NOT NULL,
  contenido_declarado NVARCHAR(120) NOT NULL,
  valor_asegurado DECIMAL(12,2) NULL
);
GO

CREATE TABLE dbo.Movimiento (
  Movimiento_id INT IDENTITY(1,1) PRIMARY KEY,
  envio_id INT NOT NULL REFERENCES dbo.Envio(Envio_id),
  fecha_hora DATETIME2(0) NOT NULL,
  tipo_evento NVARCHAR(25) NOT NULL
    CONSTRAINT CHK_Mov_Tipo CHECK (tipo_evento IN (N'Recibido en bodega', N'Transferido a ruta', N'En tránsito', N'En reparto', N'Entregado', N'Incidencia')),
  sucursal_codigo INT NOT NULL REFERENCES dbo.Sucursal(codigo_interno),
  observacion NVARCHAR(200) NULL,
  conductor_codigo INT NULL REFERENCES dbo.Empleado(Codigo_Empleado),
  vehiculo_placa INT NULL REFERENCES dbo.Vehiculo(Placa)
);
GO

CREATE TABLE dbo.Pago (
  Pago_id INT IDENTITY(1,1) PRIMARY KEY,
  envio_id INT NOT NULL REFERENCES dbo.Envio(Envio_id),
  monto DECIMAL(12,2) NOT NULL,
  fecha DATETIME2(0) NOT NULL,
  metodo_pago NVARCHAR(20) NOT NULL
    CONSTRAINT CHK_Pago_Metodo CHECK (metodo_pago IN (N'Tarjeta', N'Transferencia', N'Efectivo')),
  estado NVARCHAR(12) NOT NULL
    CONSTRAINT CHK_Pago_Estado CHECK (estado IN (N'Registrado', N'Anulado'))
);
GO

CREATE TABLE dbo.Sucursal_Empleado (
  codigo_empleado INT NOT NULL REFERENCES dbo.Empleado(Codigo_Empleado),
  sucursal_codigo INT NOT NULL REFERENCES dbo.Sucursal(codigo_interno),
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NULL,
  puesto_en_periodo NVARCHAR(30) NULL,
  CONSTRAINT PK_Sucursal_Empleado PRIMARY KEY (codigo_empleado, sucursal_codigo, fecha_inicio)
);
GO
