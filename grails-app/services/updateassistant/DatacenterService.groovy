package updateassistant

import grails.gorm.services.Service

@Service(Datacenter)
interface DatacenterService {

    Datacenter get(Serializable id)

    List<Datacenter> list(Map args)

    Long count()

    void delete(Serializable id)

    Datacenter save(Datacenter datacenter)

}