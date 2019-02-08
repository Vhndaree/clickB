package clickb


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CartController {




    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index() {
        render(view: '/cart/index')
    }

    def show() {
    }

    def addToCart(){

        def product=params.product.toInteger()
        def quantity=params.quantity.toInteger()
        Map cartMap=new HashMap<Integer, Integer>()
        if(!session.cartMap) {
            cartMap.put(product, quantity)
            session.cartMap = cartMap
        } else {
            cartMap = session.cartMap

            cartMap.put(product, quantity)
            session.cartMap = cartMap

        }
//        render(session.cartMap)
        forward(controller: 'user', action: 'landing')
    }

    def removeFromCart(){

        Map cartMap=session.cartMap

        cartMap.remove(params.cartId)
        session.cartMap = cartMap

        index()
    }

    def checkout(){

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cart.label', default: 'Cart'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
