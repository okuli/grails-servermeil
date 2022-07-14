<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'model.label', default: 'Model')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <g:render template="/common/header" />
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#list-model" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="list-model" class="col-12 content scaffold-list" role="main">
                    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <table>
                        <thead>
                            <tr>
                                <th class="sortable"><a href="/model/index?sort=manufacturer&amp;max=10&amp;order=asc">Manufacturer</a></th>
                                <th class="sortable"><a href="/model/index?sort=modeName&amp;max=10&amp;order=asc">Mode Name</a></th>
                                <th class="sortable"><a href="/model/index?sort=updateURL&amp;max=10&amp;order=asc">Update URL</a></th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each var="model" status="i" in="${modelList}">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td><a href="/manufacturer/show/${model.manufacturer.id}">${model.manufacturer.name}</a></td>
                                    <td><a href="/model/show/${model.id}">${model.modeName}</a></td>
                                    <td>${model.updateURL}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>

                    <g:if test="${modelCount > params.int('max')}">
                    <div class="pagination">
                        <g:paginate total="${modelCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>