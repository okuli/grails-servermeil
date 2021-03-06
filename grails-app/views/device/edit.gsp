<%@ page import="updateassistant.Customer"  %>
<%@ page import="updateassistant.Location"  %>
<%@ page import="updateassistant.Types"  %>
<%@ page import="updateassistant.Manufacturer"  %>
<%@ page import="updateassistant.OperatingSystem"  %>
<%@ page import="updateassistant.Contact"  %>
<%@ page import="updateassistant.Model" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#edit-device" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="edit-device" class="col-12 content scaffold-edit" role="main">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.device}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.device}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                    </g:hasErrors>
                    <g:form resource="${this.device}" method="PUT">
                        <g:hiddenField name="version" value="${this.device?.version}" />
                        <fieldset class="form">
                            <div class="fieldcontain required">
                               <label for="">Customer<span class="required-indicator">*</span></label>
                               <select id="customer" name="customer" required="">
                                    <g:each var="customer" in="${Customer.list()}">
                                        <option value="${customer.id}" <g:if test="${device.customer.id == customer.id}">selected="selected"</g:if>>${customer.name}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                               <label for="">Manufacturer<span class="required-indicator">*</span></label>
                               <select id="manufacturer" name="manufacturer" required="">
                                    <g:each var="manufacturer" in="${Manufacturer.list()}">
                                        <option value="${manufacturer.id}" <g:if test="${device.manufacturer.id == manufacturer.id}">selected="selected"</g:if>>${manufacturer.name}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                               <label for="">Model<span class="required-indicator">*</span></label>
                               <select id="model" name="model" required="">
                                    <g:each var="model" in="${Model.list()}">
                                        <option value="${model.id}" <g:if test="${device.model != null && device.model.id == model.id}">selected="selected"</g:if>>${model.modeName}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                               <label for="">Types of Device<span class="required-indicator">*</span></label>
                               <select id="typeOfDevice" name="typeOfDevice" required="">
                                    <g:each var="types" in="${Types.list()}">
                                        <option value="${types.id}" <g:if test="${device.typeOfDevice.id == types.id}">selected="selected"</g:if>>${types.name}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                               <label for="">Location<span class="required-indicator">*</span></label>
                               <select id="location" name="location" required="">
                                    <g:each var="location" in="${Location.list()}">
                                        <option value="${location.id}" <g:if test="${device.location.id == location.id}">selected="selected"</g:if>>${location.rackName}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                               <label for="">Operating System<span class="required-indicator">*</span></label>
                               <select id="operatingSystem" name="operatingSystem" required="">
                                    <g:each var="operatingSystem" in="${OperatingSystem.list()}">
                                        <option value="${operatingSystem.id}" <g:if test="${device.operatingSystem.id == operatingSystem.id}">selected="selected"</g:if>>${operatingSystem.name}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                                <label for="">Installed OS Version<span class="required-indicator">*</span></label>
                                <input type="text" id="installedOSVersion" name="installedOSVersion" value="${device.installedOSVersion}" required="" placeholder="">
                            </div>
                            <div class="fieldcontain required">
                               <label for="">P Contact<span class="required-indicator">*</span></label>
                               <select id="pContact" name="pContact" required="">
                                    <g:each var="contact" in="${Contact.list()}">
                                        <option value="${contact.id}" <g:if test="${device.pContact.id == contact.id}">selected="selected"</g:if>>${contact.firstname}/${contact.lastname}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                               <label for="">S Contact<span class="required-indicator">*</span></label>
                               <select id="sContact" name="sContact" required="">
                                    <g:each var="contact" in="${Contact.list()}">
                                        <option value="${contact.id}" <g:if test="${device.sContact.id == contact.id}">selected="selected"</g:if>>${contact.firstname}/${contact.lastname}</option>
                                    </g:each>
                               </select>
                            </div>
                            <div class="fieldcontain required">
                                <label for="">Serial Number<span class="required-indicator">*</span></label>
                                <input type="text" id="serialnumber" value="${device.serialnumber}" name="serialnumber" required="" placeholder="">
                            </div>

                            <div class="fieldcontain required">
                                <label for="">Update Processes<span class="required-indicator">*</span></label>
                                <g:link action="create" controller="updateProcess" params="${[deviceId:device.id]}">Add UpdateProcess</g:link>
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
