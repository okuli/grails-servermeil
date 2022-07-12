package updateassistant

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TypController {

    TypService typService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond typService.list(params), model:[typCount: typService.count()]
    }

    def show(Long id) {
        respond typService.get(id)
    }

    def create() {
        respond new Typ(params)
    }

    def save(Typ typ) {
        if (typ == null) {
            notFound()
            return
        }

        try {
            typService.save(typ)
        } catch (ValidationException e) {
            respond typ.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'typ.label', default: 'Typ'), typ.id])
                redirect typ
            }
            '*' { respond typ, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond typService.get(id)
    }

    def update(Typ typ) {
        if (typ == null) {
            notFound()
            return
        }

        try {
            typService.save(typ)
        } catch (ValidationException e) {
            respond typ.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'typ.label', default: 'Typ'), typ.id])
                redirect typ
            }
            '*'{ respond typ, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        typService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'typ.label', default: 'Typ'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'typ.label', default: 'Typ'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
