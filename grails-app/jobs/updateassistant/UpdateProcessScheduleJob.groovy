package updateassistant

import java.text.SimpleDateFormat

class UpdateProcessScheduleJob {
    static triggers = {
        cron name: 'emailTriggerJob', cronExpression: "0 0 1 * * ?" //Every Day 1 am midnight
    }

    def mailService
    UpdateProcessService updateProcessService

    def execute() {
        println 'Job Process Start!'

        def date = new Date()
        def sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")

        List<UpdateProcess> updateProcessList = updateProcessService.list(null)
        for(UpdateProcess process: updateProcessList)
        {
            def difference = date.getTime() - process.getUpdateDate().getTime()
            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(difference)
            def monthDiff = cal.get(Calendar.MONTH)
            if(monthDiff > 3)
            {
                sendEmail(process.getContact().firstname + " " + process.getContact().lastname, process.getContact().getEmailadress())
            }
        }
    }

    def sendEmail(name, email) {
        println 'Email Process Start'
        mailService.sendMail {
            to email
            from 'Your Sender Email Add'
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
