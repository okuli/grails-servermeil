<%@ page import="updateassistant.City"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#create-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="create-address" class="col-12 content scaffold-create" role="main">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.address}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.address}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.address}" method="POST">
                        <fieldset class="form">
                           <!-- <f:all bean="address"/> -->
                            <div class="fieldcontain required">
                                <label for="">Name<span class="required-indicator">*</span></label>
                                <input type="text" id="name" name="name" required="" placeholder="">
                            </div>
                            <div class="fieldcontain required">
                               <label for="">City<span class="required-indicator">*</span></label>
                               <select id="city" name="city.id" required="">
                                    <g:each var="city" in="${City.list()}">
                                        <option value="${city.id}">${city.name}</option>
                                    </g:each>
                               </select>
                            </div>

                            <div class="fieldcontain required">
                                <label for="">Street<span class="required-indicator">*</span></label>
                                <input type="text" id="street" name="street" required="" placeholder="">
                            </div>

                            <div class="fieldcontain required">
                                <label for="">Zipcode<span class="required-indicator">*</span></label>
                                <input type="text" id="zipcode" name="zipcode" required="" placeholder="">
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
