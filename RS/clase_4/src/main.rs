use std::any;
use std::arch::x86_64::_mm256_testc_si256;
use std::fmt;

struct Rectangulo<T,U> {
    ancho : T,
    alto: U
}

impl<T,U> Rectangulo<T,U> {
    fn get_ancho (&self) -> &T {
        &self.ancho // Puede estar en stack o en heap!
    }
    fn get_alto (&self) -> &U {
        &self.alto
    }
}

impl Rectangulo<u8,u8> {
    fn get_perimetro (&self) -> u8 {
        2 * self.ancho + 2 * self.alto
    }
}

fn generics_metodos_ejemplo (){
    let rect1 = Rectangulo {
        ancho: 23,
        alto: 12.2,
    };
    println!("{}",rect1.get_ancho());
    println!("{}",rect1.get_alto());

    let rect2 = Rectangulo {
        ancho: 2u8,
        alto: 4u8
    };
    println!("{}",rect2.get_ancho());
    println!("{}",rect2.get_alto());
    println!("{}",rect2.get_perimetro());
}

fn get_mayor<T:PartialOrd> (a: T, b: T) -> T {
    if a > b {
        a
    }
    else {
        b
    }
}

fn generics_funciones_ejemplo() {
    println! ("El mayor es : {}" , get_mayor (2.2,3.3));
}

fn largest<T:PartialOrd>(list: &[T]) -> &T {
    let mut largest = &list[0];

    for item in list {
        if item > largest {
            largest = item;
        }
    }

    largest
}

fn ejemplo_generics () {
    let number_list = vec![34, 50, 25, 100, 65];

    let result = largest(&number_list);
    println!("The largest number is {}", result);

    let char_list = vec!['y', 'm', 'a', 'q'];

    let result = largest(&char_list);
    println!("The largest char is {}", result);
}

trait Summary {
    fn summarize(&self) -> String;
    fn metodo_default (&self) -> String {
        String::from("(Read more...)")
    }
}

struct NewsArticle {
    headline: String,
    location: String,
    author: String,
    content: String,
}

impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!("{}, by {} ({})", self.headline, self.author, self.location)
    }
}

struct Tweet {
    username: String,
    content: String,
    reply: bool,
    retweet: bool,
}

impl Summary for Tweet {
    fn summarize(&self) -> String {
        format!("{}: {}", self.username, self.content)
    }
}

fn notify (item: &impl Summary) {
    println!("Breaking news! {}", item.summarize());
}

fn ejemplo_traits () {
        let tweet = Tweet {
            username: String::from("horse_ebooks"),
            content: String::from(
                "of course, as you probably already know, people",
            ),
            reply: false,
            retweet: false,
        };

        println!("1 new tweet: {}", tweet.summarize());
        println!("{}",tweet.metodo_default());
        notify(&tweet);
}

fn print_type<T: fmt::Display>(item: T) {
    println!("{} is {}", item, any::type_name::<T>());
}

fn ejemplo_trait_bounds() {
    print_type(13);
    print_type(13.0);
    print_type("thirteen");
}

fn ejemplo_borrow_checker () {
    let variable1;
    {
        let variable2 = String::from ("paradigmas");
        variable1 = &variable2;
        println!("{variable1}");
    }
}

fn best_name<'a,'b>(x: &'a str, y: &'b str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        x
    }
}

fn ejemplo_lifetimes_annotation(){
    let result;
    let name1 = String::from("Pablo");
    {
        let name2 = String::from("Juan");
        result = best_name(&name1, &name2);
    }
    println!("result is {}", result);
}

struct Terminal<'a> {
    name: &'a str
}

impl<'a, 'b> Terminal<'a> {
    fn send_message(&'a self, msg: &'b str) -> &'b str {
        println!("Sending message: {}", msg);
        msg
    }
}

fn ejemplo_life_times_struct() {
    let terminal = Terminal {
        name: "Terminal 1"
    };

    let message = terminal.send_message("Mensaje 1");
    println!("El mensaje es {}", message);
}

fn main() {
    generics_metodos_ejemplo();
    //generics_funciones_ejemplo();
    // ejemplo_generics();
    //ejemplo_traits ();
    //ejemplo_trait_bounds();
    //ejemplo_borrow_checker();
    //ejemplo_lifetimes_annotation();
    //ejemplo_life_times_struct();
}
