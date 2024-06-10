-- Tabla de productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    CantidadEnStock INT NOT NULL,
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Tabla de categorías
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla de clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    DireccionEnvio TEXT NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL
);

-- Tabla de pedidos
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT NOT NULL,
    FechaRealizacion DATE NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabla de detalles de pedidos
CREATE TABLE DetallesPedido (
    DetalleID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de envíos
CREATE TABLE Envios (
    EnvioID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT NOT NULL,
    FechaEstimadaEntrega DATE,
    EstadoEnvio VARCHAR(50),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

-- Tabla de reseñas
CREATE TABLE Reseñas (
    ReseñaID INT PRIMARY KEY AUTO_INCREMENT,
    ProductoID INT NOT NULL,
    ClienteID INT NOT NULL,
    Puntuacion INT CHECK (Puntuacion BETWEEN 1 AND 5),
    Comentario TEXT,
    FechaReseña DATE NOT NULL,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
