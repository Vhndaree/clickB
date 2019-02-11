
<%@ page import="clickb.Product" %>
<g:render template="../includes/header"/>
<asset:stylesheet src="application.css"/>
<asset:javascript src="application.js"/>
<g:render template="../includes/adminNav"/>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index">List</g:link></li>
				<li><g:link class="create" action="create">New</g:link></li>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1>${productInstance.productName}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">
			
				<g:if test="${productInstance?.productName}">
				<li class="fieldcontain">
					<span id="productName-label" class="property-label"><g:message code="product.productName.label" default="Product Name" /></span>
					
						<span class="property-value" aria-labelledby="productName-label"><g:fieldValue bean="${productInstance}" field="productName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="product.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${productInstance?.category?.id}">${productInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="product.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:fieldValue bean="${productInstance}" field="company"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="product.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${productInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.discount}">
				<li class="fieldcontain">
					<span id="discount-label" class="property-label"><g:message code="product.discount.label" default="Discount" /></span>
					
						<span class="property-value" aria-labelledby="discount-label"><g:fieldValue bean="${productInstance}" field="discount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.stock}">
				<li class="fieldcontain">
					<span id="stock-label" class="property-label"><g:message code="product.stock.label" default="Stock" /></span>
					
						<span class="property-value" aria-labelledby="stock-label"><g:fieldValue bean="${productInstance}" field="stock"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="product.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><img src="${resource(file: "/product/images/"+productInstance.image, absolute: true)}" height="200" width="200"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.detail}">
				<li class="fieldcontain">
					<span id="detail-label" class="property-label"><g:message code="product.detail.label" default="Detail" /></span>
					
						<span class="property-value" aria-labelledby="detail-label"><g:fieldValue bean="${productInstance}" field="detail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.addedDate}">
				<li class="fieldcontain">
					<span id="addedDate-label" class="property-label"><g:message code="product.addedDate.label" default="Added Date" /></span>
					
						<span class="property-value" aria-labelledby="addedDate-label"><g:fieldValue bean="${productInstance}" field="addedDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.views}">
				<li class="fieldcontain">
					<span id="views-label" class="property-label"><g:message code="product.views.label" default="Views" /></span>
					
						<span class="property-value" aria-labelledby="views-label"><g:fieldValue bean="${productInstance}" field="views"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.imagePurpose}">
				<li class="fieldcontain">
					Image Display
					
						<span class="property-value" aria-labelledby="imagePurpose-label"><g:fieldValue bean="${productInstance}" field="imagePurpose"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:productInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
