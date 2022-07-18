package updateassistant

class UpdateProcess {

    Device device
    Contact contact
    Date checkDate
    Date updateDate
    String lastVersion
    String currentVersion
    String comment
    Boolean updateSuccess = Boolean.FALSE
    Boolean isNotUpdated = Boolean.FALSE

    static transients = ['isNotUpdated']

    static constraints = {
        comment nullable: true
    }
}
