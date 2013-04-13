-- File: count-words.pig
-- Sudar, 2013-04-12
-- Description: Count the number of words in a text file

file = LOAD 'data/dropbox-policy.txt' AS (line);

words = FOREACH file GENERATE FLATTEN(TOKENIZE(line)) AS word;

grouped  = GROUP words BY word;

counted  = FOREACH grouped GENERATE group, COUNT(words);

sorted_counted = ORDER counted BY $1;

DUMP sorted_counted;
