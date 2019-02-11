<%@ page import="clickb.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'productName', 'error')} required">
	<label for="productName">
		<g:message code="product.productName.label" default="Product Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="productName" required="" value="${productInstance?.productName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="product.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${clickb.Category.list()}" optionKey="id" required="" value="${productInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'company', 'error')} ">
	<label for="company">
		<g:message code="product.company.label" default="Company" />
		
	</label>
	<g:textField name="company" value="${productInstance?.company}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="product.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: productInstance, field: 'price')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'discount', 'error')} required">
	<label for="discount">
		<g:message code="product.discount.label" default="Discount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="discount" value="${fieldValue(bean: productInstance, field: 'discount')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'stock', 'error')} required">
	<label for="stock">
		<g:message code="product.stock.label" default="Stock" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="stock" value="${fieldValue(bean: productInstance, field: 'stock')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="product.image.label" default="Image" />

	</label>
	<input type="file" name="productImage"/>
	<g:if test="${productInstance.image}">
		<img src="${resource(file: "/product/images/"+productInstance.image, absolute: true)}" width="200"/>
	</g:if>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'detail', 'error')} ">
	<label for="detail">
		<g:message code="product.detail.label" default="Detail" />
		
	</label>
	<g:textField name="detail" value="${productInstance?.detail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'imagePurpose', 'error')} required">
	<label for="imagePurpose">
		Image position
	</label>
	<g:select name="imagePurpose" from="${productInstance.constraints.imagePurpose.inList}" required="" value="${productInstance?.imagePurpose}" valueMessagePrefix="product.imagePurpose"/>

</div>

