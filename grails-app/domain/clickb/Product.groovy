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
    int views
    String imagePurpose
    static constraints = {
        productName(nullable: false)
        category()
        company(nullable: true)
        price(nullable: true)
        discount(nullable: true)
        stock(nullable: false)
        image(nullable: true)
        detail(type: 'longtext', nullable: true)
        addedDate(nullable: true)
        views(defaultValue: 0)
        imagePurpose(inList: ['Display', 'Carousel', 'Banner'])
    }
}
