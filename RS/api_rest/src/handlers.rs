use salvo::{handler, Request, Response};
use salvo::http::StatusCode;
use salvo::prelude::Json;

use crate::{alumno, ALUMNOS, CANT_ALUMNOS, DB};
use crate::alumno::AlumnoDTO;

#[handler]
pub async fn health_check() -> &'static str {
    "Paradigmas 2023"
}

#[handler]
pub async fn get_alumnos(res: &mut Response) {
    let db = DB.lock().unwrap();
    let lista_alumnos = db.select_all();
    res.render(Json(&lista_alumnos));
}

#[handler]
pub async fn get_alumno(req: &mut Request, res: &mut Response)  {
    let id = req.params().get("id").cloned().unwrap_or_default();
    let lista_alumnos = ALUMNOS.lock().unwrap();
    res.render(Json(lista_alumnos.alumnos.get(&id.to_string())));
}

#[handler]
pub async fn post_alumno(req: &mut Request, res: &mut Response)  {
    let a: AlumnoDTO = req.parse_json().await.unwrap();

    let mut prox_id = CANT_ALUMNOS.lock().unwrap();
    *prox_id = *prox_id + 1;

    let nuevo_alumno = alumno::Alumno { id: prox_id.to_string(), nombre: a.nombre};

    let mut lista_alumnos = ALUMNOS.lock().unwrap();
    lista_alumnos.alumnos.insert( prox_id.to_string(), nuevo_alumno);
    res.status_code(StatusCode::CREATED).render(Json(lista_alumnos.alumnos.get(&prox_id.to_string())));
}

#[handler]
pub async fn put_alumno(req: &mut Request, res: &mut Response)  {
    let a: AlumnoDTO = req.parse_json().await.unwrap();
    let id = req.params().get("id").cloned().unwrap_or_default();

    if a.nombre == "" {
        res.status_code(StatusCode::BAD_REQUEST);
        return
    }

    let nuevo_alumno = alumno::Alumno { id: id.to_string(), nombre: a.nombre};

    let mut lista_alumnos = ALUMNOS.lock().unwrap();
    lista_alumnos.alumnos.insert( id.to_string(), nuevo_alumno);
    res.render(Json(lista_alumnos.alumnos.get(&id.to_string())));
}