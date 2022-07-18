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
                                <td><a href="/device/show/${device.id}">${device.id}</a></td>
                                <td><a href="/customer/show/${device.customer.id}">${device.customer.name}</a></td>
                                <td><a href="/manufacturer/show/${device.manufacturer.id}">${device.manufacturer.name}</a></td>
                                <td>${device.model != null? device.model.modeName : ''}</td>
                                <td><a href="/types/show/${device.typeOfDevice.id}">${device.typeOfDevice.name}</a></td>
                                <td><a href="/location/show/${device.location.id}">${device.location.rackName}</a></td>
                                <td>${device.OSVersion}</td>
                                <td>${device.installedOSVersion}</td>
                                <td><a href="/contact/show/${device.pContact.id}">${device.pContact.firstname}/${device.pContact.lastname}</a></td>
                                <td><a href="/device/edit/${device.id}"><g:img dir="images" file="/skin/database_edit.png" /></a></td>
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