CREATE TABLE details
(
  ID     BIGINT AUTO_INCREMENT
  PRIMARY KEY,
  NAME      VARCHAR(100) NOT NULL,
  COUNT     INT          NULL,
  NECESSARY BIT          NULL,
  CONSTRAINT Details_ID_uindex
  UNIQUE (ID)
)
  ENGINE = InnoDB;

INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Кулер',6,TRUE);
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Материнская плата',7,TRUE);
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Клавиатура безпроводная',2,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Оперативная память',15,TRUE);
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('HDD 500Гб',7,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('HDD 320Гб',5,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('HDD 250Гб',11,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('HDD 1Тб',5,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('SDD 500Гб',4,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('SDD 320Гб',7,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('SDD 250Гб',12,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('SDD 1Тб',1,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('HDD 500Гб',7,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('HDD 320Гб',5,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('HDD 250Гб',11,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Процессор',4,TRUE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Выдеокарта',15,TRUE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Звукавая карта',8,TRUE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Корпус',20,TRUE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Процессор',4,TRUE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Мышка проводная',25,TRUE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Мышка безпроводная',4,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Клавиатура проводная',14,TRUE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Блок питания',6,TRUE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Принтер',11,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Сканер',19,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('МФУ',9,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Дисковод',7,TRUE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Флеш карта 4 Гб',9,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Флеш карта 16 Гб',11,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Флеш карта 8 Гб',5,FALSE );
INSERT INTO details(NAME,COUNT,NECESSARY) VALUES ('Флеш карта 32 Гб',2,FALSE );