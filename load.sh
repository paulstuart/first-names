#!/usr/bin/env bash

# This builds the names database from the SSA baby names data
# by prepending the year to each line and importing via sqlite3.
#
# Some simple views are added for convenience, e.g, 
# v_names for a list of unique names, and v_totals for total counts per name.
#
#
# WARNING: this deletes the specified database file if it exists!
#

DB=${DB:-names.db}
DIR=${DIR:-names}

rm -f "$DB"
sqlite3 "$DB" < schema.sql

./prepend_year.sh ${DIR} | sqlite3 ${DB} -cmd ".mode csv" ".import /dev/stdin first_names"

sqlite3 ${DB} <<EOF
-- for some reason the view had an empty first_name entry, despite not seeing it in the data
create view v_names as select distinct first_name from first_names where first_name > '';
create view v_totals as select first_name, sum(count) as total from first_names group by first_name;
EOF
