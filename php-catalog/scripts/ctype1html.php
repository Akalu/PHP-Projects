<?php

require_once "util.php";

function printtablesheader($f)
{
fputs($f, "<table border=1 align=center UNIT=RELATIVE  width=100%>>\n");
}

function printtablesend($f)
{
fputs($f, "</table>\n");
}

function printcatalogsrow($f,$value,$uri)
{
fputs($f, "<tr><td><a href=\" $uri \"> $value </a></td><tr> \r\n");
}


function printheader($f,$stitle)
{
// printing html header and main title
fputs($f, "<html>\n");
fputs($f, "<head>\n");
fputs($f, "<title>".$stitle."</title>\n");
fputs($f, "<META http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n");
//fputs($f, "<BODY LINK=\"#000000\" ALINK=\"#001060\" VLINK=\"#001040\"> \n");
}


function printend($f)
{
fputs($f, "</body> \n");
fputs($f, "</html>\n");
}


function printbooktable ($f,$res)
{


// socking the data from db and putting it into output using html tags
// printing 1st line
fputs($f,  "<h3 ALIGN=CENTER>  Books </h3>\n");
fputs($f, "<table border=1 align=center UNIT=RELATIVE  width=100%>\n");
fputs($f,  "<tr>\n <td>ID</td> <td>Author</td> <td>Title</td> <td>Year</td> <td>Publisher</td> <td>Pages</td>  <td>ISBN</td> </tr>\n");
// printing rows
$i=0;
while( $row=$res->fetchArray())
{
if ($i%2==0) $bgcolor="D0FFD0";else $bgcolor="FFFFFF";

//$bgcolor="FFFFFF";
// converting names orders
$a_fn=$row['author_fn1'];
$a_sn=$row['author_sn1'];
$aname1=ordername($a_fn, $a_sn);
$a_fn=$row['author_fn2'];
$a_sn=$row['author_sn2'];
$aname2=ordername($a_fn, $a_sn);
$a_fn=$row['author_fn3'];
$a_sn=$row['author_sn3'];
$aname3=ordername($a_fn, $a_sn);
$a1=$aname1." ".$aname2." ".$aname3;

$str="<tr bgcolor=".$bgcolor."><td>".$i."</td><td>".$a1."</td><td><a href=".$row['filelink'].">".$row['title']."</a></td><td>".$row['year']."</td><td>".$row['pages']."</td><td>".$row['publisher_name']."</td><td>".$row['isbn']."</td></tr>";
//echo "$str \n" ;
fputs($f, $str);$i++;
}
fputs($f, "</table>\n");

};

?>
