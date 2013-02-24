<?php
/*
 * File: includes/header_block.php
 * Author: Gladys Chan
 * Description: content displayed in meta header and real header
 */
?>

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
        </ul>   
    </nav>
</header>

<hr class="secdivide">

<section>
