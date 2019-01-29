<!-- section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Latest Products</h2>
                </div>
            </div>
            <!-- section title -->
        </div>
        <!-- /row -->

        <!-- row -->
        <div class="row">
            <!-- banner -->
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="banner banner-2">
                    <asset:image src="product/banner15.jpg"/>
                    <div class="banner-caption">
                        <h2 class="white-color">NEW<br>COLLECTION</h2>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
            </div>
        <!-- /banner -->

            <g:each in="${latestProduct}" var="latest">
                <!-- Product Single -->
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span>New</span>
                                <g:if test="${latest.discount!=0}">
                                    <span class='sale'>${latest.discount}%</span>
                                </g:if>
                            </div>
                            <g:link controller="product" action="productShow" id="${latest.id}" class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</g:link>
                            <img src="${resource(file: "/product/images/"+latest.image, absolute: true)}"/>

                        </div>
                        <div class="product-body">
                            <h3 class="product-price">
                                <g:if test="${latest.discount==0}">
                                    $ ${latest.price}
                                </g:if>
                                <g:else>
                                    $ ${latest.price-(latest.price*latest.discount/100)}
                                    <del class="product-old-price">${latest.price}</del>
                                </g:else>
                            </h3>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o empty"></i>
                            </div>
                            <h2 class="product-name"><a href="#">${latest.productName}</a></h2>
                            <div class="product-btns">
                                <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                                <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                                <g:form controller="cart" action="addToCart">
                                    <div>
                                        <g:hiddenField name="quantity" value="1"/>
                                        <g:hiddenField name="product" value="${latest.id}"/>
                                    </div>
                                    <g:submitButton name="add To Cart" class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i></g:submitButton>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Product Single -->
            </g:each>
        </div>
        <!-- /row -->
    </div>
</div>