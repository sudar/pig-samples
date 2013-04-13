-- File: filter-by.pig
-- Sudar, 2013-04-13
-- Description: Demonstrates the filter by operator


data = LOAD 'data/data-bag.txt' USING PigStorage(',') AS (f1:int, f2:int, f3:int);
DUMP data;

filtered = FILTER data BY f1 == 1;
DUMP filtered;
