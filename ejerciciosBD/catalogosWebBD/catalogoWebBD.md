# sistema de CATALOGOS POR WEB
Dado los siguientes elementos de información, de un sistema de CATALOGOS POR WEB, se pide realizar el proceso de normalización, para la generación del modelo conceptual de la BD.
- IDENTIFICACION PRODUCTOS.
    - Código producto
    - Nombre.
    - Grupo al que pertenece (Código, Nombre)
    - Existencias.
    - Stock mínimo.
    - Stock máximo.
    - Precio unitario

- IDENTIFICACION VENDEDORES.
    - Código vendedor.
    - Nombre.
    - E-mail
    - Zona (Código, Nombre)(Ej.: Centro, Oriente, etc..)
    - Genero (M o F)

- REGISTRO DE PEDIDOS.
    - Número pedido.
    - Código vendedor.
    - Fecha pedido.
    - Valor pedido
    - Cliente (Código, Nombre, dirección, teléfono, celular, email, ciudad(Código,Nombre))
    - Productos del pedido (Número pedido, Código producto, cantidad, valorunitario)
    