create database if not exists case_study;
use case_study;
CREATE TABLE position (
id INT PRIMARY KEY,
name VARCHAR(225) NOT NULL
);
CREATE TABLE education_degree (
id INT PRIMARY KEY,
name VARCHAR(225) NOT NULL
);
CREATE TABLE division (
id INT PRIMARY KEY,
name VARCHAR(225) NOT NULL
);
CREATE TABLE customer_type (
id INT PRIMARY KEY,
name VARCHAR(225) NOT NULL
);
CREATE TABLE service_type (
id INT PRIMARY KEY,
name VARCHAR(225) NOT NULL
);
CREATE TABLE role (
id INT PRIMARY KEY,
name VARCHAR(225) NOT NULL
);
CREATE TABLE user (
userName VARCHAR(225) PRIMARY KEY,
password VARCHAR(45)
);
CREATE TABLE user_role (
id INT,
userName VARCHAR(225),
PRIMARY KEY (id,userName),
FOREIGN KEY(id) references role(id),
FOREIGN KEY(userName) references user(userName)
);
CREATE TABLE attach_service (
id INT PRIMARY KEY,
name VARCHAR(225) NOT NULL,
cost DOUBLE NOT NULL,
unit INT NOT NULL,
status VARCHAR(45)
);
CREATE TABLE rent_type (
id INT PRIMARY KEY,
name VARCHAR(225),
cost DOUBLE	
);
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthDate DATE NOT NULL,
    idCard VARCHAR(20) UNIQUE,
    salary DOUBLE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(255),
    address VARCHAR(255),
    idPosition INT,
    idEducationDegree INT,
    idDivision INT,
    userName VARCHAR(50) UNIQUE,
    isActive bit default 1,
    FOREIGN KEY(idPosition) references position (id),
    FOREIGN KEY(idEducationDegree) references education_degree(id),
    FOREIGN KEY(idDivision) references division(id),
    FOREIGN KEY(userName) references user(userName)
);
CREATE TABLE Customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idType INT,
    name VARCHAR(255) NOT NULL,
    birthDate DATE NOT NULL,
    gender BOOLEAN NOT NULL,
    idCard VARCHAR(20) UNIQUE NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(255),
    address VARCHAR(255),
    isActive BIT default 1,
    FOREIGN KEY (idType) REFERENCES customer_type(id)
);
CREATE TABLE Service (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    serviceArea INT,
    serviceCost DOUBLE NOT NULL,
    serviceMaxPeople INT,
    idRentType INT,
    idServiceType INT,
    standardRoom VARCHAR(255),
    descriptionOtherConvenience VARCHAR(255),
    poolArea DOUBLE,
    numberOfFloors INT,
    isActive BIT DEFAULT 1,
    FOREIGN KEY (idRentType) REFERENCES rent_type(id),
    FOREIGN KEY (idServiceType) REFERENCES service_type(id)
);
CREATE TABLE Contract (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dateStart DATE NOT NULL,
    dateEnd DATE NOT NULL,
    deposit DOUBLE NOT NULL,
    totalMoney DOUBLE NOT NULL,
    idEmployee INT,
    idCustomer INT,
    idService INT,
    isActive BIT DEFAULT 1,
    FOREIGN KEY (idEmployee) REFERENCES Employee(id),
    FOREIGN KEY (idCustomer) REFERENCES Customer(id),
    FOREIGN KEY (idService) REFERENCES Service(id)
);
CREATE TABLE contract_detail (
id INT PRIMARY KEY,
idContract int,
idAttachService int,
quantity INT NOT NULL,
FOREIGN KEY (idContract) REFERENCES Contract(id),
FOREIGN KEY (idAttachService) REFERENCES attach_service(id)
);



