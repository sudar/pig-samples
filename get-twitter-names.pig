-- File: get-twitter-names.pig
-- Sudar, 2013-04-13
-- Description: Finds twitter usernames from tweets. Demonstrates UDF

REGISTER udf/dist/udf.jar
REGISTER udf/libs/commons-lang3-3.1.jar

DEFINE StripQuote com.sudarmuthu.pig.udf.StripQuote();
DEFINE GetTwitterNames com.sudarmuthu.pig.udf.GetTwitterNames();

data = LOAD 'data/tweets.csv' USING PigStorage(',');

twitter_names = FOREACH data GENERATE GetTwitterNames(StripQuote($7));

DUMP twitter_names;
