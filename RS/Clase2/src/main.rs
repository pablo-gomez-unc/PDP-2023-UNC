#[derive(Debug)]
struct User {
    active: bool,
    username: String,
    email: String,
    sign_in_count: u64,
}

impl User {
    fn build_user(email: String, username: String) -> User {
        User {
            active: true,
            username: username,
            email: email,
            sign_in_count: 1,
        }
    }

    fn set_email (&mut self, email: String) {
        self.email = email;
    } 

    fn get_email (&self) -> &String {
        &self.email
    }
 }

fn main() {
    let mut user1 = User::build_user(String::from("otrouser@example.com"),String::from("otrouser123"));
    let user2 = User::build_user(String::from("otrouser@example.com"),String::from("otrouser123"));
    println!("{:?}", user1);
    println!("{:?}", user2);
    user1.set_email(String::from("otroemail@example.com"));
    println!("{:?}", user1);
    println!("{}", user1.get_email())
}