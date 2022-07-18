package updateassistant

class Model {

    String modeName
    Manufacturer manufacturer
    String updateURL
    String comment
    static constraints = {
        comment nullable: true
    }
}
