<!-- NAVIGATION -->
<div id="navigation">
    <!-- container -->
    <div class="container-fluid">
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
                    <li><g:link action="landing" controller="user" >User Page</g:link></li>
                    <li><g:link action="index" controller="user" >User</g:link></li>
                    <li><g:link action="index" controller="category" >Category</g:link></li>
                    <li><g:link action="index" controller="Product" >Product</g:link></li>
                    <li class="dropdown default-dropdown"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">dropdown<i class="fa fa-caret-down"></i></a>
                        <ul class="custom-menu">
                            <li><a href="">Home</a></li>
                            <li><a href="">Products</a></li>
                            <li><a href="">Product Details</a></li>
                            <li><a href="">Checkout</a></li>
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