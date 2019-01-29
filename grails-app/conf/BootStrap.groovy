import clickb.Product
import clickb.User
import clickb.Category

class BootStrap {

    def init = { servletContext ->
       if(User.getAll()==null) {
           new User(name: "admin", email: "admin@gmail.com", role: "ADMIN", password: "admin", address: "Naikap", contact: "9843215478").save()
       }
    }
    def destroy = {
    }
}
