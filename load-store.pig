-- File: load-store.pig
-- Sudar, 2013-04-13
-- Description: Load and store example

data = LOAD 'data/data-bag.txt' USING PigStorage(',');

DUMP data;

STORE data INTO 'data/output/load-store' USING PigStorage('|');
