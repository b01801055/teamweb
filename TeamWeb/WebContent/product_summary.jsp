<%@page import="shop.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cart cart;
	if(session.getAttribute("cart")!=null){		
		cart =(Cart)session.getAttribute("cart");
	}else{
		cart=new Cart();
	}

		ProductDb productDb = new ProductDb();
%>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootshop online Shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!--Less styles -->
<!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="themes/bootshop/bootstrap.min.css" media="screen" />
<link href="themes/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- Google-code-prettify -->
<link href="themes/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon" href="themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="themes/images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
</head>
<body>
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">
					Welcome!<strong> User</strong>
				</div>
				<div class="span6">
					<div class="pull-right">
						<a href="product_summary.jsp"><span class="">Fr</span></a> <a
							href="product_summary.jsp"><span class="">Es</span></a> <span
							class="btn btn-mini">En</span> <a href="product_summary.jsp"><span>&pound;</span></a>
						<span class="btn btn-mini">$155.00</span> <a
							href="product_summary.jsp"><span class="">$</span></a> <a
							href="product_summary.jsp"><span
							class="btn btn-mini btn-primary"><i
								class="icon-shopping-cart icon-white"></i> [ 3 ] Itemes in your
								cart </span> </a>
					</div>
				</div>
			</div>
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="index.jsp"><img
						src="themes/images/logo.png" alt="Bootsshop" /></a>
					<form class="form-inline navbar-search" method="post"
						action="products.jsp">
						<input id="srchFld" class="srchTxt" type="text" /> <select
							class="srchTxt">
							<option>All</option>
							<option>CLOTHES</option>
							<option>FOOD AND BEVERAGES</option>
							<option>HEALTH & BEAUTY</option>
							<option>SPORTS & LEISURE</option>
							<option>BOOKS & ENTERTAINMENTS</option>
						</select>
						<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="special_offer.jsp">Specials Offer</a></li>
						<li class=""><a href="normal.jsp">Delivery</a></li>
						<li class=""><a href="contact.jsp">Contact</a></li>
						<li class=""><a href="#login" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-success">Login</span></a>
							<div id="login" class="modal hide fade in" tabindex="-1"
								role="dialog" aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">ï¿½</button>
									<h3>Login Block</h3>
								</div>
								<div class="modal-body">
									<form class="form-horizontal loginFrm">
										<div class="control-group">
											<input type="text" id="inputEmail" placeholder="Email">
										</div>
										<div class="control-group">
											<input type="password" id="inputPassword"
												placeholder="Password">
										</div>
										<div class="control-group">
											<label class="checkbox"> <input type="checkbox">
												Remember me
											</label>
										</div>
									</form>
									<button type="submit" class="btn btn-success">Sign in</button>
									<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
								</div>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End====================================================================== -->
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small">
						<a id="myCart" href="product_summary.jsp"><img
							src="themes/images/ico-cart.png" alt="cart"><%=cart.getTotalQuantity() %> Items in your
							cart <span class="badge badge-warning pull-right">$<%=cart.getTotalPrice()%></span></a>
					</div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<li class="subMenu open"><a> ELECTRONICS [230]</a>
							<ul>
								<li><a class="active" href="products.jsp"><i
										class="icon-chevron-right"></i>Cameras (100) </a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Computers, Tablets & laptop
										(30)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Mobile Phone (80)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Sound & Vision (15)</a></li>
							</ul></li>
						<li class="subMenu"><a> CLOTHES [840] </a>
							<ul style="display: none">
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Women's Clothing (45)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Women's Shoes (8)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Women's Hand Bags (5)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Men's Clothings (45)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Men's Shoes (6)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Kids Clothing (5)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Kids Shoes (3)</a></li>
							</ul></li>
						<li class="subMenu"><a>FOOD AND BEVERAGES [1000]</a>
							<ul style="display: none">
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Angoves (35)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Bouchard Aine & Fils (8)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>French Rabbit (5)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Louis Bernard (45)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>BIB Wine (Bag in Box) (8)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Other Liquors & Wine (5)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Garden (3)</a></li>
								<li><a href="products.jsp"><i
										class="icon-chevron-right"></i>Khao Shong (11)</a></li>
							</ul></li>
						<li><a href="products.jsp">HEALTH & BEAUTY [18]</a></li>
						<li><a href="products.jsp">SPORTS & LEISURE [58]</a></li>
						<li><a href="products.jsp">BOOKS & ENTERTAINMENTS [14]</a></li>
					</ul>
					<br />
					<div class="thumbnail">
						<img src="themes/images/products/panasonic.jpg"
							alt="Bootshop panasonoc New camera" />
						<div class="caption">
							<h5>Panasonic</h5>
							<h4 style="text-align: center">
								<a class="btn" href="product_details.jsp"> <i
									class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
									class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
									href="#">$222.00</a>
							</h4>
						</div>
					</div>
					<br />
					<div class="thumbnail">
						<img src="themes/images/products/kindle.png"
							title="Bootshop New Kindel" alt="Bootshop Kindel">
						<div class="caption">
							<h5>Kindle</h5>
							<h4 style="text-align: center">
								<a class="btn" href="product_details.jsp"> <i
									class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
									class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
									href="#">$222.00</a>
							</h4>
						</div>
					</div>
					<br />
					<div class="thumbnail">
						<img src="themes/images/payment_methods.png"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
				<!-- Sidebar end=============================================== -->
				<%
					request.setCharacterEncoding("utf-8");

				Collection<CartItem> cl = cart.getItems();
				if (cl.size() <= 0) {
					out.println("購物車中沒有商品<p>");
					return;
				}
				Iterator<CartItem> it = cl.iterator();
				%>
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
						<li class="active">SHOPPING CART</li>
					</ul>
					<h3>
						SHOPPING CART<a href="products.jsp"
							class="btn btn-large pull-right"><i class="icon-arrow-left"></i>
							Continue Shopping </a>
					</h3>
					<hr class="soft" />
					<form name="mainForm" action="doCartServlet">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Product</th>
									<th>Description</th>
									<th>Quantity/Update</th>
									<th>Price</th>
									<th>Total</th>
								</tr>
							</thead>
							<%
								int i = 0;
							while (it.hasNext()) {
								CartItem cartItem = (CartItem) it.next();
								Product product = cartItem.getProduct();
								int prod_id = product.getProd_id();
							%>
							<tbody>
								<tr>
									<td><img width="60" src="uploadedIMG/<%=prod_id%>.jpg"
										alt="" /></td>
										<td><%=product.getProd_introduction()%></td>
									<td>
										<div class="input-append">
											<input class="span1" name="quantity_<%=prod_id %>" style="max-width: 34px" value="<%=cart.getItemQuantity(prod_id) %>"
												id="appendedInputButtons" size="16" type="text"
												 />
											<button class="btn" name="minusBtn" type="button" onclick="window.location.href='doCartServlet?minus_id=<%= prod_id %>'">
												<i class="icon-minus"></i>
												</button>
											<button class="btn" name="plusBtn" type="button" onclick="window.location.href='doCartServlet?plus_id=<%= prod_id %>'">
												<i class="icon-plus"></i>
											</button>
											<button class="btn btn-danger" name="delBtn" id="delByn" value="<%=prod_id %>" type="button" onclick="window.location.href='doCartServlet?del_id=<%=prod_id %>'">
												<i class="icon-remove icon-white"></i>
											</button>
											刪除
										</div>
									</td>
									<td><%=product.getProd_price()%></td>
									<td>$<%=cart.getItemQuantity(prod_id)*product.getProd_price() %></td>
								</tr>
								<%
									}
								%>
								<tr>
									<td colspan="6" style="text-align: right">Total Price:</td>
									<td>$<%=cart.getTotalPrice()%></td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="fromWho" value="product_summary.jsp">
						<input type="submit" name="savingByn" id="savingBtn"  value="保存修改">
					</form>
					<a href="products.jsp" class="btn btn-large"><i
						class="icon-arrow-left"></i> Continue Shopping </a> <a
						href="checkout.jsp" class="btn btn-large pull-right">進行結帳<i
						class="icon-arrow-right"></i></a>

				</div>
			</div>
		</div>
	</div>
	<!-- MainBody End ============================= -->
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a href="login.jsp">YOUR ACCOUNT</a> <a href="login.jsp">PERSONAL
						INFORMATION</a> <a href="login.jsp">ADDRESSES</a> <a href="login.jsp">DISCOUNT</a>
					<a href="login.jsp">ORDER HISTORY</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a href="contact.jsp">CONTACT</a> <a href="register.jsp">REGISTRATION</a>
					<a href="legal_notice.jsp">LEGAL NOTICE</a> <a href="tac.jsp">TERMS
						AND CONDITIONS</a> <a href="faq.jsp">FAQ</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
						href="special_offer.jsp">SPECIAL OFFERS</a> <a href="#">MANUFACTURERS</a>
					<a href="#">SUPPLIERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a href="#"><img width="60" height="60"
						src="themes/images/facebook.png" title="facebook" alt="facebook" /></a>
					<a href="#"><img width="60" height="60"
						src="themes/images/twitter.png" title="twitter" alt="twitter" /></a> <a
						href="#"><img width="60" height="60"
						src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
				</div>
			</div>
			<p class="pull-right">&copy; Bootshop</p>
		</div>
		<!-- Container End -->
	</div>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>

	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>

	<!-- Themes switcher section ============================================================================================= -->
	<div id="secectionBox">
		<link rel="stylesheet" href="themes/switch/themeswitch.css"
			type="text/css" media="screen" />
		<script src="themes/switch/theamswitcher.js" type="text/javascript"
			charset="utf-8"></script>
		<div id="themeContainer">
			<div id="hideme" class="themeTitle">Style Selector</div>
			<div class="themeName">Oregional Skin</div>
			<div class="images style">
				<a href="themes/css/#" name="bootshop"><img
					src="themes/switch/images/clr/bootshop.png"
					alt="bootstrap business templates" class="active"></a> <a
					href="themes/css/#" name="businessltd"><img
					src="themes/switch/images/clr/businessltd.png"
					alt="bootstrap business templates" class="active"></a>
			</div>
			<div class="themeName">Bootswatch Skins (11)</div>
			<div class="images style">
				<a href="themes/css/#" name="amelia" title="Amelia"><img
					src="themes/switch/images/clr/amelia.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="spruce" title="Spruce"><img
					src="themes/switch/images/clr/spruce.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="superhero" title="Superhero"><img
					src="themes/switch/images/clr/superhero.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="cyborg"><img src="themes/switch/images/clr/cyborg.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="cerulean"><img
					src="themes/switch/images/clr/cerulean.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="journal"><img src="themes/switch/images/clr/journal.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="readable"><img
					src="themes/switch/images/clr/readable.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="simplex"><img src="themes/switch/images/clr/simplex.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="slate"><img src="themes/switch/images/clr/slate.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="spacelab"><img
					src="themes/switch/images/clr/spacelab.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="united"><img src="themes/switch/images/clr/united.png"
					alt="bootstrap business templates"></a>
				<p
					style="margin: 0; line-height: normal; margin-left: -10px; display: none;">
					<small>These are just examples and you can build your own
						color scheme in the backend.</small>
				</p>
			</div>
			<div class="themeName">Background Patterns</div>
			<div class="images patterns">
				<a href="themes/css/#" name="pattern1"><img
					src="themes/switch/images/pattern/pattern1.png"
					alt="bootstrap business templates" class="active"></a> <a
					href="themes/css/#" name="pattern2"><img
					src="themes/switch/images/pattern/pattern2.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern3"><img
					src="themes/switch/images/pattern/pattern3.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern4"><img
					src="themes/switch/images/pattern/pattern4.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern5"><img
					src="themes/switch/images/pattern/pattern5.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern6"><img
					src="themes/switch/images/pattern/pattern6.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern7"><img
					src="themes/switch/images/pattern/pattern7.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern8"><img
					src="themes/switch/images/pattern/pattern8.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern9"><img
					src="themes/switch/images/pattern/pattern9.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern10"><img
					src="themes/switch/images/pattern/pattern10.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern11"><img
					src="themes/switch/images/pattern/pattern11.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern12"><img
					src="themes/switch/images/pattern/pattern12.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern13"><img
					src="themes/switch/images/pattern/pattern13.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern14"><img
					src="themes/switch/images/pattern/pattern14.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern15"><img
					src="themes/switch/images/pattern/pattern15.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern16"><img
					src="themes/switch/images/pattern/pattern16.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern17"><img
					src="themes/switch/images/pattern/pattern17.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern18"><img
					src="themes/switch/images/pattern/pattern18.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern19"><img
					src="themes/switch/images/pattern/pattern19.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern20"><img
					src="themes/switch/images/pattern/pattern20.png"
					alt="bootstrap business templates"></a>

			</div>
		</div>
	</div>
	<span id="themesBtn"></span>
</body>
</html>