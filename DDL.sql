
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



CREATE TABLE medico (
  cedula INT NOT NULL,
  nombre VARCHAR(45) NULL,
  apellido VARCHAR(45) NULL,
  especialidad VARCHAR(45) NULL,
  telefono VARCHAR(45) NULL,
  PRIMARY KEY (cedula))



CREATE TABLE medicamento (
  nombre VARCHAR(100) NOT NULL,
  tipo VARCHAR(45) NULL,
  PRIMARY KEY (nombre))



CREATE TABLE tratamiento (
  idTratamiento INT NOT NULL,
  estadoTratamiento VARCHAR(45) NULL,
  fechaInicio VARCHAR(45) NULL,
  paciente_cedula INT NOT NULL,
  medico_cedula INT NOT NULL,
  PRIMARY KEY (idTratamiento),
  CONSTRAINT fk_tratamiento_paciente
    FOREIGN KEY (paciente_cedula)
    REFERENCES paciente (cedula),
  CONSTRAINT fk_tratamiento_medico1
    FOREIGN KEY (medico_cedula)
    REFERENCES medico (cedula))



CREATE TABLE rehabilitacion (
  idRehabilitacion INT NOT NULL,
  duracion VARCHAR(45) NULL,
  fechaInicio VARCHAR(45) NULL,
  fechaFin VARCHAR(45) NULL,
  descripcion VARCHAR(45) NULL,
  PRIMARY KEY (idRehabilitacion))



CREATE TABLE cita (
  idCita INT NOT NULL,
  fechaInicio VARCHAR(45) NULL,
  fechaFin VARCHAR(45) NULL,
  paciente_cedula INT NOT NULL,
  medico_cedula INT NOT NULL,
  PRIMARY KEY (idCita),
  CONSTRAINT fk_cita_paciente1
    FOREIGN KEY (paciente_cedula)
    REFERENCES paciente (cedula),
  CONSTRAINT fk_cita_medico1
    FOREIGN KEY (medico_cedula)
    REFERENCES medico (cedula))



CREATE TABLE TxR (
  rehab_idRehabilitacion INT NOT NULL,
  trat_idTratamiento INT NOT NULL,
  CONSTRAINT fk_rehabilitacion1
    FOREIGN KEY (rehab_idRehabilitacion)
    REFERENCES rehabilitacion (idRehabilitacion),
  CONSTRAINT fk_tratamiento1
    FOREIGN KEY (trat_idTratamiento)
    REFERENCES tratamiento (idTratamiento))



CREATE TABLE  TxM (
  medicamento_nombre VARCHAR(100) NOT NULL,
  tratamiento_idTratamiento INT NOT NULL,
  dosis VARCHAR(45) NULL,
  fechaInicio VARCHAR(45) NULL,
  fechaFin VARCHAR(45) NULL,
  frecuencia VARCHAR(45) NULL,
  horasTomas VARCHAR(200) NULL,
  CONSTRAINT fk_TxM_medicamento1
    FOREIGN KEY (medicamento_nombre)
    REFERENCES medicamento (nombre),
  CONSTRAINT fk_TxM_tratamiento1
    FOREIGN KEY (tratamiento_idTratamiento)
    REFERENCES tratamiento (idTratamiento))
