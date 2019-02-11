<g:set var="dealsoftheday" value="${clickb.Product.list(max: 10, sort: "discount", order: "desc")}"/>

<!-- section -->
<div class="section">
    <!-- container -->
    <div class="container"><!-- row -->
        <div class="row">
            <!-- section-title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Deals Of The Day</h2>
                    <div class="pull-right">
                        <div class="product-slick-dots-1 custom-dots"></div>
                    </div>
                </div>
            </div>
            <!-- /section-title -->

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
                    <div id="product-slick-1" class="product-slick">

                        <g:each in="${dealsoftheday}" var="deals">
                            <!-- Product Single -->
                            <div class="product product-single">
                                <div class="product-thumb">
                                    <div class="product-label">
                                        <span class="sale">- ${deals.discount}%</span>
                                    </div>
                                    <ul class="product-countdown">
                                        <li><span>00 H</span></li>
                                        <li><span>00 M</span></li>
                                        <li><span>00 S</span></li>
                                    </ul>
                                    <g:link controller="product" action="productShow" id="${deals.id}" class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</g:link>
                                    <img src="${resource(file: "/product/images/"+deals.image, absolute: true)}"/>
                                </div>
                                <div class="product-body">
                                    <h3 class="product-price">
                                        $ ${deals.price-(deals.price*deals.discount/100)}
                                        <del class="product-old-price">${deals.price}</del>
                                    </h3>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o empty"></i>
                                    </div>
                                    <h2 class="product-name"><a href="#">${deals.productName}</a></h2>
                                    <div class="product-btns">
                                        <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                                        <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                                        <g:link controller="cart" action="addToCart" params="[product: deals.id, quantity: 1]" class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</g:link>
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