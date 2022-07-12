package updateassistant

import grails.gorm.services.Service

@Service(Manufacturer)
interface ManufacturerService {

    Manufacturer get(Serializable id)

    List<Manufacturer> list(Map args)

    Long count()

    void delete(Serializable id)

    Manufacturer save(Manufacturer manufacturer)

}