package updateassistant

import grails.gorm.services.Service

@Service(Typ)
interface TypService {

    Typ get(Serializable id)

    List<Typ> list(Map args)

    Long count()

    void delete(Serializable id)

    Typ save(Typ typ)

}