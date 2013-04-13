-- File: join.pig
-- Sudar, 2013-04-13
-- Description: Demonstrates the JOIN operator

a = LOAD 'data/data-bag.txt' USING PigStorage(',') AS (f1:int, f2:int, f3:int);
DUMP a;

b = LOAD 'data/simple-tuples.txt' USING PigStorage(',') AS (t1:int, t2:int);
DUMP b;

joined = JOIN a by f1, b by t1;
DUMP joined;
