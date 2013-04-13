-- File: lookup.pig
-- Sudar, 2013-04-13
-- Description: Explains how to lookup to a particular column in a relation

data = LOAD 'data/nested-schema.txt' AS (f1:int, f2:bag{t:tuple(n1:int, n2:int)}, f3:map[]);

by_pos = FOREACH data GENERATE $0;
DUMP by_pos;

by_field = FOREACH data GENERATE f2;
DUMP by_field;

by_map = FOREACH data GENERATE f3#'name';
DUMP by_map;
