package updateassistant

class Device {

    Customer customer
    Location location
    Typ typeOfDevice
    Manufacturer manufacturer
    OperatingSystem operatingSystem
    String OSVersion
    String serialnumber
    Contact pContact
    Contact sContact
    static hasMany =[updateProcesses: UpdateProcess]

    static constraints = {
    }
}