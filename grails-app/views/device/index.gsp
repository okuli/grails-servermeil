<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:set var="sortName" value="${request.getParameter("sort")}" />
        <g:set var="order" value="${request.getParameter("order")}" />
    </head>
    <body>
    <g:render template="/common/header" />
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-device" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-device" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                    <thead>
                        <tr>
                            <th class="sortable ${sortName == 'id' ? 'sorted':''} ${sortName == 'id' ? order : ''}"><a href="/device/index?sort=id&amp;max=10&amp;order=${order == 'asc' ? 'desc':'asc'}">ID</a></th>
                            <th class="sortable">Customer</th>
                            <th class="sortable">Manufacturer</th>
                            <th class="sortable">Model</th>
                            <th class="sortable">Type of Device</th>
                            <th class="sortable">Location</th>
                            <th class="sortable">OS Version</th>
                            <th class="sortable">Installed OS Version</th>
                            <th class="sortable">P Contact</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="device" status="i" in="${deviceList}">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td><g:link action="show" id="${device.id}">${device.id}</g:link></td>
                                <td><g:link action="show" controller="customer" id="${device.customer.id}">${device.customer.name}</g:link></td>
                                <td><g:link action="show" controller="manufacturer" id="${device.manufacturer.id}">${device.manufacturer.name}</g:link></td>
                                <td>${device.model != null? device.model.modeName : ''}</td>
                                <td><g:link action="show" controller="types" id="${device.typeOfDevice.id}">${device.typeOfDevice.name}</g:link></td>
                                <td><g:link action="show" controller="location" id="${device.location.id}">${device.location.rackName}</g:link></td>
                                <td>${device.operatingSystem.name}</td>
                                <td>${device.installedOSVersion}</td>
                                <td><g:link action="show" controller="contact" id="${device.pContact.id}">${device.pContact.firstname}/${device.pContact.lastname}</g:link></td>
                                <td><g:link action="edit" id="${device.id}"><g:img dir="images" file="/skin/database_edit.png" /></g:link></td>
                            </tr>
                        </g:each>
                    </tbody>
                    </table>
                    <g:if test="${deviceCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${deviceCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>