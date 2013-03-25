<?php
/*
 *  File: contact/index.php
 *  Author: Gladys Chan 
 *  Description: contact form
 *  Adapted from: http://demo.tutorialzine.com/2009/09/fancy-contact-form/demo.php
 */

$title = "Contact";

$n1 = rand(1,20);
$n2 = rand(1,20);

/* config start */

$emailAddress = 'contact@databrary.org';

/* config end */


$err = array();    
$success = 0;
$css = '';
if(array_key_exists('expect',$_POST)){
date_default_timezone_set('America/New_York');
    require "phpmailer/class.phpmailer.php";

	if(!checkLen('name'))
		$err[]='The name field is too short or empty.';

	if(!checkLen('email'))
		$err[]='The email field is too short or empty.';
	else if(!checkEmail($_POST['email']))
		$err[]='Your email is invalid.';

	if(!checkLen('subject'))
		$err[]='You have not filled in the subject.';

	if(!checkLen('message'))
		$err[]='The message field is too short or empty.';

	if((int)$_POST['captcha'] != $_POST['expect'])
		$err[]='Incorrect math. Please try again.';


	if(!count($err))
	{

		$msg=
			'Name:	'.$_POST['name'].'<br />
			Email:	'.$_POST['email'].'<br />
			IP:	'.$_SERVER['REMOTE_ADDR'].'<br /><br />

			Message:<br /><br />

			'.nl2br($_POST['message']).'

			';


		$mail = new PHPMailer();
		$mail->IsMail();

		$mail->AddReplyTo($_POST['email'], $_POST['name']);
		$mail->AddAddress($emailAddress);
		$mail->SetFrom($_POST['email'], $_POST['name']);
		$mail->Subject = "Datavyu contact form msg from ".$_POST['name']." | ".$_POST['subject'];

		$mail->MsgHTML($msg);

		$mail->Send();
           
		$success = 1; 
	    $css='<style type="text/css">#contact-form{display:none;}</style>';
		
	}
}    
else 
{
$_POST['name']='';
$_POST['email']='';
$_POST['message']='';
}

function checkLen($str,$len=2)
{
	return isset($_POST[$str]) && mb_strlen(strip_tags($_POST[$str]),"utf-8") > $len;
}

function checkEmail($str)
{
	return preg_match("/^[\.A-z0-9_\-\+]+[@][A-z0-9_\-]+([.][A-z0-9_\-]+)+[A-z]{1,4}$/", $str);
}

require "../includes/header.php";
?>

<h1>Contact Datavyu</h1>
	<p>For troubleshooting and any technical assistance, please visit the <a href="../support/">support forum</a>.		Otherwise, send us a message and we will get back to you shortly.</p>  
<div id="contact-container">

	<div class="form-container">
	<?php if(!$success) print("<h2>Send us a message</h2>"); ?>

    
    <form id="contact-form" name="contact-form" method="post" >
      <table width="100%" border="0" cellspacing="0" cellpadding="5">
        <tr>
          <td width="15%"><label for="name">Name</label></td>
          <td width="70%"><input type="text" class="validate[required,custom[onlyLetter]]" name="name" id="name" value="<?=$_POST['name']?>" /></td>
          <td width="15%" id="errOffset">&nbsp;</td>
        </tr>
        <tr>
          <td><label for="email">Email</label></td>
          <td><input type="text" class="validate[required,custom[email]]" name="email" id="email" value="<?=$_POST['email']?>" /></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><label for="subject">Subject</label></td>
          <td><input type="text" class="validate[required]" name="subject" id="subject"/></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td valign="top"><label for="message">Message</label></td>
          <td><textarea name="message" id="message" class="validate[required]" cols="35" rows="5"><?=$_POST['message']?></textarea></td>
          <td valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td><label for="captcha"><?=$n1?> + <?=$n2?> =</label></td>
          <td><input type="text" class="validate[required,custom[onlyNumber]]" name="captcha" id="captcha" /></td>
          <td valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td valign="top">&nbsp;</td>
          <td colspan="2"><input type="submit" name="button" id="button" value="Submit" />
          <input type="reset" name="button2" id="button2" value="Reset" />
	  <input type='hidden' name='expect' value='<?=$n1+$n2?>'/>
        </tr>
      </table>
      </form>    
   	<?php if(count($err)){
			   print("<div class='error'>" . implode('<br />',$err) . "</div>");

		}?>
      <?php if($success) print('<h2>Your message has been sent.</h2>');?>
    </div>
</div>
<div id="loc-container">
	<div class="form-container">
		<h2>Office Location</h3>
		<p>Attn: Databrary<br/>196 Mercer St., 8th Floor, Room 807<br/>New York, NY 10012</p>
	</div>
</div>
<?php require "../includes/footer.php" ?>
