package updateassistant

class UpdateProcessScheduleJob {
    static triggers = {
        cron name: 'emailTriggerJob', cronExpression: "20 * * * * ?" //Every 20 second
        // cron name: 'emailTriggerJob', cronExpression: "0 0 1 * * ?" //Every Day 1 am midnight
    }

    def mailService
    UpdateProcessService updateProcessService

    def execute() {
        println 'Job Process Start!'

        def date = new Date()

        List<UpdateProcess> updateProcessList = updateProcessService.list(null)
        for(UpdateProcess process: updateProcessList)
        {
            def days = daysBetween(process.getUpdateDate(), date)
            if(days > 92 && !process.updateSuccess)
            {
                sendEmail(process)
            }
        }
    }

    static def daysBetween(def startDate, def endDate) {
        use(groovy.time.TimeCategory) {
            def duration = endDate - startDate
            return duration.days
        }
    }

    def sendEmail(UpdateProcess process) {
        println 'Email Process Start'
        def email = process.getDevice().getpContact().getEmailadress()
        def name = process.getDevice().getpContact().getFirstname() + ' ' + process.getDevice().getpContact().getLastname()
        def emailCC = process.getDevice().getsContact().getEmailadress()
        def device = process.getDevice().getInstalledOSVersion()
        def model = ''
        if(process.getDevice().getModel() != null)
            model = process.getDevice().getModel().getModeName() != null ? process.getDevice().getModel().getModeName() : ''

        def location = process.getDevice().getLocation().getRackName()
        def datacenter = process.getDevice().getLocation().getDc().getName()
        mailService.sendMail {
            to email
            from 'test@test.com'
            cc emailCC, 'xyz@xyz.com'
            subject "Update Process Notification"
            body 'Hi ,' + name +' \n' +
                    '\n' +
                    'The last update Process for the device ' + device + ' ' + model + ' in ' + datacenter + ' ' + location + ' is more than 3 month ago.\n' +
                    '\n' +
                    'Please check if there are updates available.\n' +
                    '\n' +
                    'If you have further questions, please contact XYZ Person\n' +
                    '\n' +
                    'Best,\n' +
                    '\n' +
                    'Team\n'
        }
        println 'Email Process End'
    }
}
