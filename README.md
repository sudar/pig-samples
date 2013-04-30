pig-samples
===========

Collection of Pig scripts that I use for my talks and workshops about Pig and Hadoop.

## Slides

You can find the slides that I used from my [slideshare account](http://www.slideshare.net/Sudar/pig-workshop). You can also checkout, some of my [other talks](http://sudarmuthu.com/my-talks) as well.

## File list

### Pig files

The following are the pig files that are present in this repository.

- load-store.pig - Load and store example
- multi-delimiter.pig - Explain how to load data using multiple delimiters
- data-bag.pig - Explain the bag data structure
- lookup.pig - Explains how to lookup to a particular column in a relation
- group-by.pig - Explains how group up operator works
- filter-by.pig - Demonstrates the filter by operator
- count.pig - Demonstrates the count operator
- order-by.pig - Demonstrates the order by operator
- distinct.pig - Demonstrates the distinct operator
- limit.pig - Demonstrates the LIMIT operator
- join.pig - Demonstrates the JOIN operator
- count-words.pig - Count the number of words in a text file
- strip-quote.pig - Strips quotes from tweets. Demonstrates UDF
- get-twitter-names.pig - Finds twitter usernames from tweets. Demonstrates UDF
- from-vim.pig - Finds all tweets that were tweeted from Vim. Demonstrates Filter UDF functions
- stream-shell-script.pig - Demonstrates how shell commands can be executed in Pig through Streaming
- stream-python.pig - Streams data through a python script 
    - strip.py - This python script would be invoked by Pig and the data will be streamed through it

### UDF directory

The /udf directory contains the Java source code for the UDF that are consumed by the pig scripts. The following are the Java files that are present in this directory.

- StripQuote.java - An Eval UDF function that strips quote from strings
- GetTwitterNames.java - An Eval UDF function to get the twitter names in a tweet
- FromVim.java - A filter UDF function

### Data directory

The /data directory contains the data files that are used by these samples. The following are the files that are present in this directory.

- dropbox-policy.txt - A copy of dropbox policy document. This file is used for doing word analysis.
- tweets.csv - A dump of my tweets that I got from twitter. 
- data-bag.txt - A simple data file to explain bag data type
- nested-schema.txt - A simple data file to explain nested data schemas
- simple-tuples - A simple data file to explain simple tuples
- multi-delimiter.txt - A simple data file that contains data that have multiple delimiters

### other files

- clean.sh - A shell script to clean pig log files and output data files

## License

The library and the example are released under released under BeerWare license.

I would, however, consider it a great courtesy if you could email me and tell me about your project and how this code was used, just for my own continued personal gratification.

## Contributions

All contributions (even documentation) are welcome :)

If you would like to contribute to this project, then just fork it in github and send a pull request.
