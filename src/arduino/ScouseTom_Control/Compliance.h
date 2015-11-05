
const int MinMeasTimeForComplianceCheck = 10 * 1000; //minimum time in us to check compliance - any shorter and the compliance check will delay the measurement time
const int ComplianceCheckMeasTime = 250 * 1000; //time in us for each compliance check injection
const int ComplianceCheckOffset = ComplianceCheckMeasTime -(20*1000); //time to wait after switching to check compliance
const int CompCheckNum = 3;
const float ComplianceScaleFactors[CompCheckNum] = { 1, 0.75, 0.5 }; // compliance is scaled by these amounts to check range during compliance check

const int CompMaskNum = 8;



bool CompStatusRead(int i);
void CompStatusWrite(int i, bool valin);
void CompStatusReset();
boolean CompStatusReadAll();
void CompProcessSingle(int ProtocolLine);
void CompProcessMulti();
void ResetAfterCompliance();
int SetComplianceOffset(int MeasTime);