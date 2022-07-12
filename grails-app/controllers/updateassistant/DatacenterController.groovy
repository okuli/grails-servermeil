package updateassistant

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class DatacenterController {

    DatacenterService datacenterService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond datacenterService.list(params), model:[datacenterCount: datacenterService.count()]
    }

    def show(Long id) {
        respond datacenterService.get(id)
    }

    def create() {
        respond new Datacenter(params)
    }

    def save(Datacenter datacenter) {
        if (datacenter == null) {
            notFound()
            return
        }

        try {
            datacenterService.save(datacenter)
        } catch (ValidationException e) {
            respond datacenter.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'datacenter.label', default: 'Datacenter'), datacenter.id])
                redirect datacenter
            }
            '*' { respond datacenter, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond datacenterService.get(id)
    }

    def update(Datacenter datacenter) {
        if (datacenter == null) {
            notFound()
            return
        }

        try {
            datacenterService.save(datacenter)
        } catch (ValidationException e) {
            respond datacenter.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'datacenter.label', default: 'Datacenter'), datacenter.id])
                redirect datacenter
            }
            '*'{ respond datacenter, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        datacenterService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'datacenter.label', default: 'Datacenter'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'datacenter.label', default: 'Datacenter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
