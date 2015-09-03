
bool CompStatusRead(int i)
{
	// read bit from correct bit mask 
	bool val = 0;
	if (i < maxInjections)
	{
		int MaskNum = i / 32;
		val = bitRead(CompBitMask[MaskNum], i - (32 * MaskNum));
	}

	return val;
}

void CompStatusWrite(int i, bool valin)
{

	/*write the bit into the correct bit mask

	The first 32 compliance status go in CompBitMask[0] from 0 to 31 bitwise

	*/

	if (i < maxInjections)
	{
		int MaskNum = i / 32;
		bitWrite(CompBitMask[MaskNum], i - (32 * MaskNum), valin);

	}

}

void CompStatusReset()
{
	//reset all bits in compliance status masks to 0

	for (int i = 0; i < CompMaskNum; i++)
	{
		CompBitMask[i] = 0;
	}
}

boolean CompStatusReadAll()
{
	/*Reads all bit masks to see if any have any high bits in*/

	boolean Badness = 0;

	for (int i = 0; i < CompMaskNum; i++)
	{
		Serial.print("This is compmask: ");
		Serial.print(i);
		Serial.print(" : ");
		Serial.println(CompBitMask[i]);
		//Serial.println("");



		if (CompBitMask[i])
		{
			Serial.print("CompMask");
			Serial.print(i);
			Serial.println("is bad");
			Badness = true;
			break;
		}
	}

	return Badness;

}

void CompProcessSingle(int ProtocolLine)
{

	/* This checks for compliance and puts result in approprtiate place in bitmask.
	Also responds to bad compliance
	*/


	//Serial.println("CheckingCompliance");

	boolean CompStatus = 0;

	CompStatus = CS_CheckCompliance();

	CompStatusWrite(ProtocolLine, CompStatus);

	if (CompStatus) // if compliance status was bad
	{
		//make indicator pin HIGH
		digitalWriteDirect(IND_EX_1, 1);
		//possibly something else
		//Serial.println("Compbad");
	}


}

void CompProcessMulti()
{
	/*Checks whole compliance status for whole repetiton of protocol 
	
	if there is a bad one then it sends the status to the PC - if in compliance check mode then this does it anyway

	If no bad ones then it puts the indicator pin low
	
	*/

	Serial.println("checking all...");


	boolean AnyPrtBad = CompStatusReadAll(); // read status of every bitmask

	Serial.print("AnyPrtBad all was : ");
	Serial.println(AnyPrtBad);


	if (!AnyPrtBad)
	{
		digitalWriteDirect(IND_EX_1, 0);

		if (ComplianceCheckMode) // this should be in an OR statement below...
		{
			PC_sendcomplianceupdate();
		}

	}
	else
	{
		Serial.println("Compbadin hereeee");
		PC_sendcomplianceupdate();
	}



}