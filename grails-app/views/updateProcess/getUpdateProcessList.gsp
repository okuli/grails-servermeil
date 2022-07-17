<%@ page import="updateassistant.Device"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'updateProcess.label', default: 'UpdateProcess')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:set var="sortName" value="${request.getParameter("sort")}" />
        <g:set var="order" value="${request.getParameter("order")}" />
        <g:set var="deviceId" value="${request.getParameter("deviceId")}" />
    </head>
    <body>
    <script type="text/javascript">
        function URL_add_parameter(url, param, value){
            var hash       = {};
            var parser     = document.createElement('a');
            parser.href    = url;
            var parameters = parser.search.split(/\?|&/);
            for(var i=0; i < parameters.length; i++) {
                if(!parameters[i])
                    continue;

                var ary      = parameters[i].split('=');
                hash[ary[0]] = ary[1];
            }
            hash[param] = value;
            var list = [];
            Object.keys(hash).forEach(function (key) {
                list.push(key + '=' + hash[key]);
            });
            parser.search = '?' + list.join('&');
            return parser.href;
        }
        function updateGrid()
        {
            var selectedId = $('#device :selected').val();
            window.location.href = URL_add_parameter(window.location.href,'deviceId',selectedId);
        }
    </script>
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
                    <div style="margin:15px">
                        <label for="">Device</label>
                        <select id="device" name="device" onchange="updateGrid()">
                            <option value="0">Select Device</option>
                            <g:each var="device" in="${Device.list()}">
                                <option value="${device.id}" <g:if test="${''+deviceId == ''+device.id}">selected="selected"</g:if>>${device.serialnumber}</option>
                            </g:each>
                        </select>
                    </div>
                    <table id="updateProcessTable">
                    <thead>
                        <tr>
                            <th class="sortable ${sortName == 'currentVersion' ? 'sorted':''} ${sortName == 'currentVersion' ? order : ''}"><a href="/updateProcess/index?sort=currentVersion&amp;max=10&amp;order=${order == 'asc' ? 'desc':'asc'}">Current Version</a></th>
                            <th class="sortable ${sortName == 'lastVersion' ? 'sorted':''} ${sortName == 'lastVersion' ? order : ''}"><a href="/updateProcess/index?sort=lastVersion&amp;max=10&amp;order=${order == 'asc' ? 'desc':'asc'}">Last Version</a></th>
                            <th class="">Check Date</th>
                            <th class="">Update Date</th>
                            <th class="">Update Success</th>
                            <th class="">Device</th>
                            <th class="">Contact</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="updateProcess" status="i" in="${updateProcessList}">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td><a href="/updateProcess/show/${updateProcess.id}">${updateProcess.currentVersion}</a></td>
                                <td>${updateProcess.lastVersion}</td>
                                <td>${updateProcess.checkDate}</td>
                                <td>${updateProcess.updateDate}</td>
                                <td>${updateProcess.updateSuccess}</td>
                                <td><a href="/device/show/${updateProcess.device.id}">${updateProcess.device.serialnumber}</a></td>
                                <td><a href="/contact/show/${updateProcess.contact.id}">${updateProcess.contact.firstname}</a></td>
                                <td><a href="/updateProcess/edit/${updateProcess.id}"><g:img dir="images" file="/skin/database_edit.png" /></a></td>
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