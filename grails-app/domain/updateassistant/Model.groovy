package updateassistant

class Model {

    String modeName
    Manufacturer manufacturer
    String updateURL
    String comment
    String ticketHowto
    String supportURL

    static constraints = {
        comment nullable: true
        supportURL nullable: true
        ticketHowto nullable: true
    }
}
