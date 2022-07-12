package updateassistant

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UpdateProcessController {

    UpdateProcessService updateProcessService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond updateProcessService.list(params), model:[updateProcessCount: updateProcessService.count()]
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
}
