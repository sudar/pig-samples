-- File: data-bag.pig
-- Sudar, 2013-04-12
-- Description: Explain the bag data structure

outerbag = LOAD 'data/data-bag.txt' USING PigStorage(',') AS (f1:int, f2:int, f3:int);
DUMP outerbag;

innerbag = GROUP outerbag BY f1;
DUMP innerbag;

STORE innerbag INTO 'data/output/data-bag';
