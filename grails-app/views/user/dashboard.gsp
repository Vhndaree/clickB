<%--
  Created by IntelliJ IDEA.
  User: vhndaree
  Date: 1/17/19
  Time: 2:29 PM
--%>

<%--
  Created by IntelliJ IDEA.
  User: vhndaree
  Date: 1/17/19
  Time: 11:42 AM
--%>

<g:render template="../includes/header"/>

<!-- NAVIGATION -->
<div id="navigation">
    <!-- container -->
    <div class="container">
        <div id="responsive-nav">
            <!-- menu nav -->
            <div class="menu-nav">

                <span class="menu-header">Menu <i class="fa fa-bars"></i></span>
                <ul class="menu-list">
                    <div class="header-logo bg-white">
                        <a class="logo " href="#">
                            <asset:image src="logo.png"  alt="logo"/>
                        </a>
                    </div>
                    <!-- /Logo -->
                    <li><g:link action="index" controller="user" >User</g:link></li>
                    <li><g:link action="index" controller="category" >Category</g:link></li>
                    <li><g:link action="index" controller="Product" >Product</g:link></li>
                    <li><a href="#">Sales</a></li>
                    <li class="dropdown default-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">dropdown<i class="fa fa-caret-down"></i></a>
                        <ul class="custom-menu">
                            <li><a href="index.html">Home</a></li>
                            <li><a href="products.html">Products</a></li>
                            <li><a href="product-page.html">Product Details</a></li>
                            <li><a href="checkout.html">Checkout</a></li>
                        </ul>
                    </li>
                    <li class="dropdown default-dropdown" style="float: right;margin-top:10px; margin-right:10px;"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" style="text-transform: capitalize;">${session.user.name}<i class="fa fa-caret-down"></i></a>
                        <ul class="custom-menu">
                            <li><a href="#">Profile</a></li>
                            <li><g:link controller="user" action="logout">Logout</g:link></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- menu nav -->
        </div>
    </div>
    <!-- /container -->
</div>
<!-- /NAVIGATION -->


<g:render template="/includes/footer"/>