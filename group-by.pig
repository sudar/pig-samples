-- File: group-by.pig
-- Sudar, 2013-04-13
-- Description: Explains how group up operator works

outerbag = LOAD 'data/data-bag.txt' USING PigStorage(',') AS (f1:int, f2:int, f3:int);
DUMP outerbag;

innerbag = GROUP outerbag BY f1;
DUMP innerbag;
