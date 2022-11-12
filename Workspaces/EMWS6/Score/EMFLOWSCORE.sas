*------------------------------------------------------------*;
* Score: 고정 이름 생성;
*------------------------------------------------------------*;
LABEL EM_SEGMENT = 'Node';
EM_SEGMENT = _NODE_;
LENGTH EM_EVENTPROBABILITY 8;
LABEL EM_EVENTPROBABILITY = 'Probability for level 1 of RESPOND';
EM_EVENTPROBABILITY = P_RESPOND1;
LENGTH EM_PROBABILITY 8;
LABEL EM_PROBABILITY = 'Probability of Classification';
EM_PROBABILITY =
max(
P_RESPOND1
,
P_RESPOND0
);
LENGTH EM_CLASSIFICATION $%dmnorlen;
LABEL EM_CLASSIFICATION = "Prediction for RESPOND";
EM_CLASSIFICATION = I_RESPOND;
LABEL EM_CLASSTARGET = 'Target Variable: RESPOND';
EM_CLASSTARGET = F_RESPOND;
