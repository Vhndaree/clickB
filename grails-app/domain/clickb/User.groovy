package clickb

class User {

    String name
    String email
    String password
    String contact
    String address
    String role

    static constraints = {
        name(size: 3..20, nullable: false)
        email(email: true, nullable: false, unique: true)
        password(nullable: false, minSize: 5)
        contact(minSize: 7, nullable: false)
        address(nullable: false)
        role(inList: ['ADMIN','USER','MANAGER'])
    }
}
