<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
                            <th class="sortable"><a href="/device/index?sort=manufacturer&amp;max=10&amp;order=asc">Manufacturer</a></th>
                            <th class="sortable"><a href="/device/index?sort=typeofdevice&amp;max=10&amp;order=asc">Type of Device</a></th>
                            <th class="sortable"><a href="/device/index?sort=pcontact&amp;max=10&amp;order=asc">P Contact</a></th>
                            <th class="sortable"><a href="/device/index?sort=location&amp;max=10&amp;order=asc">Location</a></th>
                            <th class="sortable"><a href="/device/index?sort=serialnumber&amp;max=10&amp;order=asc">Serial Number</a></th>
                            <th class="sortable"><a href="/device/index?sort=osversion&amp;max=10&amp;order=asc">OS Version</a></th>
                            <th class="sortable"><a href="/device/index?sort=customer&amp;max=10&amp;order=asc">Customer</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="device" in="${deviceList}">
                            <tr>
                                <td><a href="/manufacturer/show/${device.manufacturer.id}">${device.manufacturer.name}</a></td>
                                <td><a href="/types/show/${device.typeOfDevice.id}">${device.typeOfDevice.name}</a></td>
                                <td><a href="/contact/show/${device.pContact.id}">${device.pContact.firstname}</a></td>
                                <td><a href="/location/show/${device.location.id}">${device.location.rackName}</a></td>
                                <td><a href="/device/show/${device.id}">${device.serialnumber}</a></td>
                                <td>${device.OSVersion}</td>
                                <td><a href="/customer/show/${device.customer.id}">${device.customer.name}</a></td>
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