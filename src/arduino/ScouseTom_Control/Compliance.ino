
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
		/*Serial.print("This is compmask: ");
		Serial.print(i);
		Serial.print(" : ");
		Serial.println(CompBitMask[i]);
		//Serial.println("");
		*/


		if (CompBitMask[i])
		{
			/*Serial.print("CompMask");
			Serial.print(i);
			Serial.println("is bad");
			*/
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

	/*
	Serial.print("CheckingCompliance On ProtLine ");
	Serial.println(ProtocolLine);
	*/

	boolean CompStatus = 0;

	CompStatus = 1; //CS_CheckCompliance();

	//only write the new value if the old value was low - this makes no difference if its in singlefreqmode
	//but in multifreq mode this means that if one freq is bad it keeps that bad value until it is sent at the end of the protocol
	if (!CompStatusRead(ProtocolLine))
	{
		CompStatusWrite(ProtocolLine, CompStatus);
	}

	if (CompStatus) // if compliance status was bad
	{
		//make indicator pin HIGH
		digitalWriteDirect(IND_EX_1, 1);
		//possibly something else
		/*
			Serial.print("Compbad in prot line: ");
			Serial.println(ProtocolLine);
			*/
	}


}

void CompProcessMulti()
{
	/*Checks whole compliance status for whole repetiton of protocol

	if there is a bad one then it sends the status to the PC - if in compliance check mode then this does it anyway

	If no bad ones then it puts the indicator pin low

	*/

	//Serial.println("checking all...");


	boolean AnyPrtBad = CompStatusReadAll(); // read status of every bitmask

	/*
	Serial.print("AnyPrtBad all was : ");
	Serial.println(AnyPrtBad);
	*/

	if (!AnyPrtBad) //if compliance on all protocol lines was ok
	{
		//send the pin to zero
		digitalWriteDirect(IND_EX_1, 0);
	}
	else
	{
		//Serial.println("Compbadin hereeee");

		if (!ComplianceCheckMode) // if we are not in compliance state send update - comlpiance checking sends its own update
		{
			PC_sendcomplianceupdate();
		}


	}
	//reset the compliance afterwards
	CompStatusReset();

}

void ResetAfterCompliance()
{
	//when compliance is done then put variables back to normal

	CompStatusReset();
	SingleFreqMode = CompFreqModeBackUp;
	StimMode = CompStimModeBackup;
	ComplianceCheckMode = 0;
	iCompCheck = 0;
	iCompCheckFreq = 0;
	//CS_SetCompliance(Compliance);
}


int SetComplianceOffset(int MeasTime)
{

	int CompCheckOffset = MinMeasTimeForComplianceCheck;

	if (MeasTime > MinMeasTimeForComplianceCheck)
	{
		//as it takes max 8ms, set the check offset to the earliest of either halfway through or 8ms before end

		if ((MeasTime / 2) < (MeasTime - 8000))
		{
			CompCheckOffset = MeasTime / 2; //check for compliance half way through injection
		}
		else
		{
			CompCheckOffset = (MeasTime - 8000); //check for compliance 8ms before the end
		}
	}
	else
	{
		CompCheckOffset = MeasTime * 2;  //set it too high so it never gets called
	}

	return CompCheckOffset;

}


