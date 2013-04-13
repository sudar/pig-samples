-- File: distinct.pig
-- Sudar, 2013-04-13
-- Description: Demonstrates the distinct operator

data = LOAD 'data/data-bag.txt' USING PigStorage(',') AS (f1:int, f2:int, f3:int);
DUMP data;

unique = DISTINCT data;
DUMP unique;
