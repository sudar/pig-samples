-- File: stream-shell-script.pig
-- Sudar, 2013-04-13
-- Description: Demonstrates how shell commands can be executed in Pig through Streaming

data = LOAD 'data/tweets.csv' USING PigStorage(',');
filtered = STREAM data THROUGH `cut -f6,8`;
DUMP filtered;
