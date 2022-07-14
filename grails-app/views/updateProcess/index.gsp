<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'updateProcess.label', default: 'UpdateProcess')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template="/common/header" />
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-updateProcess" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-updateProcess" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                    <thead>
                        <tr>
                            <th class="sortable"><a href="/updateProcess/index?sort=currentversion&amp;max=10&amp;order=asc">Current Version</a></th>
                            <th class="sortable"><a href="/updateProcess/index?sort=lastversion&amp;max=10&amp;order=asc">Last Version</a></th>
                            <th class="sortable"><a href="/updateProcess/index?sort=checkdate&amp;max=10&amp;order=asc">Check Date</a></th>
                            <th class="sortable"><a href="/updateProcess/index?sort=updatedate&amp;max=10&amp;order=asc">Update Date</a></th>
                            <th class="sortable"><a href="/updateProcess/index?sort=updatesuccess&amp;max=10&amp;order=asc">Update Success</a></th>
                            <th class="sortable"><a href="/updateProcess/index?sort=device&amp;max=10&amp;order=asc">Device</a></th>
                            <th class="sortable"><a href="/updateProcess/index?sort=contact&amp;max=10&amp;order=asc">Contact</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="updateProcess" in="${updateProcessList}">
                            <tr>
                                <td><a href="/updateProcess/show/${updateProcess.id}">${updateProcess.currentVersion}</a></td>
                                <td>${updateProcess.lastVersion}</td>
                                <td>${updateProcess.checkDate}</td>
                                <td>${updateProcess.updateDate}</td>
                                <td>${updateProcess.updateSuccess}</td>
                                <td><a href="/device/show/${updateProcess.device.id}">${updateProcess.device.serialnumber}</a></td>
                                <td><a href="/contact/show/${updateProcess.contact.id}">${updateProcess.contact.firstname}</a></td>
                            </tr>
                        </g:each>
                    </tbody>
                    </table>
                    <g:if test="${updateProcessCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${updateProcessCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>