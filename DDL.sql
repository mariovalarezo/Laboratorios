
CREATE TABLE paciente (
  cedula INT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  fechaNacimiento VARCHAR(45) NULL,
  peso VARCHAR(45) NULL,
  altura VARCHAR(45) NULL,
  sexo VARCHAR(45) NULL,
  telefono VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  PRIMARY KEY (cedula))
ENGINE = InnoDB;


CREATE TABLE medico (
  cedula INT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  especialidad VARCHAR(45) NULL,
  telefono VARCHAR(45) NULL,
  PRIMARY KEY (cedula))
ENGINE = InnoDB;


CREATE TABLE medicamento (
  nombre VARCHAR(100) NOT NULL,
  tipo VARCHAR(45) NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


CREATE TABLE tratamiento (
  idTratamiento INT NOT NULL,
  estadoTratamiento VARCHAR(45) NULL,
  fechaInicio VARCHAR(45) NULL,
  paciente_cedula INT NOT NULL,
  medico_cedula INT NOT NULL,
  PRIMARY KEY (idTratamiento),
  INDEX fk_tratamiento_paciente_idx (paciente_cedula ASC) VISIBLE,
  INDEX fk_tratamiento_medico1_idx (medico_cedula ASC) VISIBLE,
  CONSTRAINT fk_tratamiento_paciente
    FOREIGN KEY (paciente_cedula)
    REFERENCES paciente (cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_tratamiento_medico1
    FOREIGN KEY (medico_cedula)
    REFERENCES medico (cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE rehabilitacion (
  idRehabilitacion INT NOT NULL,
  duracion VARCHAR(45) NULL,
  fechaInicio VARCHAR(45) NULL,
  fechaFin VARCHAR(45) NULL,
  descripcion VARCHAR(45) NULL,
  PRIMARY KEY (idRehabilitacion))
ENGINE = InnoDB;


CREATE TABLE cita (
  idCita INT NOT NULL,
  fechaInicio VARCHAR(45) NULL,
  fechaFin VARCHAR(45) NULL,
  paciente_cedula INT NOT NULL,
  medico_cedula INT NOT NULL,
  PRIMARY KEY (idCita),
  INDEX fk_cita_paciente1_idx (paciente_cedula ASC) VISIBLE,
  INDEX fk_cita_medico1_idx (medico_cedula ASC) VISIBLE,
  CONSTRAINT fk_cita_paciente1
    FOREIGN KEY (paciente_cedula)
    REFERENCES paciente (cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_cita_medico1
    FOREIGN KEY (medico_cedula)
    REFERENCES medico (cedula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE TxR (
  rehabilitacion_idRehabilitacion INT NOT NULL,
  tratamiento_idTratamiento INT NOT NULL,
  INDEX fk_TxR_rehabilitacion1_idx (rehabilitacion_idRehabilitacion ASC) VISIBLE,
  INDEX fk_TxR_tratamiento1_idx (tratamiento_idTratamiento ASC) VISIBLE,
  CONSTRAINT fk_TxR_rehabilitacion1
    FOREIGN KEY (rehabilitacion_idRehabilitacion)
    REFERENCES rehabilitacion (idRehabilitacion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_TxR_tratamiento1
    FOREIGN KEY (tratamiento_idTratamiento)
    REFERENCES tratamiento (`idTratamiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS TxM (
  medicamento_nombre VARCHAR(100) NOT NULL,
  tratamiento_idTratamiento INT NOT NULL,
  dosis VARCHAR(45) NULL,
  fechaInicio VARCHAR(45) NULL,
  fechaFin VARCHAR(45) NULL,
  frecuencia VARCHAR(45) NULL,
  horasTomas VARCHAR(200) NULL,
  INDEX fk_TxM_medicamento1_idx (medicamento_nombre ASC) VISIBLE,
  INDEX fk_TxM_tratamiento1_idx (tratamiento_idTratamiento ASC) VISIBLE,
  CONSTRAINT fk_TxM_medicamento1
    FOREIGN KEY (medicamento_nombre)
    REFERENCES medicamento (nombre)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_TxM_tratamiento1
    FOREIGN KEY (tratamiento_idTratamiento)
    REFERENCES tratamiento (idTratamiento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
