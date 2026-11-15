module rtlpp_09031 (
		input Clock,											
		input Reset_L,     									
		input CacheHit_H,										
		input ValidBitIn_H,									

		input DramSelect68k_H,     						
		input [31:0] AddressBusInFrom68k,  	
		input [15:0] DataBusInFrom68k, 		
		output reg [15:0] DataBusOutTo68k, 	
		input UDS_L,											
		input LDS_L, 											
		input WE_L,  											
		input AS_L,
		input DtackFromDram_L,								
		input CAS_Dram_L,										
		input RAS_Dram_L,										

		input [15:0] DataBusInFromDram, 							
		output reg [15:0] DataBusOutToDramController, 		
		input [15:0] DataBusInFromCache, 						
		output reg UDS_DramController_L, 									
		output reg LDS_DramController_L,										
		output reg DramSelectFromCache_L,
		output reg WE_DramController_L,  									
		output reg AS_DramController_L,
		output reg DtackTo68k_L, 												
		
		output reg TagCache_WE_L,												
		output reg DataCache_WE_L,												
		output reg ValidBit_WE_L,												
		
		output reg [31:0] AddressBusOutToDramController,  	
		output reg [22:0] TagDataOut,  							
		output reg [2:0] WordAddress,								
		output reg ValidBitOut_H,												
		output reg [8:4] Index,										

		output [4:0] CacheState										
	);

	parameter Reset = 5'b00000;
	parameter InvalidateCache = 5'b00001;
	parameter Idle = 5'b00010;	
	parameter CheckForCacheHit = 5'b00011;	
	parameter ReadDataFromDramIntoCache = 5'b00100;
	parameter CASDelay1 = 5'b00101;
	parameter CASDelay2 = 5'b00110;
	parameter BurstFill = 5'b00111;
	parameter EndBurstFill = 5'b01000;
	parameter WriteDataToDram = 5'b01001;
	parameter WaitForEndOfCacheRead = 5'b01010;
	
	reg [4:0] CurrentState;						
	reg [4:0] NextState;							
	
	reg [15:0] BurstCounter;						
	reg BurstCounterReset_L;							

	assign CacheState = CurrentState;

	always @(posedge Clock or negedge Reset_L)
	begin
		if(Reset_L == 0) 
			CurrentState <= Reset;
		else
			CurrentState <= NextState;	
	end

	always @(posedge Clock)
	begin
		if(BurstCounterReset_L == 0) 						
			BurstCounter <= 0;
		else
			BurstCounter <= BurstCounter + 1;
	end
	
	always @(*) begin
		
		NextState                       <= Idle ;
		DataBusOutTo68k                 <= DataBusInFromCache;
		DataBusOutToDramController      <= DataBusInFrom68k;
		
		AddressBusOutToDramController[31:4] <= AddressBusInFrom68k[31:4];
		AddressBusOutToDramController[3:1]  <= 0;								
		AddressBusOutToDramController[0]    <= 0;								
		TagDataOut                        <= AddressBusInFrom68k[31:9];
		Index                             <= AddressBusInFrom68k[8:4];			
		
		UDS_DramController_L             <= UDS_L;
		LDS_DramController_L             <= LDS_L;
		WE_DramController_L              <= WE_L;
		AS_DramController_L              <= AS_L;
		
		DtackTo68k_L                     <= 1;									
		TagCache_WE_L                    <= 1;									
		DataCache_WE_L                   <= 1;									
		ValidBit_WE_L                    <= 1;									
		ValidBitOut_H                    <= 0;
		DramSelectFromCache_L            <= 1;									
		WordAddress                      <= 0;									
		
		BurstCounterReset_L              <= 1;									
		NextState                        <= Idle ;							

		if(CurrentState == Reset) begin	  								
			BurstCounterReset_L            <= 0;							
			NextState                      <= InvalidateCache;				
		end

		else if(CurrentState == InvalidateCache) begin	  						
			if(BurstCounter == 32) 											
				NextState                 <= Idle;
			else begin
				NextState                <= InvalidateCache;				
				Index                    <= BurstCounter[4:0];	
				ValidBitOut_H            <= 0;		
				ValidBit_WE_L            <= 0;
			end
		end

		else if(CurrentState == Idle) begin	  							

		end

		else if(CurrentState == CheckForCacheHit) begin	  			

		end	

		else if(CurrentState == WaitForEndOfCacheRead) begin		

		end

		else if(CurrentState == ReadDataFromDramIntoCache) begin

		end

		else if(CurrentState == CASDelay1) begin						

		end

		else if(CurrentState == CASDelay2) begin						

		end

		else if(CurrentState == BurstFill) begin						

		end

		else if(CurrentState == EndBurstFill) begin							

		end

		else if(CurrentState == WriteDataToDram) begin	  					

		end
	end
endmodule