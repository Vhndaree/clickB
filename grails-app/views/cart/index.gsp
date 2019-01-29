<%--
  Created by IntelliJ IDEA.
  User: vhndaree
  Date: 1/27/19
  Time: 9:30 PM
--%>

<g:render template="/includes/header"/>
<g:render template="/includes/navbar"/>

<!-- section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Your Cart</h2>
                </div>
            </div>
            <!-- section title -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /section -->


<g:each in="${session.cartMap}" var="cartItem">
    <g:set var="product" value="${clickb.Product.get(cartItem.product)}"/>
    <!-- section -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- Product Single -->
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="product product-single">
                        <div class="product-thumb">
                            <img src="${resource(file: '/product/images/'+product.image, absolute: true)}"/>
                        </div>
                    </div>
                </div>
                <!-- /Product Single -->
                <div class="col-md-9 col-sm-9 col-xs-9">
                    <p class="product-body">
                        <div class="product-label">
                            <g:if test="${product.discount!=0}">
                                <span class="sale">${product.discount}%</span>
                            </g:if>
                        </div>
                    <h2 class="product-name text-capitalize">${product.productName}</h2>
                    <h3 class="product-price">
                        <g:if test="${product.discount==0}">
                            <h3>
                                $ ${product.price}
                            </h3>
                        </g:if>
                        <g:else>
                            $${product.price-(product.price*product.discount/100)}
                            <del class="product-old-price">$ ${product.price}</del>
                        </g:else>
                    </h3>
                    <p><strong>Brand:</strong> ${product.company}</p>
                    <p>${product.detail}</p>
                    <div class="product-btns" >
                        <div class="qty-input" >
                            <span class="text-uppercase">Quantity: </span>
                        </div>
                        <input class="input" type="number" min="1" value="${cartItem.quantity}" style="width: 90px;"/>
                        <button class="primary-btn "><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                        <div class="">
                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                            <button class="main-btn icon-btn"><i class="fa fa-share-alt"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /section -->
</g:each>

<export:formats />
<g:render template="/includes/footer"/>
