# first-names
A processed database of popular first names per the US SSA

This project takes the names name classifications from the Social Security Administration's [Popular Baby Names](https://www.ssa.gov/oact/babynames/names.zip),
and puts it into an SQLite database to make it easier to work with.

Note that downloading that file programatically appears to be blocked, and must be done manually from a browser

For convenience, there is a pre-processed csv file of all years (with the year as the first field in the csv data),
it is compressed using zstd to minimize the size.
