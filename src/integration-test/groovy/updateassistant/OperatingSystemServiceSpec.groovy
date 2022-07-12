package updateassistant

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class OperatingSystemServiceSpec extends Specification {

    OperatingSystemService operatingSystemService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new OperatingSystem(...).save(flush: true, failOnError: true)
        //new OperatingSystem(...).save(flush: true, failOnError: true)
        //OperatingSystem operatingSystem = new OperatingSystem(...).save(flush: true, failOnError: true)
        //new OperatingSystem(...).save(flush: true, failOnError: true)
        //new OperatingSystem(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //operatingSystem.id
    }

    void "test get"() {
        setupData()

        expect:
        operatingSystemService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<OperatingSystem> operatingSystemList = operatingSystemService.list(max: 2, offset: 2)

        then:
        operatingSystemList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        operatingSystemService.count() == 5
    }

    void "test delete"() {
        Long operatingSystemId = setupData()

        expect:
        operatingSystemService.count() == 5

        when:
        operatingSystemService.delete(operatingSystemId)
        sessionFactory.currentSession.flush()

        then:
        operatingSystemService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        OperatingSystem operatingSystem = new OperatingSystem()
        operatingSystemService.save(operatingSystem)

        then:
        operatingSystem.id != null
    }
}
