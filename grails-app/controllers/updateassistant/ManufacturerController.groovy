package updateassistant

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ManufacturerController {

    ManufacturerService manufacturerService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond manufacturerService.list(params), model:[manufacturerCount: manufacturerService.count()]
    }

    def show(Long id) {
        respond manufacturerService.get(id)
    }

    def create() {
        respond new Manufacturer(params)
    }

    def save(Manufacturer manufacturer) {
        if (manufacturer == null) {
            notFound()
            return
        }

        try {
            manufacturerService.save(manufacturer)
        } catch (ValidationException e) {
            respond manufacturer.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), manufacturer.id])
                redirect manufacturer
            }
            '*' { respond manufacturer, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond manufacturerService.get(id)
    }

    def update(Manufacturer manufacturer) {
        if (manufacturer == null) {
            notFound()
            return
        }

        try {
            manufacturerService.save(manufacturer)
        } catch (ValidationException e) {
            respond manufacturer.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), manufacturer.id])
                redirect manufacturer
            }
            '*'{ respond manufacturer, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        manufacturerService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'manufacturer.label', default: 'Manufacturer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
