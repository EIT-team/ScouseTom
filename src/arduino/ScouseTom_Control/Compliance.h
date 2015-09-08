
//! time in us for each compliance check injection
const int ComplianceCheckMeasTime = 20 * 1000; 
//! time to wait after switching to check compliance
const int ComplianceCheckOffset = ComplianceCheckMeasTime / 2; 
//! comppliance is scaled by these amounts to check range during compliance check
const float ComplianceScaleFactors[3] = { 1, 0.75, 0.5 }; 
const int CompMaskNum = 8;


bool CompStatusRead(int i);
void CompStatusWrite(int i, bool valin);
void CompStatusReset();
boolean CompStatusReadAll();
void CompProcessSingle(int ProtocolLine);
void CompProcessMulti();
