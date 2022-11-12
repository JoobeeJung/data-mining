if upcase(NAME) = "BUY12" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "BUY6" then do;
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
if upcase(NAME) = "IMP_FICO" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "IMP_INCOME" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "IMP_MARRIED" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "IMP_ORGSRC" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "IMP_SEX" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "LOC" then do;
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
if upcase(NAME) = "VALUE24" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
