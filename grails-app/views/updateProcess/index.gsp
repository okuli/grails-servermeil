<%@ page import="updateassistant.Device"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:stylesheet src="updateprocess.css"/>
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
                            <th class="sortable ${sortName == 'id' ? 'sorted':''} ${sortName == 'id' ? order : ''}"><g:link action="index" controller="updateProcess" params="${[sort:'id',max:10,order:order=='asc'?'desc':'asc']}">ID</g:link></th>
                            <th class="">Device Manufacturer</th>
                            <th class="">Device Model</th>
                            <th class="">Installed Version</th>
                            <th class="">Checked Version</a></th>
                            <th class="">Check Date</th>
                            <th class="">Update Date</th>
                            <th class="">Update Success</th>
                            <th class="">Contact</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each var="updateProcess" status="i" in="${updateProcessList}">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'} ${updateProcess.isNotUpdated ? 'notupdated' : ''}">
                                <td><g:link action="show" id='${updateProcess.id}'>${updateProcess.id}</g:link></td>
                                <td>${updateProcess.device.manufacturer.name}</td>
                                <td>${updateProcess.device.model != null ? updateProcess.device.model.modeName : ''}</td>
                                <td>${updateProcess.currentVersion}</td>
                                <td>${updateProcess.lastVersion}</td>
                                <td><g:formatDate format="yyyy-MM-dd" date="${updateProcess.checkDate}" /></td>
                                <td><g:formatDate format="yyyy-MM-dd" date="${updateProcess.updateDate}" /></td>
                                <td>${updateProcess.updateSuccess ? 'Yes':'No'}</td>
                                <td>${updateProcess.contact.firstname}/${updateProcess.contact.lastname}</td>
                                <td><g:link action="edit" id='${updateProcess.id}'><g:img dir="images" file="/skin/database_edit.png" /></g:link></td>
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