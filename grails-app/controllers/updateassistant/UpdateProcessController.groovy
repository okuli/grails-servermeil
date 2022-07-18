package updateassistant

import grails.validation.ValidationException

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

class UpdateProcessController {

    UpdateProcessService updateProcessService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def deviceId = params.deviceId
        List<UpdateProcess> updateProcessList = updateProcessService.list(params)
        if (deviceId != null && deviceId != '0')
        {
            updateProcessList = updateProcessList.findAll(it -> "'" + it.device.id + "'" == "'" + deviceId + "'")
        }
        def date = new Date()

        for(UpdateProcess process: updateProcessList)
        {
            def difference = date.getTime() - process.getUpdateDate().getTime()
            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(difference)
            def monthDiff = cal.get(Calendar.MONTH)
            if(monthDiff > 3 && !process.updateSuccess)
            {
                process.setIsNotUpdated(true)
            }
        }
        respond updateProcessList, model:[updateProcessCount: updateProcessService.count()]
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
        if(updateProcess.getUpdateSuccess()){
            def name = updateProcess.getContact().getFirstname() + " " + updateProcess.getContact().getLastname()
            def email = updateProcess.getContact().getEmailadress()
            sendEmail(name, email)
        }
        try {
            updateProcessService.save(updateProcess)
        } catch (ValidationException e) {
            respond updateProcess.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'updateProcess.label', default: 'UpdateProcess'), updateProcess.id])
                redirect updateProcess
            }
            '*'{ respond updateProcess, [status: OK] }
        }
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
    def getUpdateProcessList() {
        def deviceId = params.deviceId
        if (deviceId == '0') {
            respond updateProcessService.list(params)
        } else {
            def updateProcessList = UpdateProcess.list(params);
            updateProcessList = updateProcessList.findAll(it -> "'" + it.device.id + "'" == "'" + deviceId + "'")
            respond updateProcessList
        }
    }

    def sendEmail(name, email) {
        println 'Email Process Start'
        mailService.sendMail {
            to email
            from 'Sender Email Address'
            subject "Update Process Notification"
            body 'Hi ,' + name +' \n' +
                    '\n' +
                    'You havent update your process for the past 3 months. You are invited to update your process.\n' +
                    '\n' +
                    'Let us know if you run into a problem.\n' +
                    '\n' +
                    'Best,\n' +
                    '\n' +
                    'Team\n'
        }
        println 'Email Process End'
    }
}
