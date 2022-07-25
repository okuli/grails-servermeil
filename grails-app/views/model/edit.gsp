<%@ page import="updateassistant.Manufacturer"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'model.label', default: 'Model')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#edit-model" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="edit-model" class="col-12 content scaffold-edit" role="main">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.model}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.model}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.model}" method="PUT">
                        <g:hiddenField name="version" value="${this.model?.version}" />
                        <fieldset class="form">
                            <div class="fieldcontain required">
                               <label for="">Manufacturer<span class="required-indicator">*</span></label>
                               <select id="manufacturer" name="manufacturer" required="">
                                    <g:each var="manufacturer" in="${Manufacturer.list()}">
                                        <option value="${manufacturer.id}" <g:if test="${model.manufacturer.id == manufacturer.id}">selected="selected"</g:if> >${manufacturer.name}</option>
                                    </g:each>
                               </select>
                            </div>

                            <div class="fieldcontain required">
                                <label for="">Mode Name<span class="required-indicator">*</span></label>
                                <input type="text" id="modeName" value="${model.modeName}" name="modeName" required="" placeholder="">
                            </div>

                            <div class="fieldcontain required">
                                <label for="">Update URL<span class="required-indicator">*</span></label>
                                <input type="text" id="updateURL" value="${model.updateURL}" name="updateURL" required="" placeholder="">
                            </div>
                            <div class="fieldcontain required">
                                <label for="">Support URL<span class="required-indicator">*</span></label>
                                <input type="text" id="supportURL" name="supportURL" value="${supportURL}" required="" placeholder="">
                            </div>

                            <div class="fieldcontain required">
                                <label for="">TicketHowto<span class="required-indicator">*</span></label>
                                <input type="text" id="ticketHowto" name="ticketHowto" value="${ticketHowto}"  required="" placeholder="">
                            </div>
                            <div class="fieldcontain required">
                                <label for="">Comment</label>
                                <g:textArea name="comment" id="comment" value="${model.comment}" rows="10" cols="40"/>
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
