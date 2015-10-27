<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>
		<?php echo $title; ?>
	</title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<?php if ($icon) { ?>
		<link href="<?php echo $icon; ?>" rel="icon" />
	<?php } ?>
	<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<!-- <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" /> -->
	<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="catalog/view/theme/bigboom/stylesheet/bootstrap.css" rel="stylesheet">
	<link href="catalog/view/theme/bigboom/stylesheet/style.css" rel="stylesheet">
	<?php foreach ($styles as $style) { ?>
	    	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/owl.carousel.2.0.0-beta.2.4/assets/owl.carousel.css">
	<script src="catalog/view/javascript/jquery.jCounter-0.1.4.js" type="text/javascript"></script>	
	<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/modern.js" type="text/javascript"></script>
	<?php foreach ($scripts as $script) { ?>
		<script src="<?php echo $script; ?>" type="text/javascript"></script>
	<?php } ?>
	<script type="text/javascript" src="catalog/view/javascript/owl.carousel.2.0.0-beta.2.4/owl.carousel.min.js"></script>
</head>
<body class="<?php echo $class; ?>">	
	<header class="header header-1">
		<div id="top">
			<h2>Special Offer!</h2>
			<h4>Rewarding all customers with a 15% discount.</h4>
			<h5>this offer is available from 9th December to 19th December 2015</h5>
		</div>
		<nav id="top-nav">
			<div class="container">
				<div class="row">
					<ul class="top-left col-sm-6 clearfix">
						<li class="dropdown language">
							<?php echo $language; ?>
						</li>
						<li class="dropdown currency">
							<?php echo $currency; ?>
						</li>
					</ul>
					<div class="top-right col-sm-6">
						<ul class="toplink-wrapper pull-right clearfix">
							<li class="dropdown my-account">
								<div class="btn-group">
									<button href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
										<a href="#" class="top-link account-link"><?php echo $text_account; ?><i class="fa fa-angle-down"></i></a>
									</button>
									<?php if ($logged) { ?>
									<ul class="dropdown-menu dropdown-menu-right">
										<li>
											<a href="<?php echo $account; ?>">
												<?php echo $text_account; ?>
											</a>
										</li>
										<li>
											<a href="<?php echo $order; ?>">
												<?php echo $text_order; ?>
											</a>
										</li>
										<li>
											<a href="<?php echo $transaction; ?>">
												<?php echo $text_transaction; ?>
											</a>
										</li>
										<li>
											<a href="<?php echo $download; ?>">
												<?php echo $text_download; ?>
											</a>
										</li>
										<li>
											<a href="<?php echo $logout; ?>">
												<?php echo $text_logout; ?>
											</a>
										</li>
									</ul>
									<?php }  ?>
								</div>
							</li>
							<li>
								<a href="<?php echo $checkout; ?>" class="top-link checkout-link" title="<?php echo $text_checkout; ?>"><span><?php echo $text_checkout; ?></span></a>
							</li>
							<li>
								<a href="<?php echo $shopping_cart; ?>" class="top-link shopping-cart-link" title="<?php echo $text_shopping_cart; ?>"><span><?php echo $text_shopping_cart; ?></span></a>
							</li>
							<li>
								<a href="<?php echo $wishlist; ?>" id="wishlist-total" class="top-link wishlish-link" title="<?php echo $text_wishlist; ?>"><span><?php echo $text_wishlist; ?></span></a>
							</li>
							<li>
								<a href="<?php echo $login; ?>" class="top-link login-link">
									<span><?php echo $text_login; ?></span>
								</a>
							</li>
							
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<div class="main-header">
			<div class="container">
				<div class="logo-search-cart">
					<div class="row">
						<div class="logo col-sm-3">
							<?php if ($logo) { ?>
							<a href="<?php echo $home1; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"></a>
							<?php } else { ?>
							<h1><a href="<?php echo $home1; ?>"><?php echo $name; ?></a></h1>
							<?php } ?>
						</div>
						<div class="top-search col-sm-6">
							<?php echo $search; ?>
						</div>
						<div class="shopping-cart col-sm-3">
							<?php echo $cart; ?>
						</div>
					</div>
				</div>
				<div class="megamenu">
					<?php echo $menu; ?>						
				</div>
			</div>
		</div>	
	</header>
