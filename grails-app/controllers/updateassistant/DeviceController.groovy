package updateassistant

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class DeviceController {

    DeviceService deviceService
    UpdateProcessService updateProcessService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        List<Device> deviceList = deviceService.list(params)

        for(Device device : deviceList)
        {
            def processList = UpdateProcess.createCriteria()
            println "ProcessList : " + processList
            UpdateProcess process = processList.get {
                and {
                    eq("device", device)
                    eq("updateSuccess", true)
                }
                maxResults(1)
                and{
                    order("updateDate", "desc")
                    order("id", "desc")
                }
            }
            println "Process Final : " + process
            if(process != null) {
                device.setInstalledOSVersion(process.getLastVersion())
            }
        }

        respond deviceList, model:[deviceCount: deviceService.count()]
    }

    def show(Long id) {
        def device = deviceService.get(id)
        def processList = UpdateProcess.createCriteria()
        UpdateProcess process = processList.get {
            and {
                eq("device", device)
                eq("updateSuccess", true)
            }
            maxResults(1)
            order("id", "desc")
        }
        if(process != null) {
            device.setInstalledOSVersion(process.getLastVersion())
        }

        respond device
    }

    def create() {
        respond new Device(params)
    }

    def save(Device device) {
        if (device == null) {
            notFound()
            return
        }

        try {
            deviceService.save(device)
        } catch (ValidationException e) {
            respond device.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'device.label', default: 'Device'), device.id])
                redirect device
            }
            '*' { respond device, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond deviceService.get(id)
    }

    def update(Device device) {
        if (device == null) {
            notFound()
            return
        }

        try {
            deviceService.save(device)
        } catch (ValidationException e) {
            respond device.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'device.label', default: 'Device'), device.id])
                redirect device
            }
            '*'{ respond device, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        deviceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'device.label', default: 'Device'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'device.label', default: 'Device'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
