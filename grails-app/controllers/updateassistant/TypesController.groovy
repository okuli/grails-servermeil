package updateassistant

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TypesController {

    TypesService typesService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond typesService.list(params), model:[typCount: typesService.count()]
    }

    def show(Long id) {
        respond typesService.get(id)
    }

    def create() {
        respond new Types(params)
    }

    def save(Types types) {
        if (types == null) {
            notFound()
            return
        }

        try {
            typesService.save(types)
        } catch (ValidationException e) {
            respond types.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'types.label', default: 'Types'), types.id])
                redirect types
            }
            '*' { respond types, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond typesService.get(id)
    }

    def update(Types types) {
        if (types == null) {
            notFound()
            return
        }

        try {
            typesService.save(types)
        } catch (ValidationException e) {
            respond types.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'types.label', default: 'Types'), types.id])
                redirect types
            }
            '*'{ respond types, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return

        typesService.delete(id)
    }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'types.label', default: 'Types'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'types.label', default: 'Types'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
