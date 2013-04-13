-- File: stream-python.pig
-- Sudar, 2013-04-13
-- Description: Streams data through a python script

data = LOAD 'data/tweets.csv' USING PigStorage(',');
filtered = STREAM data THROUGH `strip.py`;
DUMP filtered;
