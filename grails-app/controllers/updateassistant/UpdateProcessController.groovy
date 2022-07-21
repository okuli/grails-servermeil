package updateassistant

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*

class UpdateProcessController {

    UpdateProcessService updateProcessService
    DeviceService deviceService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def deviceId = params.deviceId
        List<UpdateProcess> updateProcessList = updateProcessService.list(params)
        if (deviceId != null && deviceId != '0')
        {
            def device = deviceService.get(deviceId)
            def processList = UpdateProcess.createCriteria()
            updateProcessList = processList.list {
                and {
                    eq("device", device)
                }
            }
        }
        def date = new Date()

        for(UpdateProcess process: updateProcessList)
        {
            def days = daysBetween(process.getUpdateDate(), date)
            if(days > 92 && !process.updateSuccess)
            {
                process.setIsNotUpdated(true)
            }
        }
        respond updateProcessList, model:[updateProcessCount: updateProcessService.count()]
    }

    static def daysBetween(def startDate, def endDate) {
        use(groovy.time.TimeCategory) {
            def duration = endDate - startDate
            return duration.days
        }
    }

    def show(Long id) {
        respond updateProcessService.get(id)
    }

    def create() {
        respond new UpdateProcess(params)
    }

    def save(UpdateProcess updateProcess) {
        if (updateProcess == null) {
            notFound()
            return
        }

        try {
            updateProcessService.save(updateProcess)
        } catch (ValidationException e) {
            respond updateProcess.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'updateProcess.label', default: 'UpdateProcess'), updateProcess.id])
                redirect updateProcess
            }
            '*' { respond updateProcess, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond updateProcessService.get(id)
    }

    def update(UpdateProcess updateProcess) {
        if (updateProcess == null) {
            notFound()
            return
        }

        try {
            if(updateProcess.getUpdateSuccess()) {
                sendEmail(updateProcess)
            }
            try {
                updateProcessService.save(updateProcess)
                if(updateProcess.getUpdateSuccess()) {
                    flash.message = "The email was sent"
                } else {
                    flash.message = "UpdateProcess record update successfully"
                }
            } catch (ValidationException e) {
                respond updateProcess.errors, view:'edit'
                return
            }
        } catch(Exception e){
            println 'Exception : ' + e.message
            flash.error = 'The email could not be send'
        }
        redirect action: "show", id: params.id, method:"PUT"
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        updateProcessService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'updateProcess.label', default: 'UpdateProcess'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'updateProcess.label', default: 'UpdateProcess'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def mailService
    def sendEmail(UpdateProcess updateProcess) {
        try {
            def email = updateProcess.getContact().getEmailadress()
            def name = updateProcess.getContact().getFirstname() + " " + updateProcess.getContact().getLastname()
            def emailCC = updateProcess.getDevice().getsContact().getEmailadress()
            def device = updateProcess.getDevice().getInstalledOSVersion()
            def model = ''
            if(updateProcess.getDevice().getModel() != null)
                model = updateProcess.getDevice().getModel().getModeName() != null ? updateProcess.getDevice().getModel().getModeName() : ''

            def location = updateProcess.getDevice().getLocation().getRackName()
            def datacenter = updateProcess.getDevice().getLocation().getDc().getName()
            println 'Email Process Start'
            mailService.sendMail {
                to email
                from 'test@test.com'
                cc emailCC, 'xyz@xyz.com'
                subject "Update Process Notification"
                body 'Hi ,' + name + ' \n' +
                        '\n' +
                        'The update process for the device ' + device + ' '+ model +' in ' + datacenter + ' ' + location + ' is successfully finished.\n' +
                        '\n' +
                        'If you have further questions, please contact xyz.\n' +
                        '\n' +
                        'Best,\n' +
                        '\n' +
                        'Team\n'
            }
            println 'Email Process End'
        } catch(Exception e)
        {
            throw e
        }
    }
}
