@REM Batch script to generate catalog's index
@echo off
set DATASRC=.\db
set SCRIPTS=.\scripts

@REM set here the location of the root php directory
@REM in my case the binary for sqlite3 is situated in the same directory 
@REM if this is not true, you must add path for location of sqlite3.exe manually

set PHPDIR=%ProgramFiles(x86)%\php

erase /F/Q .\index_txt
md .\index_txt
set BOOKSDST=.\index_txt

sqlite3 dbooks2 < %DATASRC%\db_drop.sql
sqlite3 dbooks2 < %DATASRC%\db_schema.sql
sqlite3 dbooks2 < %DATASRC%\db_importdata.sql

"%PHPDIR%\php.exe" %SCRIPTS%\gentxtdb.php
