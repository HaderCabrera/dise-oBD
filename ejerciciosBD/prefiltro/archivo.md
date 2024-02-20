---
marp: true
---
![](/img/3.png)

---

- SCRIPT:
```

CREATE DATABASE biblioteca
    DEFAULT CHARACTER SET = 'utf8mb4';
    
use biblioteca;

CREATE TABLE solicitante(
    dni INT PRIMARY KEY,
    direc_personal varchar(200) NOT NULL,
    direc_cestudio varchar(200) NOT NULL,
    telefono INT NOT NULL
);

CREATE TABLE solicitud(
    idsolicitud INT PRIMARY KEY,
    solicitante_dni INT NOT NULL,
    FOREIGN KEY (solicitante_dni) REFERENCES solicitante(dni)
);

CREATE TABLE bibliotecario(
    id INT PRIMARY KEY,
    solicitud_idsolicitud INT NOT NULL,
    jefe varchar(100) NOT NULL,
    biblioteca_id INT NOT NULL,
	FOREIGN KEY (solicitud_idsolicitud) REFERENCES solicitud(idsolicitud),
	FOREIGN KEY (biblioteca_id) REFERENCES biblioteca(id)
);

CREATE TABLE biblioteca(
    id INT PRIMARY KEY
);

CREATE TABLE miembro(
    id INT PRIMARY KEY,
    foto varchar(45) NOT NULL,
    fecha_registro INT NOT NULL,
    bibliotecario_id INT NOT NULL,
    biblioteca_id INT NOT NULL,
	FOREIGN KEY (bibliotecario_id) REFERENCES bibliotecario(id),
    FOREIGN KEY (biblioteca_id) REFERENCES biblioteca(id)
);
```
