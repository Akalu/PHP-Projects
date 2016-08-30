<?php

require_once "util.php";


function printarticletable($f,$res)
{


// socking the data from db and putting it into output using html tags
// printing 1st line
fputs($f,  "<h3 align=center>Articles </h3> \n");
fputs($f, "<table border=1 align=center UNIT=RELATIVE width=100%>\n");
fputs($f,  "<tr>\n <td>ID</td><td>Acronym</td><td>arXive ID</td>  <td>Author</td> <td>Title</td> <td>Ref.J</td> </tr>\n");
// printing rows
$i=0;
while( $row=$res->fetchArray())
{
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

//form one record
fputs($f, "<tr bgcolor=".$bgcolor."><td>".$i."</td><td>".$row['category']."</td><td>".$row['arxive_id']."</td><td>".$a1."</td><td><a href=".$row['filelink'].">".$row['article_title']."</a></td><td></td></tr>");
$i++;
}
fputs($f, "</table>\n");

};

?>
