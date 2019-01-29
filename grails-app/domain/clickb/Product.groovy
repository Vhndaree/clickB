package clickb

class Product {

    String productName
    Category category
    String company
    double price
    double discount
    String image
    float stock
    String detail
    String addedDate
    static constraints = {
        productName(nullable: false)
        category()
        company(nullable: true)
        price(nullable: true)
        discount(nullable: true)
        stock(nullable: false)
        image(nullable: true)
        detail(nullable: true)
        addedDate(nullable: true)
    }
}
