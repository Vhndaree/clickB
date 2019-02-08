<%--
  Created by IntelliJ IDEA.
  User: vhndaree
  Date: 1/27/19
  Time: 9:30 PM
--%>

<g:render template="/includes/header"/>
<g:render template="/includes/navbar"/>
<g:if test="${session.cartMap}">
<!-- section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <form id="checkout-form" class="clearfix">
                <div class="col-md-12">
                    <div class="order-summary clearfix">
                        <div class="section-title">
                            <h3 class="title">Your Cart</h3>
                        </div>
                        <table class="shopping-cart-table table">
                            <thead>
                            <tr>
                                <th>Product</th>
                                <th></th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Quantity</th>
                                <th class="text-center">Total</th>
                                <th class="text-right"></th>
                            </tr>
                            </thead>
                            <g:each in="${session.cartMap}" var="cartItem">
                                <g:set var="product" value="${clickb.Product.get(cartItem.getKey())}"/>
                                <tbody>
                                    <tr>
                                        <td class="thumb"><img src="${resource(file: '/product/images/'+product.image, absolute: true)}"/></td>
                                        <td class="details">
                                            <a href="#">${product.productName}</a>
                                            <ul>
                                                <li><span></span></li>
                                                <li><span>Brand: ${product.company}</span></li>
                                            </ul>
                                        </td>
                                        <td class="price text-center">
                                            <g:if test="${product.discount==0}">
                                                <strong>$ ${product.price}</strong><br>
                                            </g:if>
                                            <g:else>
                                                <strong>$${product.price-(product.price*product.discount/100)}</strong>
                                                <del class="font-weak"><small>
                                                    <del class="product-old-price text-danger">$ ${product.price}</del>
                                                </small></del>
                                            </g:else>
                                        </td>
                                        <td class="qty text-center"><input class="input" type="number" value="${cartItem.getValue()}"></td>
                                        <td class="total text-center"><strong class="primary-color">
                                            <g:if test="${product.discount==0}">
                                                $${product.price*cartItem.getValue().toInteger()}
                                            </g:if>
                                            <g:else>
                                                $${(product.price-(product.price*product.discount/100))*cartItem.getValue().toInteger()}
                                            </g:else>
                                        <td class="text-right"><g:link controller="cart" action="removeFromCart" params="[cartId: product.id]" class="main-btn icon-btn"><i class="fa fa-trash"></i></g:link></td>
                                   </tr>
                                </tbody>
                            </g:each>
                        </table>
                    </div>
                </div>
            </form>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /section -->
</g:if>
<g:else>
    <!-- section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
    There is no item in your cart. <g:link controller="user" action="landing" class="btn btn-success">continue shopping</g:link>
    </div>
    </div>
</div>
</g:else>

<g:render template="/includes/footer"/>
