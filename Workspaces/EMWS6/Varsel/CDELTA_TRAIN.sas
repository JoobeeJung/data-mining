if upcase(name) = 'AGE' then role = 'REJECTED';
else
if upcase(name) = 'BUY12' then role = 'REJECTED';
else
if upcase(name) = 'BUY6' then role = 'REJECTED';
else
if upcase(name) = 'CLIMATE' then role = 'REJECTED';
else
if upcase(name) = 'COA6' then role = 'REJECTED';
else
if upcase(name) = 'DISCBUY' then role = 'REJECTED';
else
if upcase(name) = 'FICO' then role = 'REJECTED';
else
if upcase(name) = 'INCOME' then role = 'REJECTED';
else
if upcase(name) = 'LOC' then role = 'REJECTED';
else
if upcase(name) = 'ORGSRC' then role = 'REJECTED';
else
if upcase(name) = 'RETURN24' then role = 'REJECTED';
else
if upcase(name) = 'SEX' then role = 'REJECTED';
else
if upcase(name) = 'VALUE24' then role = 'REJECTED';
if upcase(strip(name)) = "G_LOC" then level = "NOMINAL";
