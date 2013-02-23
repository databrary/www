<?php
/*
 * File: includes/functions.php
 * Author: Gladys Chan
 * Description: useful functions
 * Note: do not confuse with functions.php in Wordpress theme
 */

/* Add prefix to urls for pages not in root directory */
function url_prefix()
{
    echo "http://staging.databrary.org/";
}

/* Add class attribute with value current */
function current_class()
{
    echo ' current';
}
?>
