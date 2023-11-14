use std::collections::HashMap;
use salvo::prelude::*;
mod handlers;
mod personas;

use lazy_static::lazy_static;
use std::sync::Mutex;

lazy_static! {
    static ref PERSONAS: Mutex<personas::ListaPersonas> = Mutex::new(personas::ListaPersonas{personas : HashMap::new()});
}

#[tokio::main]
async fn main() {
    tracing_subscriber::fmt().init();
    let router = Router::new()
        .push(Router::new().get(handlers::health))
        .push(Router::new().path("personas").get(handlers::get_personas))
        .push(Router::new().path("personas/<id>").get(handlers::get_persona_por_id))
        .push(Router::new().path("personas").post(handlers::post_persona))
        .push(Router::new().path("personas/<id>").put(handlers::put_persona));
    let acceptor = TcpListener::new("127.0.0.1:5800").bind().await;
    Server::new(acceptor).serve(router).await;
}
