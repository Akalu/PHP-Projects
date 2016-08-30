<?php
define("DB","./dbooks2");
define("ROOT_DIR","../index_txt/");
define("CATALOG","../index_txt/cat.txt");

require "ctype1txt.php";
require "ctype2txt.php";

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

$res = $db->query("select subj_code, output_filename, code_descr, books_edition_table_name, books_main_table_name, articles_table_name from subject left join reflection on subject.table_id=reflection.table_id;");

if (!$res) { 
echo "Error with query: $squery\n";
return; 
 }

/*
$sql="select id, author.firstname as author_fn, author.surname as author_sn, title,subj_code, filelink from '$maintable' left join multiauthor on '$maintable'.author_id=multiauthor.author_id left join '$edtable' on '$maintable'.edition_id='$edtable'.edition_id left join publisher on '$edtable'.publisher_id=publisher.publisher_id where subj_code='$subj' order by author_sn;";
*/


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

//echo "parsed: $title,$db_btable,$bsym \n";

printindex($cat,$title,$fnm);
$fnm=ROOT_DIR.$fnm;
$f = fopen ($fnm,"w");
printheader($f,$title);

//printing book section

$statement = $db->prepare("select id, a1.firstname as author_fn1, a1.surname as author_sn1,  a2.firstname as author_fn2, a2.surname as author_sn2, a3.firstname as author_fn3, a3.surname as author_sn3, title,subj_code, filelink from $maintable left join multiauthor on $maintable.author_id=multiauthor.author_id left join author as a1 on multiauthor.author1_id=a1.author_id  left join author as a2 on multiauthor.author2_id=a2.author_id left join author as a3 on multiauthor.author3_id=a3.author_id left join $edtable on $maintable.edition_id=$edtable.edition_id left join publisher on $edtable.publisher_id=publisher.publisher_id where subj_code=:subj order by author_sn1;");

$statement1 = $db->prepare("select id, a1.firstname as author_fn1, a1.surname as author_sn1,  a2.firstname as author_fn2, a2.surname as author_sn2, a3.firstname as author_fn3, a3.surname as author_sn3, title, filelink from $atable  left join multiauthor on $atable.author_id=multiauthor.author_id  left join author as a1 on multiauthor.author1_id=a1.author_id  left join author as a2 on multiauthor.author2_id=a2.author_id left join author as a3 on multiauthor.author3_id=a3.author_id  where subj_code=:subj order by author_sn1;");


//$statement->bindValue(':maintable', $maintable);
//$statement->bindValue(':edtable', $edtable);
$statement->bindValue(':subj', $subj);

$result = $statement->execute();


//debugging
//echo "$statement \n";

printbooktable($f,$result);

$statement->reset();

// printing article section


//$statement1->bindValue(':atable', $atable);
$statement1->bindValue(':subj', $subj);

$result = $statement1->execute();


//debugging
//echo "$statement1 \n";

fputs($f,  "__________________________________________________\n");
printarticletable($f,$result);

$statement1->reset();

fclose($f);
}

fclose($cat);
?>
