package updateassistant

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class TypServiceSpec extends Specification {

    TypService typService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Typ(...).save(flush: true, failOnError: true)
        //new Typ(...).save(flush: true, failOnError: true)
        //Typ typ = new Typ(...).save(flush: true, failOnError: true)
        //new Typ(...).save(flush: true, failOnError: true)
        //new Typ(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //typ.id
    }

    void "test get"() {
        setupData()

        expect:
        typService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Typ> typList = typService.list(max: 2, offset: 2)

        then:
        typList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        typService.count() == 5
    }

    void "test delete"() {
        Long typId = setupData()

        expect:
        typService.count() == 5

        when:
        typService.delete(typId)
        sessionFactory.currentSession.flush()

        then:
        typService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Typ typ = new Typ()
        typService.save(typ)

        then:
        typ.id != null
    }
}
