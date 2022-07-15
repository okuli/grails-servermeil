<%@ page import="updateassistant.Device"  %>
<%@ page import="updateassistant.Contact"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'updateProcess.label', default: 'UpdateProcess')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#create-updateProcess" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="create-updateProcess" class="col-12 content scaffold-create" role="main">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
                    <g:form resource="${this.updateProcess}" method="POST">
                        <fieldset class="form">
                            <div class="fieldcontain required">
                                <label for="">Current Version<span class="required-indicator">*</span></label>
                                <input type="text" id="currentVersion" name="currentVersion" required="" placeholder="">
                            </div>
                            <div class="fieldcontain required">
                                <label for="">Last Version<span class="required-indicator">*</span></label>
                                <input type="text" id="lastVersion" name="lastVersion" required="" placeholder="">
                            </div>
                            <div class="fieldcontain required">
                               <label for="">Device<span class="required-indicator">*</span></label>
                               <select id="device" name="device" required="">
                                    <g:each var="device" in="${Device.list()}">
                                        <option value="${device.id}">${device.serialnumber}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                                 <label for="">Check Date<span class="required-indicator">*</span></label>
                                 <g:datePicker name="checkDate" precision="day" value="${new Date()}" />
                            </div>
                            <div class="fieldcontain">
                                <label for="">Update Success</label>
                                <g:checkBox name="updateSuccess" value="${updateProcess.updateSuccess}" />
                            </div>
                            <div class="fieldcontain required">
                               <label for="">Contact<span class="required-indicator">*</span></label>
                               <select id="contact" name="contact" required="">
                                    <g:each var="contact" in="${Contact.list()}">
                                        <option value="${contact.id}">${contact.firstname}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                                 <label for="">Update Date<span class="required-indicator">*</span></label>
                                 <g:datePicker name="updateDate" precision="day" value="${new Date()}" />
                            </div>
                        </fieldset>
                        <fieldset class="buttons">
                            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
