if upcase(NAME) = "AGE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "BUY12" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "BUY18" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "BUY6" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CLIMATE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "COA6" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "DISCBUY" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "FICO" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "INCOME" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LOC" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MARRIED" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "ORGSRC" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "OWNHOME" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "Q_RESPOND0" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_RESPOND1" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "RETURN24" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "SEX" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "VALUE24" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
