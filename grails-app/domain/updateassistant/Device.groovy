package updateassistant

class Device {

    Customer customer
    Location location
    Types typeOfDevice
    Manufacturer manufacturer
    OperatingSystem operatingSystem
    String OSVersion
    String installedOSVersion
    String serialnumber
    Contact pContact
    Contact sContact
    Model model
    static hasMany =[updateProcesses: UpdateProcess]

    static constraints = {
        model nullable: true
        installedOSVersion nullable: true
    }
}
