package servermeile

class ServermeileController {

    def index() {
        render "Here is a list of Products"
    }

    def edit(){
        def productName = "Breakfast Blend"
        def sku = "BB01"
        [product : productName, sku: sku]
    }

    def remove(){
        render"The product was removed."
    }

    def list(){
        def allProducts = Product.list()
        [allProducts: allProducts]
    }

    }
