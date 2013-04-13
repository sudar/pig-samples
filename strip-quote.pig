-- File: strip-quote.pig
-- Sudar, 2013-04-13
-- Description: Strips quotes from tweets. Demonstrates UDF

REGISTER udf/dist/udf.jar
REGISTER udf/libs/commons-lang3-3.1.jar

DEFINE StripQuote com.sudarmuthu.pig.udf.StripQuote();

data = LOAD 'data/tweets.csv' USING PigStorage(',');

tweets = FOREACH data GENERATE StripQuote($7);

DUMP tweets;
