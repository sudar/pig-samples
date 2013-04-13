-- File: from-vim.pig
-- Sudar, 2013-04-13
-- Description: Finds all tweets that were tweeted from Vim. Demonstrates Filter UDF functions

REGISTER udf/dist/udf.jar
REGISTER udf/libs/commons-lang3-3.1.jar

DEFINE StripQuote com.sudarmuthu.pig.udf.StripQuote();
DEFINE FromVim com.sudarmuthu.pig.udf.FromVim();

data = LOAD 'data/tweets.csv' USING PigStorage(',');
vim_tweets = FILTER data By FromVim(StripQuote($6));
vim_tweets2 = FOREACH vim_tweets GENERATE StripQuote($7);

DUMP vim_tweets2;
