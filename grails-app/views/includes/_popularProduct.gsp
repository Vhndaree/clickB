<g:set var="popularProducts" value="${clickb.Product.list(max: 10, sort: "views", order: "desc")}"/>

<!-- section -->
<div class="section">
    <!-- container -->
    <div class="container"><!-- row -->
        <div class="row">
            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Most Popular Products</h2>
                    <div class="pull-right">
                        <div class="product-slick-dots-2 custom-dots">
                        </div>
                    </div>
                </div>
            </div>
            <!-- section title -->
            <!-- banner -->
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="banner banner-2">
                    <asset:image src="product/banner14.jpg"/>
                    <div class="banner-caption">
                        <h2 class="white-color">NEW<br>COLLECTION</h2>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
            </div>
            <!-- /banner -->
            <!-- Product Slick -->
            <div class="col-md-9 col-sm-6 col-xs-6">
                <div class="row">
                    <div id="product-slick-2" class="product-slick">

                        <g:each in="${popularProducts}" var="popular">
                            <!-- Product Single -->
                            <div class="product product-single">
                                <div class="product-thumb">
                                    <div class="product-label">
                                        <g:if test="${popular.discount!=0}">
                                            <span class='sale'>- ${popular.discount}%</span>
                                        </g:if>
                                    </div>
                                    <g:link controller="product" action="productShow" id="${popular.id}" class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</g:link>
                                    <img src="${resource(file: "/product/images/"+popular.image)}"/>
                                </div>
                                <div class="product-body">
                                    <h3 class="product-price">
                                        <g:if test="${popular.discount==0}">
                                            $ ${popular.price}
                                        </g:if>
                                        <g:else>
                                            $ ${popular.price-(popular.price*popular.discount/100)}
                                            <del class="product-old-price">${popular.price}</del>
                                        </g:else>
                                    </h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o empty"></i>
                                    </div>
                                    <h2 class="product-name"><a href="#">${popular.productName}</a></h2>
                                    <div class="product-btns">
                                        <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                                        <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                                        <g:link controller="cart" action="addToCart" params="[product: popular.id, quantity: 1]" class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</g:link>
                                    </div>
                                </div>
                            </div>
                            <!-- /Product Single -->
                        </g:each>
                    </div>
                </div>
            </div>
            <!-- /Product Slick -->
        </div>
        <!-- /row -->
    </div>
</div>