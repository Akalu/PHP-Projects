<?php

$l=file("authors.sq");
$nrec=count($l);
echo "records: $nrec \n";
global $f;
$f = fopen (multiauthor,"w");
$f1 = fopen (multiauthor1,"w");

$j=0;
while($j<($nrec-2))
{
global $fnm;
$p1=strpos($l[$j],"|");$author_id = substr($l[$j],0,$p1);
$p11=strpos($l[$j+1],"|");$author_id1 = substr($l[$j+1],0,$p11);
$p12=strpos($l[$j+2],"|");$author_id2 = substr($l[$j+2],0,$p12);
//1st auth
$aa1=$author_id."|".$author_id; $aa2="";$aa3="";
$sign1=substr($author_id1,0,2);
if (($sign1 == "22"||$sign1 == "23"||$sign1 == "24"||$sign1 == "25"||$sign1 == "26"||$sign1 == "27"||$sign1 == "28"||$sign1 == "29") && strlen($author_id1)==4){ $aa2=$author_id1; $j++;
fputs($f1,"$aa2|$aa2||  \r\n");
$sign2=substr($author_id2,0,2);
if (( $sign2 == "22"|| $sign2 == "23"|| $sign2 == "24"|| $sign2 == "25"|| $sign2 == "26"|| $sign2 == "27"|| $sign2 == "28"|| $sign2 == "29")&& strlen($author_id2)==4){ $aa3=$author_id2; $j++;
fputs($f1,"$aa3|$aa3||  \r\n");
}
}
fputs($f,"$aa1|$aa2|$aa3  \r\n");
$j++;
//echo "parsed: $author_id,$a1,$a2 \n";
}

fclose($f);
fclose($f1);
?>