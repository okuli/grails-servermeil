package updateassistant

import grails.gorm.services.Service

@Service(OperatingSystem)
interface OperatingSystemService {

    OperatingSystem get(Serializable id)

    List<OperatingSystem> list(Map args)

    Long count()

    void delete(Serializable id)

    OperatingSystem save(OperatingSystem operatingSystem)

}