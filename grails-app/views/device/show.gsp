<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#show-device" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="show-device" class="col-12 content scaffold-show" role="main">
                    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                   <ol class="property-list address">
                        <li class="fieldcontain">
                           <span id="name-label" class="property-label">ID</span>
                           <div class="property-value" aria-labelledby="name-label">${device.id}</div>
                        </li>
                        <li class="fieldcontain">
                            <span id="name-label" class="property-label">Customer</span>
                            <div class="property-value" aria-labelledby="name-label">${device.customer.name}</div>
                        </li>
                       <li class="fieldcontain">
                           <span id="name-label" class="property-label">Manufacturer</span>
                           <div class="property-value" aria-labelledby="name-label">${device.manufacturer.name}</div>
                       </li>
                       <li class="fieldcontain">
                          <span id="name-label" class="property-label">Model</span>
                          <div class="property-value" aria-labelledby="name-label">${device.model != null ? device.model.modeName : ''}</div>
                       </li>
                       <li class="fieldcontain">
                           <span id="name-label" class="property-label">Type of Device</span>
                           <div class="property-value" aria-labelledby="name-label">${device.typeOfDevice.name}</div>
                       </li>
                       <li class="fieldcontain">
                            <span id="name-label" class="property-label">Location</span>
                            <div class="property-value" aria-labelledby="name-label">${device.location.rackName}</div>
                        </li>
                       <li class="fieldcontain">
                            <span id="name-label" class="property-label">OS Version</span>
                            <div class="property-value" aria-labelledby="name-label">${device.OSVersion}</div>
                         </li>
                       <li class="fieldcontain">
                             <span id="name-label" class="property-label">Installed OS Version</span>
                             <div class="property-value" aria-labelledby="name-label">${device.installedOSVersion}</div>
                          </li>
                       <li class="fieldcontain">
                         <span id="name-label" class="property-label">P Contact</span>
                         <div class="property-value" aria-labelledby="name-label">${device.pContact.firstname}/${device.pContact.lastname}</div>
                       </li>
                       <li class="fieldcontain">
                          <span id="name-label" class="property-label">S Contact</span>
                          <div class="property-value" aria-labelledby="name-label">${device.sContact.firstname}/${device.pContact.lastname}</div>
                        </li>
                       <li class="fieldcontain">
                            <span id="name-label" class="property-label">Serial Number</span>
                            <div class="property-value" aria-labelledby="name-label">${device.serialnumber}</div>
                       </li>
                       <li class="fieldcontain">
                           <span id="name-label" class="property-label">Operating System</span>
                           <div class="property-value" aria-labelledby="name-label">${device.operatingSystem.name}</div>
                       </li>
                   </ol>
                    <g:form resource="${this.device}" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="edit" action="edit" resource="${this.device}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
