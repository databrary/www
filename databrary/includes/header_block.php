<?php
/*
 * File: includes/header_block.php
 * Author: Gladys Chan
 * Description: content displayed in meta header and real header
 */
?>

<!-- Lightbox subscriber form -->
<div id="subscriber" style="width:400px;display:none;">
	<p>Join our mailing list to be notified of the latest news from Databrary!</p>
<!-- Begin MailChimp Signup Form -->
<div id="mc_embed_signup">
	<form action="http://databrary.us2.list-manage.com/subscribe/post?u=4b4fa9408b40cd79e92f748e5&amp;id=94241ee61f" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>

		<div class="mc-field-group">
			<label for="mce-EMAIL">Email Address </label>
			<input type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL">
		</div>
		<div class="mc-field-group">
			<label for="mce-FNAME">First Name </label>
			<input type="text" value="" name="FNAME" class="" id="mce-FNAME">
		</div>
		<div class="mc-field-group">
			<label for="mce-LNAME">Last Name </label>
			<input type="text" value="" name="LNAME" class="" id="mce-LNAME">
		</div>
		<div class="mc-field-group input-group">
			<strong>Email Format </strong>
			<ul><li><input type="radio" value="html" name="EMAILTYPE" id="mce-EMAILTYPE-0"><label for="mce-EMAILTYPE-0">HTML</label></li>
				<li><input type="radio" value="text" name="EMAILTYPE" id="mce-EMAILTYPE-1"><label for="mce-EMAILTYPE-1">Text</label></li>
				<li><input type="radio" value="mobile" name="EMAILTYPE" id="mce-EMAILTYPE-2"><label for="mce-EMAILTYPE-2">Mobile</label></li>
			</ul>
		</div>
		<div id="mce-responses" class="clear">
			<div class="response" id="mce-error-response" style="display:none"></div>
			<div class="response" id="mce-success-response" style="display:none"></div>
        </div>
        <div class="clear">
            <button type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button">Subscribe</button>
            <button type="reset" value="Reset" name="reset" id="mc-embedded-reset" class="button">Reset</button>
        </div>
	</form>
</div>
<!--End mc_embed_signup-->
</div>
<!-- End Lightbox subscriber form -->


<div id="meta-header-background"></div>
<div id="meta-header">
    <a class="project" href="http://databrary.org"><img src="/images/navdatabrary.png" alt="Databrary">Databrary</a>
    <a class="project" href="http://datavyu.org"><img src="/images/navdatavyu.png" alt="Datavyu">Datavyu</a>
    <a class="project" href="http://labnanny.org"><img src="/images/navlabnanny.png" alt="Labnanny">Labnanny</a>
    <a href="/about#project"><span class="misc">THE DATABRARY PROJECT</span></a>
</div>

<header>
    <a href="/"><img id="logo" src="/images/databrary.png" alt="Databrary"></a>
    <nav>
        <ul id="main-nav">
            <li class="main-nav-item<?php if ($title == "About") echo " current"; ?>" id="about"><a href="/about">ABOUT</a>
				<ul class="sub-nav">
	                <li><a href="/about#project">Project</a></li>
	                <li><a href="/about#policies">Policies</a></li>
	            </ul>
	    </li>
            <li class="main-nav-item<?php if ($title == "Community") echo " current"; ?>" id="community"><a href="/community">COMMUNITY</a></li>
            <li class="main-nav-item<?php if ($title == "FAQ") echo " current"; ?>" id="faq"><a href="/faq">FAQ</a></li>
            <li class="main-nav-item<?php if ($title == "Development") echo " current"; ?>" id="development"><a href="http://github.com/databrary" target="_blank">DEVELOPMENT</a></li>
	    <li class="main-nav-itemSignup" id="subscribe"><a class="fancybox" href="#subscriber">Newsletter</a></li>
        </ul>
    </nav>
</header>

<hr class="secdivide">

<section>
