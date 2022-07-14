<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'datacenter.label', default: 'Datacenter')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template="/common/header" />
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-datacenter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-datacenter" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                    <thead>
                        <tr>
                            <th class="sortable"><a href="/datacenter/index?sort=name&amp;max=10&amp;order=asc">Name</a></th>
                            <th class="sortable"><a href="/datacenter/index?sort=address&amp;max=10&amp;order=asc">Address</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="datacenter" in="${datacenterList}">
                            <tr>
                                <td><a href="/datacenter/show/${datacenter.id}">${datacenter.name}</a></td>
                                <td><a href="/address/show/${datacenter.address.id}">${datacenter.address.name}</a></td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>

                    <g:if test="${datacenterCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${datacenterCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>