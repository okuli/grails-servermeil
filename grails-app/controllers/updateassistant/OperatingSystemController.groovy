package updateassistant

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class OperatingSystemController {

    OperatingSystemService operatingSystemService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond operatingSystemService.list(params), model:[operatingSystemCount: operatingSystemService.count()]
    }

    def show(Long id) {
        respond operatingSystemService.get(id)
    }

    def create() {
        respond new OperatingSystem(params)
    }

    def save(OperatingSystem operatingSystem) {
        if (operatingSystem == null) {
            notFound()
            return
        }

        try {
            operatingSystemService.save(operatingSystem)
        } catch (ValidationException e) {
            respond operatingSystem.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'operatingSystem.label', default: 'OperatingSystem'), operatingSystem.id])
                redirect operatingSystem
            }
            '*' { respond operatingSystem, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond operatingSystemService.get(id)
    }

    def update(OperatingSystem operatingSystem) {
        if (operatingSystem == null) {
            notFound()
            return
        }

        try {
            operatingSystemService.save(operatingSystem)
        } catch (ValidationException e) {
            respond operatingSystem.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'operatingSystem.label', default: 'OperatingSystem'), operatingSystem.id])
                redirect operatingSystem
            }
            '*'{ respond operatingSystem, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        operatingSystemService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'operatingSystem.label', default: 'OperatingSystem'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'operatingSystem.label', default: 'OperatingSystem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
