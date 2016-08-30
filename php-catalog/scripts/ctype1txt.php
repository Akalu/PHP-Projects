<?php

require_once "util.php";


function printheader($f,$stitle)
{
// printing UTF-8 txt header and main title
$signature=base_convert('EF',16,10);
fputs($f,chr($signature));
$signature=base_convert('BB',16,10);
fputs($f,chr($signature));
$signature=base_convert('BF',16,10);
fputs($f,chr($signature));
fputs($f, "\"$stitle\"\n");
}

function printindex($f,$stitle,$fl)
{

fputs($f, "$stitle,$fl \r\n");
}


function printend($f)
{
}


// this function prints data from 1 table
function printbooktable ($f,$res)
{


// printing 1st line
fputs($f,  "Books: \n");
fputs($f,  "ID,Author,Title\n");
// printing rows
$i=0;
while( $row=$res->fetchArray())
{
//reserved for HTML output
//if ($i%2==0) $bgcolor="D0FFD0";else $bgcolor="FFFFFF";
//$bgcolor="FFFFFF";

// converting names
$a_fn=$row['author_fn1'];
$a_sn=$row['author_sn1'];
$aname1=ordername($a_fn, $a_sn);
$a_fn=$row['author_fn2'];
$a_sn=$row['author_sn2'];
$aname2=ordername($a_fn, $a_sn);
$a_fn=$row['author_fn3'];
$a_sn=$row['author_sn3'];
$aname3=ordername($a_fn, $a_sn);
$a2=$aname1." ".$aname2." ".$aname3;


//normalise name if empty
$len=strlen($a2);
if ($len==0)
{
$a2="   -   ";
}

$a1=$row['filelink'];
$len=strlen($a1);
$segm=3;
$cut_pos=strpos($a1,".",$segm);
if ($cut_pos==0)
{
$cut_pos=4;
}
$a1=substr($a1,$cut_pos-4,$len-$cut_pos+1);
$a1=normal(4,$a1);
$tt=$row['title'];
//$tt=normal(65,$tt);
$str=$a1." ".$a2."   ".$tt."\n" ;
fputs($f, $str);$i++;
}
fputs($f, "Total books: $i\n");

};

?>
