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
	<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
	<link href="catalog/view/theme/modern/stylesheet/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/owl.carousel.2.0.0-beta.2.4/assets/owl.carousel.css">
	<link href="catalog/view/theme/modern/stylesheet/bootstrap.css" rel="stylesheet">
	<link href="catalog/view/theme/modern/stylesheet/stylesheet.css" rel="stylesheet"> 
	<link href="catalog/view/theme/modern/stylesheet/style.css" rel="stylesheet">
	<?php foreach ($styles as $style) { ?>
	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	<script src="catalog/view/javascript/jquery.jCounter-0.1.4.js" type="text/javascript"></script>
	<script type="text/javascript" src="catalog/view/javascript/owl.carousel.2.0.0-beta.2.4/owl.carousel.min.js"></script>
	<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/modern.js" type="text/javascript"></script>
	<?php foreach ($scripts as $script) { ?>
	<script src="<?php echo $script; ?>" type="text/javascript"></script>
	<?php } ?>
</head>
<body class="<?php echo $class; ?>">	
	<header class="header header-2">
		<div class="container">
			<nav id="top" class="top">
				<div class="row">
					<div class="top-left col-sm-6">
						<ul class="welcome-text">
							<li>Default welcome msg!</li>
							<li>Call : <?php echo $telephone; ?></li>
						</ul>
					</div>
					<div class="top-right col-sm-6">
						<ul class="top-navigation">
							<li class="top-search visible-xs hidden-sm hidden-md hidden-lg">
								<?php echo $search; ?>
							</li>						
							<li class="dropdown shopping-cart visible-xs hidden-sm hidden-md hidden-lg">
								<?php echo $cart; ?>
							</li>
							<li class="dropdown language">
								<?php echo $language; ?>
							</li>
							<li class="dropdown my-account">
								<div class="btn-group">
									<button href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
										<a href="#" class="top-icon account-icon"><?php echo $text_account; ?><i class="fa fa-angle-down"></i></a>
									</button>
									<ul class="dropdown-menu dropdown-menu-right">
										<?php if ($logged) { ?>
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
										<?php } else { ?>
										<li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a></li>
										<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span><?php echo $text_shopping_cart; ?></span></a></li>
										<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span><?php echo $text_checkout; ?></span></a></li>
										<li>
											<a href="<?php echo $login; ?>">
												<i class="fa fa-unlock-alt"></i><span><?php echo $text_login; ?></span>
											</a>
										</li>
										<?php } ?>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</nav>

			<div class="logo">
				<?php if ($logo) { ?>
					<a href="<?php echo $home2; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
				<?php } else { ?>
					<h1><a href="<?php echo $home2; ?>"><?php echo $name; ?></a></h1>
					<?php } ?>
			</div>

			<div class="megamenu-wrapper clearfix">
				<?php echo $menu; ?>
				<div class="top-search-cart visible-sm visible-md visible-lg">
					<div class="top-search">
						<?php echo $search; ?>
					</div>						
					<div class="dropdown shopping-cart">
						<?php echo $cart; ?>
					</div>
				</div>	
			</div>
		</div>
	</header>
