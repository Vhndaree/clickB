<g:set var="carousel" value="${clickb.Product.executeQuery("from Product where imagePurpose= 'Carousel'")}"/>

<!-- HOME -->
<div id="home">
    <!-- container -->
    <div class="container">
        <!-- home wrap -->
        <div class="home-wrap">
            <!-- home slick -->
            <div id="home-slick">
                <g:each in="${carousel}" var="carousel1">
                <!-- banner -->
                <div class="banner banner-1">
                    <img src="${resource(file: "product/images/"+carousel1.image, absolute: true)}"/>
                    <div class="banner-caption">
                        <h1 class="primary-color">HOT DEAL<br><span class="white-color font-weak">Up to 50% OFF</span></h1>
                        <g:link controller="cart" action="addToCart" params="[product: carousel1.id, quantity: 1]" class="primary-btn">Shop Now</g:link>
                    </div>
                </div>
                <!-- /banner -->

                </g:each>
            </div>
            <!-- /home slick -->
        </div>
        <!-- /home wrap -->
    </div>
    <!-- /container -->
</div>
<!-- /HOME -->