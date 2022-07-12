package updateassistant

import grails.gorm.services.Service

@Service(UpdateProcess)
interface UpdateProcessService {

    UpdateProcess get(Serializable id)

    List<UpdateProcess> list(Map args)

    Long count()

    void delete(Serializable id)

    UpdateProcess save(UpdateProcess updateProcess)

}