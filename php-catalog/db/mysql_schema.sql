drop database booksdb;
CREATE database booksdb;
use booksdb;

CREATE table author (
author_id int unsigned  not null PRIMARY KEY, 
firstname char(32),
surname char(48)
);

CREATE table multiauthor (
author_id int unsigned  not null PRIMARY KEY, 
author1_id int unsigned,
author2_id int unsigned,
author3_id int unsigned,
KEY author1_id_fk (author1_id), CONSTRAINT author1_id_fk FOREIGN KEY (author1_id) REFERENCES author (author_id),
KEY author2_id_fk (author2_id), CONSTRAINT author2_id_fk FOREIGN KEY (author2_id) REFERENCES author (author_id),
KEY author3_id_fk (author3_id), CONSTRAINT author3_id_fk FOREIGN KEY (author3_id) REFERENCES author (author_id)
);

CREATE table publisher (
publisher_id int unsigned  not null PRIMARY KEY,
 name char(128) not null
);

CREATE table reflection (
table_id  int  unsigned not null PRIMARY KEY, 
books_edition_table_name char(64),
books_main_table_name char(64),
articles_table_name char(64)
);


CREATE table subject (
subj_code char(4)  not null PRIMARY KEY, 
output_filename char(128),
code_descr char(128),
table_id int unsigned,
KEY table_id_fk (table_id), CONSTRAINT table_id_fk FOREIGN KEY (table_id) REFERENCES reflection (table_id)
);




CREATE table language (
code char(2)  not null PRIMARY KEY, 
code_name char(64)
);

CREATE table journal (
journal_id int unsigned  not null PRIMARY KEY, 
title char(128)
);

CREATE table book_on_physics_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned,
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
KEY publisher_id_fk (publisher_id), CONSTRAINT publisher_id_fk FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
KEY lang_code_fk (lang_code), CONSTRAINT lang_code_fk FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_physics (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255), 
edition_id int unsigned,
subj_code char(4),
KEY author_id_fk (author_id), CONSTRAINT author_id_fk FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY edition_id_fk (edition_id), CONSTRAINT edition_id_fk FOREIGN KEY (edition_id) REFERENCES book_on_physics_editions (edition_id),
KEY subj_code_fk (subj_code), CONSTRAINT subj_code_fk FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_on_maths_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
KEY publisher_id_fk2 (publisher_id), CONSTRAINT publisher_id_fk2 FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
KEY lang_code_fk2 (lang_code), CONSTRAINT lang_code_fk2 FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_maths (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
KEY author_id_fk2 (author_id), CONSTRAINT author_id_fk2 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY edition_id_fk2 (edition_id), CONSTRAINT edition_id_fk2 FOREIGN KEY (edition_id) REFERENCES book_on_maths_editions (edition_id),
KEY subj_code_fk2 (subj_code), CONSTRAINT subj_code_fk2 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_on_cscience_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
KEY publisher_id_fk3 (publisher_id), CONSTRAINT publisher_id_fk3 FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
KEY lang_code_fk3 (lang_code), CONSTRAINT lang_code_fk3 FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_cscience (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
KEY author_id_fk3 (author_id), CONSTRAINT author_id_fk3 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY edition_id_fk3 (edition_id), CONSTRAINT edition_id_fk3 FOREIGN KEY (edition_id) REFERENCES book_on_cscience_editions (edition_id),
KEY subj_code_fk3 (subj_code), CONSTRAINT subj_code_fk3 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_on_misc_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
KEY publisher_id_fk4 (publisher_id), CONSTRAINT publisher_id_fk4 FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
KEY lang_code_fk4 (lang_code), CONSTRAINT lang_code_fk4 FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_misc (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
KEY author_id_fk4 (author_id), CONSTRAINT author_id_fk4 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY edition_id_fk4 (edition_id), CONSTRAINT edition_id_fk4 FOREIGN KEY (edition_id) REFERENCES book_on_misc_editions (edition_id),
KEY subj_code_fk4 (subj_code), CONSTRAINT subj_code_fk4 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_on_astronomy_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
KEY publisher_id_fk5 (publisher_id), CONSTRAINT publisher_id_fk5 FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
KEY lang_code_fk5 (lang_code), CONSTRAINT lang_code_fk5 FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_astronomy (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
KEY author_id_fk5 (author_id), CONSTRAINT author_id_fk5 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY edition_id_fk5 (edition_id), CONSTRAINT edition_id_fk5 FOREIGN KEY (edition_id) REFERENCES book_on_astronomy_editions (edition_id),
KEY subj_code_fk5 (subj_code), CONSTRAINT subj_code_fk5 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_generic_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
KEY publisher_id_fk6 (publisher_id), CONSTRAINT publisher_id_fk6 FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
KEY lang_code_fk6 (lang_code), CONSTRAINT lang_code_fk6 FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_generic (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
KEY author_id_fk6 (author_id), CONSTRAINT author_id_fk6 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY edition_id_fk6 (edition_id), CONSTRAINT edition_id_fk6 FOREIGN KEY (edition_id) REFERENCES book_generic_editions (edition_id),
KEY subj_code_fk6 (subj_code), CONSTRAINT subj_code_fk6 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_biography_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
KEY publisher_id_fk7 (publisher_id), CONSTRAINT publisher_id_fk7 FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
KEY lang_code_fk7 (lang_code), CONSTRAINT lang_code_fk7 FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_biography (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
KEY author_id_fk7 (author_id), CONSTRAINT author_id_fk7 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY edition_id_fk7 (edition_id), CONSTRAINT edition_id_fk7 FOREIGN KEY (edition_id) REFERENCES book_biography_editions (edition_id),
KEY subj_code_fk7 (subj_code), CONSTRAINT subj_code_fk7 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table article_math (
id int unsigned  not null PRIMARY KEY,
category char(16),
arxive_id char(16),
author_id int unsigned, 
title char(255) not null, 
ref_journal  int unsigned, 
filelink char(128),
subj_code char(4),
KEY author_id_fk8 (author_id), CONSTRAINT author_id_fk8 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY ref_journal_fk8 (ref_journal), CONSTRAINT ref_journal_fk8 FOREIGN KEY (ref_journal) REFERENCES journal (journal_id),
KEY subj_code_fk8 (subj_code), CONSTRAINT subj_code_fk8 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table article_physics (
id int unsigned  not null PRIMARY KEY,
category char(16),
arxive_id char(16),
author_id int unsigned, 
title char(255) not null, 
ref_journal  int unsigned, 
filelink char(128),
subj_code char(4),
KEY author_id_fk9 (author_id), CONSTRAINT author_id_fk9 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY ref_journal_fk9 (ref_journal), CONSTRAINT ref_journal_fk9 FOREIGN KEY (ref_journal) REFERENCES journal (journal_id),
KEY subj_code_fk9 (subj_code), CONSTRAINT subj_code_fk9 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table article_cs (
id int unsigned  not null PRIMARY KEY,
category char(16),
arxive_id char(16),
author_id int unsigned, 
title char(255) not null, 
ref_journal  int unsigned, 
filelink char(128),
subj_code char(4),
KEY author_id_fk10 (author_id), CONSTRAINT author_id_fk10 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY ref_journal_fk10 (ref_journal), CONSTRAINT ref_journal_fk10 FOREIGN KEY (ref_journal) REFERENCES journal (journal_id),
KEY subj_code_fk10 (subj_code), CONSTRAINT subj_code_fk10 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table article_misc (
id int unsigned  not null PRIMARY KEY,
category char(16),
arxive_id char(16),
author_id int unsigned, 
title char(255) not null, 
ref_journal  int unsigned, 
filelink char(128),
subj_code char(4),
KEY author_id_fk11 (author_id), CONSTRAINT author_id_fk11 FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
KEY ref_journal_fk11 (ref_journal), CONSTRAINT ref_journal_fk11 FOREIGN KEY (ref_journal) REFERENCES journal (journal_id),
KEY subj_code_fk11 (subj_code), CONSTRAINT subj_code_fk11 FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

