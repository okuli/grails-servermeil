<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'updateProcess.label', default: 'UpdateProcess')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#show-updateProcess" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="show-updateProcess" class="col-12 content scaffold-show" role="main">
                    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                    </g:if>
                     <ol class="property-list address">
                           <li class="fieldcontain">
                                <span id="name-label" class="property-label">ID</span>
                                <div class="property-value" aria-labelledby="name-label">${updateProcess.id}</div>
                           </li>
                           <li class="fieldcontain">
                               <span id="name-label" class="property-label">Device Manufacturer</span>
                               <div class="property-value" aria-labelledby="name-label">${updateProcess.device.manufacturer.name}</div>
                           </li>
                           <li class="fieldcontain">
                               <span id="name-label" class="property-label">Device Model</span>
                               <div class="property-value" aria-labelledby="name-label">${updateProcess.device.model != null ? updateProcess.device.model.modeName: ''}</div>
                           </li>
                           <li class="fieldcontain">
                               <span id="name-label" class="property-label">Installed Version</span>
                               <div class="property-value" aria-labelledby="name-label">${updateProcess.currentVersion}</div>
                           </li>
                           <li class="fieldcontain">
                                <span id="name-label" class="property-label">Checked Version</span>
                                <div class="property-value" aria-labelledby="name-label">${updateProcess.lastVersion}</div>
                           </li>
                          <li class="fieldcontain">
                                <span id="name-label" class="property-label">Check Date</span>
                                <div class="property-value" aria-labelledby="name-label"><g:formatDate format="yyyy-MM-dd" date="${updateProcess.checkDate}" /></div>
                          </li>
                          <li class="fieldcontain">
                                  <span id="name-label" class="property-label">Update Date</span>
                                  <div class="property-value" aria-labelledby="name-label"><g:formatDate format="yyyy-MM-dd" date="${updateProcess.updateDate}" /></div>
                          </li>
                          <li class="fieldcontain">
                                 <span id="name-label" class="property-label">Update Success</span>
                                 <div class="property-value" aria-labelledby="name-label">${updateProcess.updateSuccess}</div>
                          </li>
                          <li class="fieldcontain">
                              <span id="name-label" class="property-label">Contact</span>
                              <div class="property-value" aria-labelledby="name-label">${updateProcess.contact.firstname}/${updateProcess.contact.lastname}</div>
                          </li>
                          <li class="fieldcontain">
                              <span id="name-label" class="property-label">Comment</span>
                              <div class="property-value" aria-labelledby="name-label">${updateProcess.comment}</div>
                          </li>
                     </ol>
                    <g:form resource="${this.updateProcess}" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="edit" action="edit" resource="${this.updateProcess}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
