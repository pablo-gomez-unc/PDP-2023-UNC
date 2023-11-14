use rusqlite::{Connection};
use crate::alumno;
use crate::alumno::Alumno;

pub struct Db {
    conn : Connection
}

impl Db {
    pub fn new_connection() -> Db {
        let conn = Connection::open("rust.db");
        Db {conn: conn.unwrap()}
    }

    pub fn create_table(&self) {
        self.conn.execute(
            "CREATE TABLE IF NOT EXISTS alumnos (
             id VACHAR(15) PRIMARY KEY,
             nombre VARCHAR(30) NOT NULL
         )", [] ).expect("error");
    }

    pub fn insert (&self, id: &str, nombre:&str ) {
        self.conn.execute(
            "INSERT INTO alumnos (id, nombre) VALUES (?1, ?2)",
            &[id, nombre],
        ).expect("error");
    }

    pub fn select_all(&self) -> Vec<Alumno> {
        let mut stmt = self.conn.prepare("SELECT id, nombre FROM alumnos").expect("");
        let rows = stmt.query_map([], |row| {
            Ok(alumno::Alumno {
                id: row.get(0)?,
                nombre: row.get(1)?,
            })
        }).expect("");

        let mut result = Vec::new();
        for row in rows {
            result.push(row.expect(""));
        }
        result
    }
}