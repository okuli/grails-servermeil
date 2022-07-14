<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template="/common/header" />
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-location" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                        <thead>
                            <tr>
                                <th class="sortable"><a href="/location/index?sort=rackname&amp;max=10&amp;order=asc">Rack Name</a></th>
                                <th class="sortable"><a href="/location/index?sort=city&amp;max=10&amp;order=asc">Data Center</a></th>
                                <th class="sortable"><a href="/location/index?sort=street&amp;max=10&amp;order=asc">Rack Height</a></th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each var="location" in="${locationList}">
                                <tr>
                                    <td><a href="/location/show/${location.id}">${location.rackName}</a></td>
                                    <td><a href="/datacenter/show/${location.dc.id}">${location.dc.name}</a></td>
                                    <td>${location.rackHeight}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>

                    <g:if test="${locationCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${locationCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>