
<%@ page import="clickb.User" %>
<g:render template="../includes/header"/>
<asset:stylesheet src="application.css"/>
<asset:javascript src="application.js"/>
<g:render template="../includes/adminNav"/>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">New</g:link></li>
			</ul>
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'user.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="contact" title="${message(code: 'user.contact.label', default: 'Contact')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'user.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="role" title="${message(code: 'user.role.label', default: 'Role')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: userInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "contact")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "role")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
