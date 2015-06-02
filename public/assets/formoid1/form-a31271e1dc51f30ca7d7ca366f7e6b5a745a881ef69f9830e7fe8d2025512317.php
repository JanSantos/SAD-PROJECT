<?php

define('EMAIL_FOR_REPORTS', 'gillieneong@gmail.com');
define('RECAPTCHA_PRIVATE_KEY', '@privatekey@');
define('FINISH_URI', 'http://');
define('FINISH_ACTION', 'message');
define('FINISH_MESSAGE', 'Success!');
define('UPLOAD_ALLOWED_FILE_TYPES', 'doc, docx, xls, csv, txt, rtf, html, zip, jpg, jpeg, png, gif');

define('_DIR_', str_replace('\\', '/', dirname(__FILE__)) . '/');
require_once _DIR_ . '/handler.php';

?>

<?php if (frmd_message()): ?>
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-default-skyblue.css" type="text/css" />
<span class="alert alert-success"><?php echo FINISH_MESSAGE; ?></span>
<?php else: ?>
<!-- Start Formoid form-->
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-default-skyblue.css" type="text/css" />
<script type="text/javascript" src="<?php echo dirname($form_path); ?>/jquery.min.js"></script>
<form class="formoid-default-skyblue" style="background-color:#FFFFFF;font-size:14px;font-family:Arial,Helvetica,sans-serif;color:#666666;max-width:600px;min-width:150px" method="post"><div class="title"><h2></h2></div>
	<div class="element-select<?php frmd_add_class("select"); ?>"><label class="title">Select Journal<span class="required">*</span></label><div class="large"><span><select name="select" required="required">

		<option value="Budhi">Budhi</option>
		<option value="Journal of Management for Global Sustainability">Journal of Management for Global Sustainability</option>
		<option value="Kritika Kultura">Kritika Kultura</option>
		<option value="Landas">Landas</option>
		<option value="Perspectives in the Arts and Humanities Area">Perspectives in the Arts and Humanities Area</option>
		<option value="Philippine Studies">Philippine Studies</option>
		<option value="Ateneo Chinese Studies Program">Ateneo Chinese Studies Program</option>
		<option value="AIKS Korean Studies Conference Proceedings">AIKS Korean Studies Conference Proceedings</option></select><i></i></span></div></div>
	<div class="element-select<?php frmd_add_class("select1"); ?>"><label class="title">Duration<span class="required">*</span></label><div class="large"><span><select name="select1" required="required">

		<option value="Annual">Annual</option>
		<option value="Bi-annual">Bi-annual</option></select><i></i></span></div></div>
	<div class="element-radio<?php frmd_add_class("radio"); ?>"><label class="title">Payment Status<span class="required">*</span></label>		<div class="column column1"><label><input type="radio" name="radio" value="Paid" required="required"/><span>Paid</span></label><label><input type="radio" name="radio" value="Unpaid" required="required"/><span>Unpaid</span></label></div><span class="clearfix"></span>
</div>
<div class="submit"><input type="submit" value="Submit"/></div></form><script type="text/javascript" src="<?php echo dirname($form_path); ?>/formoid-default-skyblue.js"></script>

<!-- Stop Formoid form-->
<?php endif; ?>

<?php frmd_end_form(); ?>