#!/bin/sh

# ---------------------------------------------------------------------------- 
#  Batch script to generate catalog's index
# ---------------------------------------------------------------------------- 

DATASRC=./db
SCRIPTS=./scripts


mkdir ../index_txt

echo "Creating a new database"
sqlite3 dbooks2 < $DATASRC/db_drop.sql
sqlite3 dbooks2 < $DATASRC/db_schema.sql

echo "Filling database with data... "

sqlite3 dbooks2 < $DATASRC/db_importdata.sql

echo "Done. "

php  $SCRIPTS/gentxtdb.php
