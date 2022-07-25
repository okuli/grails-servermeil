<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:set var="order" value="${request.getParameter("order")}" />
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
                                <th class="sortable sorted order}"><g:link action="index" controller="address" params="${[sort:'name',max:10,order:order=='asc'?'desc':'asc']}">Name</g:link></th>
                                <th class="">City</th>
                                <th class="">Street</th>
                                <th class="">Zipcode</th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each var="address" status="i" in="${addressList}">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td><g:link action="show" id='${address.id}'>${address.name}</g:link></td>
                                    <td><g:link action="show" controller="city" id='${address.city.id}'>${address.city.name}</g:link></td>
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