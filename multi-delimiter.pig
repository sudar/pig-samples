-- File: multi-delimiter.pig
-- Sudar, 2013-04-29
-- Description: Explain how to load data using multiple delimiters

outerbag = LOAD 'data/multi-delimiter.txt' USING PigStorage('\t') AS (f1, f2);

innerbag = FOREACH outerbag GENERATE f1, STRSPLIT(f2, ',');

DUMP innerbag;
