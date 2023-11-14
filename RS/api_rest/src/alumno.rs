use std::collections::BTreeMap;
use serde::{Deserialize, Serialize};
use salvo::macros::Extractible;

#[derive(Serialize, Deserialize,Debug)]
pub struct ListaAlumnos {
    pub alumnos: BTreeMap<String, Alumno>
}

#[derive(Serialize, Deserialize,  Debug)]
pub struct Alumno {
    pub  id: String,
    pub  nombre: String,
}

#[derive(Deserialize, Extractible,  Debug)]
pub struct AlumnoDTO {
    pub  id: Option<String>,
    pub  nombre: String,
}