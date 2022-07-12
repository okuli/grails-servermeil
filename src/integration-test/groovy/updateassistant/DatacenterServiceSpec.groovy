package updateassistant

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class DatacenterServiceSpec extends Specification {

    DatacenterService datacenterService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Datacenter(...).save(flush: true, failOnError: true)
        //new Datacenter(...).save(flush: true, failOnError: true)
        //Datacenter datacenter = new Datacenter(...).save(flush: true, failOnError: true)
        //new Datacenter(...).save(flush: true, failOnError: true)
        //new Datacenter(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //datacenter.id
    }

    void "test get"() {
        setupData()

        expect:
        datacenterService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Datacenter> datacenterList = datacenterService.list(max: 2, offset: 2)

        then:
        datacenterList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        datacenterService.count() == 5
    }

    void "test delete"() {
        Long datacenterId = setupData()

        expect:
        datacenterService.count() == 5

        when:
        datacenterService.delete(datacenterId)
        sessionFactory.currentSession.flush()

        then:
        datacenterService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Datacenter datacenter = new Datacenter()
        datacenterService.save(datacenter)

        then:
        datacenter.id != null
    }
}
