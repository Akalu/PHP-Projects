<?php
define("DB","./dbooks2");
define("ROOT_DIR","../index_html/");
define("CATALOG","../index_html/index.htm");

require "ctype1html.php";
require "ctype2html.php";

/////    open sql db
$db = new SQLite3(DB);
if (!$db) {

  echo "Could not open database\n";
  echo $errmessage;
  exit;
}
else {
  echo "SQLite database  opened\n";
}

global $cat;
$cat = fopen (CATALOG,"w");
printheader($cat,"Main page");
printtablesheader($cat);


$res = $db->query("select subj_code, output_filename, code_descr, books_edition_table_name, books_main_table_name, articles_table_name from subject left join reflection on subject.table_id=reflection.table_id;");

if (!$res) { 
echo "Error with query";
return; 
 }



echo "creating  index files...\r\n";
$i=0;
while( $row=$res->fetchArray())
{
//set variables
$title=$row['code_descr'];
$fnm=$row['output_filename'];
$maintable=$row['books_main_table_name'];
$edtable=$row['books_edition_table_name'];
$subj=$row['subj_code'];
$atable=$row['articles_table_name'];

//correct extension for the file name
$dot_pos=strpos($fnm,".",0);
$fnm=substr($fnm,0,$dot_pos);
$fnm=$fnm.".htm";

printcatalogsrow($cat,$title,$fnm);


//echo "parsed: $title,$db_btable,$bsym \n";


$fnm=ROOT_DIR.$fnm;
$f = fopen ($fnm,"w");
printheader($f,$title);

//printing book section
$statement = $db->prepare("select id, a1.firstname as author_fn1, a1.surname as author_sn1,  a2.firstname as author_fn2, a2.surname as author_sn2, a3.firstname as author_fn3, a3.surname as author_sn3, title,subj_code, filelink, pages, year, isbn, name as publisher_name from $maintable left join multiauthor on $maintable.author_id=multiauthor.author_id left join author as a1 on multiauthor.author1_id=a1.author_id  left join author as a2 on multiauthor.author2_id=a2.author_id left join author as a3 on multiauthor.author3_id=a3.author_id left join $edtable on $maintable.edition_id= $edtable.edition_id left join publisher on $edtable.publisher_id=publisher.publisher_id where subj_code=:subj order by author_sn1;");

$statement1 = $db->prepare("select id, a1.firstname as author_fn1, a1.surname as author_sn1,  a2.firstname as author_fn2, a2.surname as author_sn2, a3.firstname as author_fn3, a3.surname as author_sn3, $atable.title as article_title, filelink, category, arxive_id, jref.title as jtitle from $atable  left join journal as jref on jref.journal_id=$atable.ref_journal left join multiauthor on $atable.author_id=multiauthor.author_id  left join author as a1 on multiauthor.author1_id=a1.author_id  left join author as a2 on multiauthor.author2_id=a2.author_id left join author as a3 on multiauthor.author3_id=a3.author_id  where subj_code=:subj order by author_sn1;");


$statement->bindValue(':subj', $subj);

$result = $statement->execute();


//for debugging purpose
//echo "$sql \n";

printbooktable($f,$result);

$statement->reset();

// printing article section

$statement1->bindValue(':subj', $subj);

$result = $statement1->execute();

//for debugging purpose
//echo "$sql \n";

printarticletable($f,$result);

$statement1->reset();

printend($f);
fclose($f);
}

printtablesend($cat);
printend($cat);
fclose($cat);
?>
