

const int ComplianceCheckMeasTime = 20 * 1000; //! time in us for each compliance check injection
const int ComplianceCheckOffset = ComplianceCheckMeasTime / 2; //! time to wait after switching to check compliance
const float ComplianceScaleFactors[3] = { 1, 0.75, 0.5 }; //! comppliance is scaled by these amounts to check range during compliance check

const int CompMaskNum = 8;


bool CompStatusRead(int i);
//! \brief write the bit into the correct bit mask
//!    The first 32 compliance status go in CompBitMask[0] from 0 to 31 bitwise
void CompStatusWrite(int i, bool valin);
void CompStatusReset();
boolean CompStatusReadAll();
void CompProcessSingle(int ProtocolLine);
//! \brief Checks whole compliance status for whole repetiton of protocol 
//! if there is a bad one then it sends the status to the PC - if in compliance check mode then this does it anyway
//! If no bad ones then it puts the indicator pin low
void CompProcessMulti();
