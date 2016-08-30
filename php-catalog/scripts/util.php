<?php
// defines order (firstname.surname or vice versa)
define("NAME_REV",1);

// Utility functions for article block
function anormal($nlen,$spos,$str)
{
$lc=strlen($str);
$emp="                                                                      ";

if ($lc > $nlen)
{
$strout=substr($str,0,$nlen);
}
else
{
$str1=substr($emp,0,$nlen-$lc);
$strout=$str.$str1;
}

return($strout);

}

function createstrname($a_fn,$a_sn)
{
// set names part separator 
if (strlen($a_fn)==0 || strlen($a_sn)==0){
$n_sep="";
}else{
$n_sep=".";
}
// article's name order - always firstname.secondname
$a2=$a_fn.$n_sep." ".$a_sn;
return $a2;
}

function normal($nlen,$str)
{
$lc=strlen($str);
global $emp;
$emp="                                                                      ";

if ($lc > $nlen)
{
$strout=substr($str,0,$nlen);
}
else
{
$str1=substr($emp,0,$nlen-$lc);
$strout=$str.$str1;
}

return($strout);

}

function ordername($a_fn,$a_sn)
{
// set names part separator 
if (strlen($a_fn)==0 || strlen($a_sn)==0){
$n_sep="";
}else{
$n_sep=".";
}

if (NAME_REV==1)
{
$a2=$a_sn." ".$a_fn.$n_sep;
}else{
$a2=$a_fn.$n_sep." ".$a_sn;
}
return $a2;
}

?>
