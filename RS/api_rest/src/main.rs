use std::collections::BTreeMap;
use lazy_static::lazy_static;
use std::sync::Mutex;
use salvo::prelude::*;

mod handlers;
mod alumno;
mod db;

lazy_static! {
    static ref ALUMNOS: Mutex<alumno::ListaAlumnos> = Mutex::new(alumno::ListaAlumnos {alumnos: BTreeMap::new()});
    static ref CANT_ALUMNOS: Mutex<i32> = Mutex::new(0);
    static ref DB: Mutex<db::Db> = Mutex::new(db::Db::new_connection());
}

#[tokio::main]
async fn main() {
    tracing_subscriber::fmt().init();

    DB.lock().unwrap().create_table();

    //let router = Router::new().get(health_check);
    let router = Router::new()
        .push(Router::new().get(handlers::health_check))
        .push(Router::new().path("alumnos").get(handlers::get_alumnos))
        .push(Router::new().path("alumnos/<id>").get(handlers::get_alumno))
        .push(Router::new().path("alumnos").post(handlers::post_alumno))
        .push(Router::new().path("alumnos/<id>").put(handlers::put_alumno));

    let acceptor = TcpListener::new("127.0.0.1:5800").bind().await;
    Server::new(acceptor).serve(router).await;
}
