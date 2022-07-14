package updateassistant

class UpdateProcess {

    Device device
    Contact contact
    Date checkDate
    Date updateDate
    String lastVersion
    String currentVersion
    Boolean updateSuccess = Boolean.FALSE

    static constraints = {
    }
}
