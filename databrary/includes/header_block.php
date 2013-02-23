<?php
/*
 * File: includes/header_block.php
 * Author: Gladys Chan
 * Description: content displayed in meta header and real header
 */
?>

<div id="meta-header-background"></div>
<div id="meta-header">
    <a class="project" href="http://www.databrary.org"><img src="<?php url_prefix(); ?>images/navdatabrary.png" alt="Databrary">Databrary</a>
    <a class="project" href="http://www.datavyu.org"><img src="<?php url_prefix(); ?>images/navdatavyu.png" alt="Datavyu">Datavyu</a>
    <a class="project" href="http://www.labnanny.org"><img src="<?php 
url_prefix(); ?>images/navlabnanny.png" alt="Labnanny">Labnanny</a>
    <a href="http://www.databrary.org/project/"><span class="misc">THE DATABRARY PROJECT</span></a>
</div>

<header>
    <a href="<?php url_prefix(); ?>"><img id="logo" src="<?php url_prefix(); ?>images/databrary.png" alt="Databrary"></a>
    <nav>
        <ul id="main-nav">
            <li class="main-nav-item<?php if ($title == "About") current_class(); ?>" id="about"><a href="<?php url_prefix(); ?>about">ABOUT DATABRARY</a>
				<ul class="sub-nav">
	                <li><a href="<?php url_prefix(); ?>about#policies">Policies</a></li>
	                <li><a href="<?php url_prefix(); ?>about#community">Community</a></li>
	            </ul>
			</li>
				
            <li class="main-nav-item<?php if ($title == "FAQ") current_class(); ?>" id="faq"><a href="<?php url_prefix(); ?>faq">FAQ</a></li>
            <li class="main-nav-item<?php if ($title == "Development") current_class(); ?>" id="development"><a href="http://github.com/databrary" target="_blank">DEVELOPMENT</a></li>
        </ul>
    </nav>
</header>

<hr>

<section>
