<%--
  Created by IntelliJ IDEA.
  User: vhndaree
  Date: 1/26/19
  Time: 2:13 PM
--%>

<g:render template="/includes/header"/>
<g:render template="/includes/navbar"/>

<!-- section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <g:each in="${searchResult}" var="product">
                <!-- Product Single -->
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="product product-single">
                        <div class="product-thumb">
                            <g:link controller="product" action="productShow" id="${product.id}" class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</g:link>
                            <img src="${resource(file: "/product/images/"+product.image, absolute: true)}"/>
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">${product.price}</h3>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o empty"></i>
                            </div>
                            <h2 class="product-name"><a href="#">${product.productName}</a></h2>
                            <div class="product-btns">
                                <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                                <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                                <g:link  class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</g:link>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Product Single -->
            </g:each>
        </div>
    </div>
</div>

<g:render template="/includes/footer"/>