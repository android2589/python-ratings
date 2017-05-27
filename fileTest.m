clear; close all; clc;

fileName = 'DummyTables.runin';

tableName = 'TB_Table_1';

fid = fopen(fileName,'rt');

file = fread(fid,'*char');
fclose(fid);

fullFile = cellstr(file);

regMatch = [tableName '\s+\(.*\)'];

tableLoc = regexp(file',regMatch);

x = parseBrac(file,'{',tableLoc);

scrape = cellstr(file(1:x));
disp('done!');