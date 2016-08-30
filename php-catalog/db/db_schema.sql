.separator '|'
.mode list


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
FOREIGN KEY (author1_id) REFERENCES author (author_id),
FOREIGN KEY (author2_id) REFERENCES author (author_id),
FOREIGN KEY (author3_id) REFERENCES author (author_id)
);

CREATE table publisher (
publisher_id int unsigned  not null PRIMARY KEY,
 name char(128) not null
);

CREATE table subject (
subj_code char(4)  not null PRIMARY KEY, 
output_filename char(128),
code_descr char(128),
table_id int unsigned,
FOREIGN KEY (table_id) REFERENCES reflection (table_id)
);

CREATE table reflection (
table_id  int  unsigned not null PRIMARY KEY, 
books_edition_table_name char(64),
books_main_table_name char(64),
articles_table_name char(64)
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
FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_physics (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255), 
edition_id int unsigned,
subj_code char(4),
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (edition_id) REFERENCES book_on_physics_editions (edition_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_on_maths_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_maths (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (edition_id) REFERENCES book_on_maths_editions (edition_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_on_cscience_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_cscience (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (edition_id) REFERENCES book_on_cscience_editions (edition_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_on_misc_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_misc (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (edition_id) REFERENCES book_on_misc_editions (edition_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_on_astronomy_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_on_astronomy (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (edition_id) REFERENCES book_on_astronomy_editions (edition_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_generic_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_generic (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (edition_id) REFERENCES book_generic_editions (edition_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

CREATE table book_biography_editions (
edition_id int unsigned PRIMARY KEY,  
publisher_id int unsigned, 
pages int unsigned,
year int unsigned,
isbn char(32),
filelink char(128),
lang_code char(2),
FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
FOREIGN KEY (lang_code) REFERENCES language (code) 
);

CREATE table book_biography (
id int unsigned  not null PRIMARY KEY,
author_id int unsigned, 
title char(255) not null, 
edition_id int unsigned,
subj_code char(4),
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (edition_id) REFERENCES book_biography_editions (edition_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
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
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (ref_journal) REFERENCES journal (journal_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
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
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (ref_journal) REFERENCES journal (journal_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
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
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (ref_journal) REFERENCES journal (journal_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
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
FOREIGN KEY (author_id) REFERENCES multiauthor (author_id),
FOREIGN KEY (ref_journal) REFERENCES journal (journal_id),
FOREIGN KEY (subj_code) REFERENCES subject (subj_code)
);

