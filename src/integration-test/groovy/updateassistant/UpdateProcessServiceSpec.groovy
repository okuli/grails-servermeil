package updateassistant

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class UpdateProcessServiceSpec extends Specification {

    UpdateProcessService updateProcessService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new UpdateProcess(...).save(flush: true, failOnError: true)
        //new UpdateProcess(...).save(flush: true, failOnError: true)
        //UpdateProcess updateProcess = new UpdateProcess(...).save(flush: true, failOnError: true)
        //new UpdateProcess(...).save(flush: true, failOnError: true)
        //new UpdateProcess(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //updateProcess.id
    }

    void "test get"() {
        setupData()

        expect:
        updateProcessService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<UpdateProcess> updateProcessList = updateProcessService.list(max: 2, offset: 2)

        then:
        updateProcessList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        updateProcessService.count() == 5
    }

    void "test delete"() {
        Long updateProcessId = setupData()

        expect:
        updateProcessService.count() == 5

        when:
        updateProcessService.delete(updateProcessId)
        sessionFactory.currentSession.flush()

        then:
        updateProcessService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        UpdateProcess updateProcess = new UpdateProcess()
        updateProcessService.save(updateProcess)

        then:
        updateProcess.id != null
    }
}
