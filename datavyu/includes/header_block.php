<?php
/*
 * File: includes/header_block.php
 * Author: Gladys Chan
 * Description: content displayed in meta header and real header
 */
?>
<!-- Lightbox subscriber form -->
<div id="subscriber" style="width:400px;display:none;">
    <p>Join our mailing list to be notified of the latest news about Datavyu!</p>
<!-- Begin MailChimp Signup Form -->
<div id="mc_embed_signup">
	<form action="http://databrary.us2.list-manage.com/subscribe/post?u=4b4fa9408b40cd79e92f748e5&amp;id=0b29c1e7b5" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>

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
    <a class="project" href="http://www.databrary.org"><img src="/images/navdatabrary.png" alt="Databrary">Databrary</a>
    <a class="project" href="http://www.datavyu.org"><img src="/images/navdatavyu.png" alt="Datavyu">Datavyu</a>
    <a class="project" href="http://www.labnanny.org"><img src="/images/navlabnanny.png" alt="Labnanny">Labnanny</a>
    <a href="http://www.databrary.org/project/"><span class="misc">THE DATABRARY PROJECT</span></a>
</div>

<header>
    <a href="/"><img id="logo" src="/images/datavyu.png" alt="Datavyu"></a>
    <nav>
        <ul id="main-nav">
            <li class="main-nav-item<?php if ($title == "Download") echo " current"; ?>" id="download"><a href="/download">DOWNLOAD</a></li>
            <li class="main-nav-item<?php if ($title == "Features") echo " current"; ?>" id="features"><a href="/features">FEATURES</a></li>
            <li class="main-nav-item<?php if ($title == "Support") echo " current"; ?>" id="support"><a href="/support">SUPPORT</a>
            </li>
            <li class="main-nav-item<?php if ($title == "Developer") echo " current"; ?>" id="developer"><a href="http://github.com/databrary/datavyu" target="_blank">DEVELOPMENT</a></li>
            <li class="main-nav-item<?php if ($title == "Blog") echo " current"; ?>" id="blog"><a href="/blog">BLOG</a></li>
            <li class="main-nav-itemSignup"><a class="fancybox" href="#subscriber">Join our mailing list</a></li>

        </ul>   
    </nav>
</header>

<hr class="secdivide">

<section>
