if NAME = "_DOCUMENT_" then do;
ROLE = 'ID';
LEVEL = 'NOMINAL';
end;
else
do;
ROLE='INPUT';
LEVEL='BINARY';
end;
