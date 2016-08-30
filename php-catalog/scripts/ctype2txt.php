<?php

require_once "util.php";



// Main function
function printarticletable($f,$res)
{



// socking the data from db and putting it into output

// printing 1st line
fputs($f,  "Articles\n");
fputs($f,  "ID,Author,Title\n");

// printing rows
$i=0;
while( $row=$res->fetchArray())
{
//reserved for HTML output
if ($i%2==0) $bgcolor="D0FFD0";else $bgcolor="FFFFFF";

// converting names
$a_fn=$row['author_fn1'];
$a_sn=$row['author_sn1'];
$aname1=createstrname($a_fn, $a_sn);
$a_fn=$row['author_fn2'];
$a_sn=$row['author_sn2'];
$aname2=createstrname($a_fn, $a_sn);
$a_fn=$row['author_fn3'];
$a_sn=$row['author_sn3'];
$aname3=createstrname($a_fn, $a_sn);
$a2=$aname1." ".$aname2." ".$aname3;

$a1=anormal(20,0,$a2);
$tt=$row['title'];$tt=anormal(60,0,$tt);
$fl=$row['filelink'];$cut_pos=strpos($fl,"./",0);
$ln=strlen($fl);$fl=substr($fl,$cut_pos+1,$ln-$cut_pos-1);
$fl=anormal(24,0,$fl);

$str=$i." ".$a1." ".$tt." ".$fl."\n" ;
fputs($f, $str);$i++;
}
fputs($f, "Total articles: $i\n");

};

?>
