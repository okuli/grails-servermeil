package updateassistant

import grails.gorm.services.Service

@Service(Types)
interface TypesService {

    Types get(Serializable id)

    List<Types> list(Map args)

    Long count()

    void delete(Serializable id)

    Types save(Types types)

}