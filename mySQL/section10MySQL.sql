-- --------------------------------------
-- SECTION 10 - FUNCIONES
-- --------------------------------------
	-- CALCULAR EL AREA DE UN CIRCULO
	drop function calcularAreaCirculo;
	delimiter $$
	create function calcularAreaCirculo(radio double)
	returns double
	deterministic
	begin
		declare area double;
		set area = pi() * radio * radio;
		return area;
	end $$
	delimiter ;

	select calcularAreaCirculo(10);

	-- CALCULAR LA CALIFICACION DE UNA PELKCULA SEGUN SU EDAD
    delimiter $$
    create function clasificarPelicula(edad int)
    returns varchar(30)
    deterministic
    begin
		if edad < 13 then
			return "Para niños";
		elseif edad < 18 then
			return "Para adolecentes";
		else 
			return "Para adultos";
		end if;
    end $$
    delimiter ;
    
    -- CALCULAR EL FACTORIAL DE UN NUMERO
	delimiter $$
    create function calcularFactorial(numero int)
    returns int
    deterministic
    begin
		declare f int default 1;
        while numero > 1 DO
			set f = f * numero;
            set numero  = numero - 1;
        end while;
        return f;
    end $$
    delimiter ;
    
    select calcularFactorial(5);
    
    -- hallar el veihuclo mas andado
    use miprimerabasededatos;
    drop function hallarCocheMasViejo;
	delimiter $$
    create function hallarCocheMasViejo()
    returns int
    deterministic
    begin
		declare km int;
        select Kilometros into km 
        from coches 
        order by kilometros desc
        limit 1;
        return km;
    end $$
    delimiter ;
    select *
    from coches 
    where Kilometros = hallarCocheMasViejo();
