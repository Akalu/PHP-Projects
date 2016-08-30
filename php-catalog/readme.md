
What is it?  
===============


This is a catalog system and a simple command-line application which creates it.

This project is written to demonstrate the easiness and power of  PHP in the role of <it>ordinal scripting language </it>, as well as the speed and simplicity of SQlite embedded database. 


Overview 
=============

 In this project a simple php-script generates an index for  the [fictitious] local collection of books and journals. 

There are many  interpreted languages: Perl, Python, which  used to accomplish this aim, so why PHP?

Just to show also one role that PHP can play - effective replacement of/addition to the Perl/Python. 

In fact, PHP  is a truly  general-purpose  language.  It is especially suited for working with text data (strings) in general and  HTML  in particular, with databases, etc. Generating indexes, processing text files, some kind of structural actions are natural apply points for PHP. 


The key components of represented  catalog system are the database and a set of php-scripts.

The database consists from 25 tables and has an optimal, balanced structure. The database can be easily scaled (to guess how this can be achieved, take a look at the database's structure -  ERD.png). I decided to use embedded database SQlite in my project because of its fastness and very small size. Additionally, SQlite's dialect close to "canonical" standard such as MySQL.  Hence, all the written SQL queries can be reused  without rewriting or with a very little changes.


Project's files description.
=============================

Files ctype1txt.php, ctype1html.php – contain code generating books-related tables.
Files ctype2txt.php, ctype2html.php – contain code generating articles-related tables.

File  util.php – contains the utility functions.

The main scripts:

gentxtdb.php, genhtmldb.php – establishes database connection, defines SQL - queries, etc.



System Requirements  
===================== 
In order to run this  php script the following software is needed. 

* PHP 5.4 or later 

Note: for correct working you should have an appropriate SQlite extension DLL for PHP, namely php_sqlite3.dll,  into PHP_HOME/extensions directory (for Windows).


* Sqlite 3.0 or later (http://www.sqlite.org)



Running script
======================== 

To generate index in the form of separated txt files (suitable for such devices as readers, tablets, etc), type the following command from the project's root directory:

for windows: gentxtbase.bat, for linux:  gentxtbase.sh

The index will be created in the index_txt directory.

To generate index in the form of interconnected hypertext files, type the following command from the project's root directory:

for windows: genhtmlbase.bat
for linux:  genhtmlbase.sh

The site will be created in the index_html directory.
Open index_html/index.htm file in any browser (It is the main page, that depicts  the category list).


MySQL schema
========================
The second variant of the sql script which creates a database's schema was adopted for MySQL's dialect (see the db/mysql_schema.sql file).

