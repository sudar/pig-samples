-- File: count.pig
-- Sudar, 2013-04-13
-- Description: Demonstrates the count operator

data = LOAD 'data/data-bag.txt' USING PigStorage(',') AS (f1:int, f2:int, f3:int);
grouped = GROUP data BY f2;

counted = FOREACH grouped GENERATE group, COUNT (data);
DUMP counted;
