-- Procedimiento 1: buscar paciente por DNI
DELIMITER //

CREATE PROCEDURE buscar_paciente_por_dni(IN p_dni VARCHAR(20))
BEGIN
    SELECT id, dni, nombre, apellido, obra_social, email, telefono
    FROM paciente
    WHERE dni = p_dni;
END;
//

-- Procedimiento 2: buscar pacientes por nombre parcial (case-insensitive)
CREATE PROCEDURE buscar_pacientes_por_nombre(IN p_nombre VARCHAR(50))
BEGIN
    SELECT id, dni, nombre, apellido, obra_social, email, telefono
    FROM paciente
    WHERE LOWER(nombre) LIKE CONCAT('%', LOWER(p_nombre), '%');
END;
//

-- Procedimiento 3: buscar pacientes por obra social con paginación
CREATE PROCEDURE buscar_pacientes_por_obra_social_paginado(
    IN p_obra_social VARCHAR(50),
    IN p_limit INT,
    IN p_offset INT
)
BEGIN
    SELECT id, dni, nombre, apellido, obra_social, email, telefono
    FROM paciente
    WHERE obra_social = p_obra_social
    LIMIT p_limit OFFSET p_offset;
END;
//

DELIMITER ;