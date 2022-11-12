drop _temp_;
if (P_BAD1 ge 0.83040935672514) then do;
b_BAD = 1;
end;
else
if (P_BAD1 ge 0.64556962025316) then do;
_temp_ = dmran(1234);
b_BAD = floor(2 + 2*_temp_);
end;
else
if (P_BAD1 ge 0.31578947368421) then do;
b_BAD = 4;
end;
else
if (P_BAD1 ge 0.13135593220338) then do;
_temp_ = dmran(1234);
b_BAD = floor(5 + 3*_temp_);
end;
else
do;
_temp_ = dmran(1234);
b_BAD = floor(8 + 13*_temp_);
end;
