<?php
/*
 * File: includes/css_js.php
 * Author: Gladys Chan
 * Description: include css and js in head
 */
?>
<link rel="stylesheet" type="text/css" href="<?php url_prefix(); ?>css/main.css">
<script src="<?php url_prefix(); ?>js/jquery-1.8.3.min.js"></script>
<script src="<?php url_prefix(); ?>js/nav.js"></script>
<?php /* Include style sheet and slideshow scripts in home page */
if (isset($title)) {
    if ($title == "Datavyu") { ?>
<link rel="stylesheet" type="text/css" href="<?php url_prefix(); ?>css/home.css">
<script src="<?php url_prefix(); ?>js/slides.jquery.js"></script>
<script src="<?php url_prefix(); ?>js/slideshow.js"></script>
<?php
    } else { /* Include corresponding style sheet of a child page */
?>
<link rel="stylesheet" type="text/css" href="<?php url_prefix(); ?>css/<?php $lower_title = strtolower($title); echo $lower_title; ?>.css">
<?php
    }
}
?>
