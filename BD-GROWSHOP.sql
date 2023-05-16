/*Creacion de la base de datos GROWSHOP*/

CREATE SCHEMA IF NOT EXISTS growshop;

/*Seleccionamos la base de datos mercado con el comando use para poder trabajar sobre la misma*/

USE growshop;

                         /*Creacion de las tablas*/

/*Creacion de Cliente*/

CREATE TABLE IF NOT EXISTS cliente(
	ID_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    DNI INT NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    CP INT NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    PRIMARY KEY(ID_cliente)
);

/*Creacion de Repartidor*/

CREATE TABLE IF NOT EXISTS repartidor(
	ID_repartidor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    DNI INT NOT NULL,
    telefono INT NOT NULL,
    vehiculo VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    CP INT NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    PRIMARY KEY(ID_repartidor)
);

/*Creacion del proveedor*/

CREATE TABLE IF NOT EXISTS proveedor(
	ID_proveedor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    DNI INT NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    CP INT NOT NULL,
    PRIMARY KEY(ID_proveedor)
);

/*Creacion de Producto*/

CREATE TABLE IF NOT EXISTS producto(
	ID_producto INT NOT NULL AUTO_INCREMENT,
    precio_unidad INT NOT NULL,
    tipo_producto VARCHAR(50) NOT NULL,
    ID_proveedor INT NOT NULL,
    PRIMARY KEY(ID_producto)
);

/*Creacion de Pedido*/

CREATE TABLE IF NOT EXISTS pedido(
	ID_pedido INT NOT NULL AUTO_INCREMENT,
    ID_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    ID_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unidad INT NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    total INT NOT NULL,
    ID_pago INT NOT NULL,
    PRIMARY KEY(ID_pedido)
);

/*Creacion de Pago*/

CREATE TABLE IF NOT EXISTS pago(
	ID_pago INT NOT NULL AUTO_INCREMENT,
    ID_cliente INT NOT NULL, 
    metodo_pago VARCHAR(50) NOT NULL,
    total INT NOT NULL,
    PRIMARY KEY(ID_pago)
);

/*Creacion de Envios*/

CREATE TABLE IF NOT EXISTS envio(
	ID_envio INT NOT NULL AUTO_INCREMENT,
    ID_repartidor INT NOT NULL,
    ID_cliente INT NOT NULL,
    ID_pedido INT NOT NULL,
    fecha_envio DATE NOT NULL,
    costo_envio INT NOT NULL,
    PRIMARY KEY(ID_envio)
);


    /*Asignacion de FK pedido*/

ALTER TABLE pedido
ADD FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente),
ADD FOREIGN KEY (ID_producto) REFERENCES producto(ID_producto)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
    
        /*Asignacion de FK producto*/

ALTER TABLE producto
ADD FOREIGN KEY (ID_proveedor) REFERENCES proveedor(ID_proveedor)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
    

 
    /*Asignacion de FK envio*/

ALTER TABLE envio
ADD FOREIGN KEY (ID_repartidor) REFERENCES repartidor(ID_repartidor),
ADD  FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente),
ADD FOREIGN KEY (ID_pedido) REFERENCES pedido(ID_pedido)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION; 
    
    /*Asignacion de FK pago*/

ALTER TABLE pago
ADD FOREIGN KEY (ID_cliente) REFERENCES cliente(ID_cliente)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION; 





