-- File: order-by.pig
-- Sudar, 2013-04-13
-- Description: Demonstrates the order by operator

data = LOAD 'data/nested-sample.txt' USING PigStorage(',') AS (f1:int, f2:int, f3:int);
DUMP data;

ordera = ORDER data BY f1 ASC;
DUMP ordera;

orderd = ORDER data BY f1 DESC;
DUMP orderd;
