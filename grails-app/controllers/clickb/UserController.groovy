package clickb

import grails.plugin.mail.MailService

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def login(){
        String email=params.email
        String password=params.password
        User user= User.findByEmailAndPassword(email,password)
        if(user){
            session.user=user
            forward(action: 'dashboard')

        } else {
            forward(action: 'landing')
        }
    }

    def logout(){
        session.invalidate()
        forward(action: 'landing')
    }

    def dashboard(){

    }

    def landing(){
        def latestProduct=Product.createCriteria()
        def latest = latestProduct.list{
            order("addedDate","desc")
            maxResults 3
        }
        render(view: '../landing', model: [latestProduct: latest])
    }

    def invalidateSession(){
        session.invalidate()

        forward(action: 'landing')
    }
    def mailService
    def mailSend() {

        def total
        String message=""
        Map<Integer, Integer> cart = session.cartMap


        for (Integer key : cart.keySet()){
            def product=Product.get(key);
            if(product.discount==0){
                total=product.price*cart.get(key)
            } else {
                total=(product.price-(product.price*product.discount/100))*cart.get(key)
            }

            message+="<tr><td>"+product.productName+"</td><td>"+cart.get(key)+"</td><td>"+total+"</td></tr>"

        }
        mailService.sendMail {
            to "ramjdbhandari51@gmail.com"
            subject "New order"
            html "<table>" +
                    "<tr><th>Product</th><th>quantity</th><th>Total</th></tr>"+message+
                  "</table>"

        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
