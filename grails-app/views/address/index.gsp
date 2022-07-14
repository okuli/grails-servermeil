<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template="/common/header" />
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-address" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                        <thead>
                            <tr>
                                <th class="sortable"><a href="/address/index?sort=name&amp;max=10&amp;order=asc">Name</a></th>
                                <th class="sortable"><a href="/address/index?sort=city&amp;max=10&amp;order=asc">City</a></th>
                                <th class="sortable"><a href="/address/index?sort=street&amp;max=10&amp;order=asc">Street</a></th>
                                <th class="sortable"><a href="/address/index?sort=zipcode&amp;max=10&amp;order=asc">Zipcode</a></th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each var="address" status="i" in="${addressList}">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td><a href="/address/show/${address.id}">${address.name}</a></td>
                                    <td><a href="/city/show/${address.city.id}">${address.city.name}</a></td>
                                    <td>${address.street}</td>
                                    <td>${address.zipcode}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <g:if test="${addressCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${addressCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>