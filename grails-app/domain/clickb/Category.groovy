package clickb

class Category {
    String categoryName
    String description

    static constraints = {
        categoryName(nullable: false)
        description(nullable: true)
    }

    String toString(){
        return categoryName
    }

}
