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
    <a href="<?php url_prefix(); ?>"><img id="logo" src="<?php url_prefix(); ?>images/datavyu.png" alt="Datavyu"></a>
    <nav>
        <ul id="main-nav">
            <li class="main-nav-item<?php if ($title == "Download") current_class(); ?>" id="download"><a href="<?php url_prefix(); ?>download">DOWNLOAD</a></li>
            <li class="main-nav-item<?php if ($title == "Features") current_class(); ?>" id="features"><a href="<?php url_prefix(); ?>features">FEATURES</a></li>
            <li class="main-nav-item<?php if ($title == "Support") current_class(); ?>" id="support"><a href="<?php url_prefix(); ?>support">SUPPORT</a>
            </li>
            <li class="main-nav-item<?php if ($title == "Developer") current_class(); ?>" id="developer"><a href="http://github.com/databrary/datavyu" target="_blank">DEVELOPMENT</a></li>
            <li class="main-nav-item<?php if ($title == "Blog") current_class(); ?>" id="blog"><a href="<?php url_prefix(); ?>blog">BLOG</a></li>
        </ul>   
    </nav>
</header>

<hr class="secdivide">

<section>
