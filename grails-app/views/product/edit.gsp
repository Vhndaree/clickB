<%@ page import="clickb.Product" %>
<!DOCTYPE html>
<g:render template="../includes/header"/>
<asset:stylesheet src="application.css"/>
<asset:javascript src="application.js"/>
<g:render template="../includes/adminNav"/>
		<a href="#edit-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index">List</g:link></li>
				<li><g:link class="create" action="create">New</g:link></li>
			</ul>
		</div>
		<div id="edit-product" class="content scaffold-edit" role="main">
			<h1>Edit</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${productInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${productInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:productInstance, action:'update']" method="POST" enctype="multipart/form-data">
				<g:hiddenField name="version" value="${productInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
