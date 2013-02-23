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
    if ($title == "Databrary") { ?>
<link rel="stylesheet" type="text/css" href="<?php url_prefix(); ?>css/home.css">
<script src="<?php url_prefix(); ?>js/slides.jquery.js"></script>
<script src="<?php url_prefix(); ?>js/slideshow.js"></script>
<?php
    } else { /* Include corresponding style sheet of a child page */
?>
<link rel="stylesheet" type="text/css" href="<?php url_prefix(); ?>css/<?php $lower_title = strtolower($title); echo $lower_title; ?>.css">
<?php
		if ($title == "Contact") { /* Include contact form css and js */ ?>
<link rel="stylesheet" type="text/css" href="formValidator/validationEngine.jquery.css" />

<?=$css?>
<script type="text/javascript" src="<?php url_prefix(); ?>contact/formValidator/jquery.validationEngine.js"></script>
<?php
		} /* End of contact css and js */
    } /* End of child page css and js */
}
?>
