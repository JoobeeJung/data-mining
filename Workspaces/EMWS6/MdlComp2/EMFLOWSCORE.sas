drop _temp_;
if (P_RESPOND1 ge 0.0949720670391) then do;
_temp_ = dmran(1234);
b_RESPOND = floor(1 + 5*_temp_);
end;
else
do;
_temp_ = dmran(1234);
b_RESPOND = floor(6 + 15*_temp_);
end;
