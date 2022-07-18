<%@ page import="updateassistant.Device"  %>
<%@ page import="updateassistant.Contact"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'updateProcess.label', default: 'UpdateProcess')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#edit-updateProcess" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="edit-updateProcess" class="col-12 content scaffold-edit" role="main">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.updateProcess}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.updateProcess}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.updateProcess}" method="PUT">
                        <g:hiddenField name="version" value="${this.updateProcess?.version}" />
                        <fieldset class="form">
                            <div class="fieldcontain required">
                               <label for="">Device<span class="required-indicator">*</span></label>
                               <select id="device" name="device" required="">
                                    <g:each var="device" in="${Device.list()}">
                                        <option value="${device.id}" <g:if test="${updateProcess.device.id == device.id}">selected="selected"</g:if> >${device.serialnumber}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                                <label for="">Installed Version<span class="required-indicator">*</span></label>
                                <input type="text" id="currentVersion" value="${updateProcess.currentVersion}" name="currentVersion" required="" placeholder="">
                            </div>
                            <div class="fieldcontain required">
                                <label for="">Checked Version<span class="required-indicator">*</span></label>
                                <input type="text" id="lastVersion" value="${updateProcess.lastVersion}" name="lastVersion" required="" placeholder="">
                            </div>

                            <div class="fieldcontain required">
                                 <label for="">Check Date<span class="required-indicator">*</span></label>
                                 <g:datePicker name="checkDate" precision="day" value="${updateProcess.checkDate}" />
                            </div>
                            <div class="fieldcontain required">
                                 <label for="">Update Date<span class="required-indicator">*</span></label>
                                 <g:datePicker name="updateDate" precision="day" value="${new Date()}" />
                            </div>
                            <div class="fieldcontain">
                                <label for="">Update Success</label>
                                <g:checkBox name="updateSuccess" value="${updateProcess.updateSuccess}" />
                            </div>
                            <div class="fieldcontain required">
                               <label for="">Contact<span class="required-indicator">*</span></label>
                               <select id="contact" name="contact" required="">
                                    <g:each var="contact" in="${Contact.list()}">
                                        <option value="${contact.id}" <g:if test="${updateProcess.contact.id == contact.id}">selected="selected"</g:if> >${contact.firstname}/${contact.lastname}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                                <label for="">Comment</label>
                                <g:textArea name="comment" id="comment" value="${updateProcess.comment}" rows="10" cols="40"/>
                            </div>
                        </fieldset>
                        <fieldset class="buttons">
                            <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
