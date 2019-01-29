package clickb

import javax.servlet.http.HttpSession

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CartController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index() {
        render(view: '/cart/index', model: [cart : session.cartList])
    }

    def show() {
    }

    def addToCart(){

        def product=params.product
        def quantity=params.quantity
        Map cartMap=[:]
        if(!session.cartMap) {
            cartMap.put(product, quantity)
            session.cartMap = cartMap
        } else {
            cartMap = session.cartMap

            cartMap.put(product, quantity)
            session.cartMap = cartMap

        }
        forward(controller: 'user', action: 'landing')
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
