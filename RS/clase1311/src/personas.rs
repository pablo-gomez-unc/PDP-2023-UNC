use std::collections::HashMap;
use serde::{Deserialize, Serialize};


#[derive(Debug, Serialize, Deserialize)]
pub struct ListaPersonas {
    pub personas: HashMap<String,Persona>
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Persona {
    pub id: String,
    pub apellido: String,
    pub nombre: String,
    pub edad: i16
}