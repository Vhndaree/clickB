
<%@ page import="clickb.Product" %>
<g:render template="../includes/header"/>
<asset:stylesheet src="application.css"/>
<asset:javascript src="application.js"/>
<g:render template="../includes/adminNav"/>
		<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/home')}">Home</a></li>
				<li><g:link class="create" action="create">new product</g:link></li>
			</ul>
		</div>
		<div id="list-product" class="content scaffold-list" role="main">
			<h1>Index</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="productName" title="${message(code: 'product.productName.label', default: 'Product Name')}" />
					
						<th><g:message code="product.category.label" default="Category" /></th>
					
						<g:sortableColumn property="company" title="${message(code: 'product.company.label', default: 'Company')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'product.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="discount" title="${message(code: 'product.discount.label', default: 'Discount')}" />
					
						<g:sortableColumn property="stock" title="${message(code: 'product.stock.label', default: 'Stock')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productInstanceList}" status="i" var="productInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "productName")}</g:link></td>
					
						<td>${fieldValue(bean: productInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "company")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "discount")}</td>
					
						<td>${fieldValue(bean: productInstance, field: "stock")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
