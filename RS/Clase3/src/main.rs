fn option_ejemplo () {
    let x: i8 = 5;
    let y: Option<i8> = Some(5);
    
    let sum = x + y.unwrap();
    println!("{sum}");

    let y: Option<i8> = None;
    let sum = x + y.unwrap_or(0);
    println!("{sum}");
}

/* 
fn option_ejemplo_falla () {
    let x: i8 = 5;
    let y: Option<i8> = Some(5);
    
    let sum = x + y;
}
*/

fn match_ejemplo () {
    let lista = [0,1,2,3,4,5];
    let numero = lista.get(3);
    let numero = match numero {
        Some(numero) => numero + 1,
        None => 0
    };
    println!("{numero}");
}

struct Triangulo {
    lado_a : f64,
    lado_b : f64,
    lado_c : f64
}

impl Triangulo {
    fn get_area (&self) -> f64 {
        let s = (self.lado_a + self.lado_b + self.lado_c) / 2.0;
        (s * (s-self.lado_a) * (s-self.lado_b) * (s-self.lado_c)).sqrt()
    }

    fn scale (&mut self, escala: f64) {
        self.lado_a *= escala;
        self.lado_b *= escala; 
        self.lado_c *= escala; 
    }

    fn new (lado_a: f64, lado_b: f64, lado_c: f64) -> Triangulo {
        Triangulo {
            lado_a,
            lado_b,
            lado_c
        }
    }
}

fn test_triangulo () {
    let mut triang = Triangulo::new(3.0,4.0,5.0);
    assert_eq!( triang.get_area() , 6.0);
    triang.scale(0.5);
    assert_eq!( triang.get_area() , 1.5);
    println! ("Todo ok!");
}

struct Rectangulo {
    ancho : f64,
    alto: f64
}

impl Rectangulo {
    fn get_area (&self) -> f64 {
        self.ancho * self.alto
    }

    fn scale (&mut self, escala: f64) {
        self.ancho *= escala;
        self.alto *= escala; 
    }
    
    fn new (ancho: f64 , alto: f64) -> Rectangulo {
        Rectangulo { ancho, alto }
    }

    fn square (size: f64) -> Rectangulo {
        Rectangulo { ancho: size, alto: size }
    }
}

fn rectangulo_ejemplo () {
    let mut rect = Rectangulo::new(1.2,3.4);
    assert_eq! (rect.get_area(), 4.08);
    rect.scale (0.5);
    assert_eq! (rect.get_area(), 1.02);
    let cuadrado = Rectangulo::square(2.0);
    assert_eq! (cuadrado.get_area(), 4.0);
    println! ("Todo ok!");
}

enum Posicion {
    Desconocida,
    Anonima,
    Conocida(f64,f64)
}

impl Posicion{
    fn mostrar (&self) {
        match *self {
            Posicion::Desconocida => println! {"Posicion desconocidad"},
            Posicion::Anonima => println! {"Posicion anónima"},
            Posicion::Conocida(lat,lon) => println! {"Posicion conocida: lat = {} , log = {}",lat,lon}
        };
    }
}

fn posicion_ejemplo () {
    let posicion1 = Posicion::Desconocida;
    posicion1.mostrar();
    let posicion2 = Posicion::Anonima;
    posicion2.mostrar();
    let posicion3 = Posicion::Conocida(28.1234, -80.1234);
    posicion3.mostrar();
}

fn main() {
    //option_ejemplo();
    //match_ejemplo();
    //rectangulo_ejemplo();
    //test_triangulo();
    //posicion_ejemplo();
}

