package clickb

import grails.converters.JSON
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProductController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Product.list(params), model:[productInstanceCount: Product.count()]
    }

    

    def show(Product productInstance) {
        respond productInstance
    }

    def create() {
        respond new Product(params)
    }

    @Transactional
    def save(Product productInstance) {
        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'create'
            return
        }

        String path="web-app/product/images/"
        MultipartHttpServletRequest mpr=(MultipartHttpServletRequest) request
        CommonsMultipartFile file=(CommonsMultipartFile) mpr.getFile("productImage")
        String filePath=file.getOriginalFilename().toString()
        filePath = new Date().toString()+"_"+filePath
        file.transferTo(new File(path+filePath))

        productInstance.image=filePath
        Date dateNow = new Date( )
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat ("yyyy.MM.dd_hh:mm:ss")
        productInstance.addedDate= simpleDateFormat.format(dateNow).toString()

        productInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*' { respond productInstance, [status: CREATED] }
        }
    }

    def edit(Product productInstance) {
        respond productInstance
    }

    @Transactional
    def update(Product productInstance) {
        if (productInstance == null) {
            notFound()
            return
        }

        if (productInstance.hasErrors()) {
            respond productInstance.errors, view:'edit'
            return
        }

        productInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect productInstance
            }
            '*'{ respond productInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Product productInstance) {

        if (productInstance == null) {
            notFound()
            return
        }

        productInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Product.label', default: 'Product'), productInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def searchResult(){
        def id = params.categoryId
        def category=Category.get(id)
        def product=params.productName

        def searchProduct=Product.createCriteria()
        def search = searchProduct.list{
            like("productName","%$product%")
            eq("category", category)
        }
        [searchResult: search]
    }

    def liveSearch(){
        def product=params.productName

        def searchProduct=Product.createCriteria()
        def search = searchProduct.list{
            like("productName","%$product%")
        }
        [search: search]
    }

    def productShow(int id){
        Product product=Product.get(id)
        [product: product]
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
