use salvo::{handler, Request, Response};
use salvo::http::StatusCode;
use salvo::prelude::Json;
use crate::{personas, PERSONAS};

#[handler]
pub async fn health () -> &'static str {
    "Paradigmas 2023"
}

#[handler]
pub async fn get_personas (res: &mut Response) {
    let lista = PERSONAS.lock().unwrap();
    res.render(Json(&lista.personas));
}

#[handler]
pub async fn get_persona_por_id (req: &mut Request, res: &mut Response){
    let id = req.params().get("id").cloned().unwrap_or_default();
    let lista = PERSONAS.lock().unwrap();
    res.render(Json(&lista.personas.get(&id)));
}

#[handler]
pub async fn post_persona (req: &mut Request, res: &mut Response) {
    let nueva_persona: personas::Persona = req.parse_json().await.unwrap();
    let mut lista = PERSONAS.lock().unwrap();

    let tmp_id = nueva_persona.id.clone();
    lista.personas.insert(nueva_persona.id.clone(), nueva_persona);
    res.status_code(StatusCode::CREATED).render(Json(&lista.personas.get(&tmp_id)));
}

#[handler]
pub async fn put_persona (req: &mut Request, res: &mut Response)  {
    let id = req.params().get("id").cloned().unwrap_or_default();
    let mut modificar_persona: personas::Persona = req.parse_json().await.unwrap();
    let mut lista = PERSONAS.lock().unwrap();

    let tmp_id = modificar_persona.id.clone();
    lista.personas.insert(modificar_persona.id.clone(), modificar_persona);
    res.render(Json(&lista.personas.get(&tmp_id)));
}