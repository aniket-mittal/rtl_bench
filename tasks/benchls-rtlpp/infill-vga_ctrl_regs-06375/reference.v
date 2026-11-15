module rtlpp_06375(
	input Clock,							
	input Reset_L,     						
	input CPU_Enable, 
	input [11:0] Address,
	input [7:0] Data,			
	output reg [7:0] ocrx,
	output reg [7:0] ocry,
	output reg [7:0] octl,
	output reg WEA,
	output reg WEB,
	output reg VGABLANKING_L,
	output reg [7:0] dataB
); 	

reg  [2:0] Command;							    
reg  [7:0] RAM_DATin_B;
reg  [7:0] CRX;
reg  [7:0] CRY;
reg  [7:0] CTL;
reg  [4:0] CurrentState;					
reg  [4:0] NextState;						

parameter Initial = 5'h00;				
parameter CTL_update = 5'h01;				
parameter CRX_update = 5'h02;				
parameter CRY_update = 5'h03;	

parameter NOP = 3'b001; 
parameter DATA_0 = 1'b0; 
parameter ADDRESS_0 = 12'b0; 
parameter CRX_Init = 8'h28;
parameter CRY_Init = 8'h14;
parameter CTL_Init = 8'hf5;

always@(posedge Clock or negedge Reset_L)
begin
	if (Reset_L == 1'b0) 
		CurrentState <= Initial;
	else 
	begin
		CurrentState <= NextState;
		ocrx <= CRX;
		ocry <= CRY;
		octl <= CTL;
		WEA <= Command[2];
		WEB <= Command[1];
		VGABLANKING_L <= Command[0];
		dataB <= RAM_DATin_B;
	end
end	

always@(*)
begin
	NextState <= Initial;
	Command <= NOP;							    
	RAM_DATin_B <= DATA_0;
	CRX <= CRX_Init;
	CRY <= CRY_Init;
	CTL <= CTL_Init;

	case (CurrentState)
		Initial:
		begin
			CTL <= CTL_Init; 
			CRY <= CRY_Init; 
			CRX <= CRX_Init;
			case ({Address,CPU_Enable})
				13'b1111_0000_0000_1 : NextState <= CTL_update;
				13'b1111_0000_0010_1 : NextState <= CRX_update;
				13'b1111_0000_0100_1 : NextState <= CRY_update;
				default : NextState <= Initial;
			endcase
		end
		
		CTL_update:
		begin
			CTL <= Data;
			NextState <= Initial;
		end 
		
		CRX_update:
		begin
			CRX <= Data;
			NextState <= Initial;
		end 
		
		CRY_update:
		begin
			CRY <= Data;
			NextState <= Initial;
		end 
		
		default:
		begin
			NextState <= Initial;
		end	
	endcase
end
endmodule