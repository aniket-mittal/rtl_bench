module rtlpp_00179(
    input Clock,							
    input Reset_L,     						
    input CPU_WANNA_DO, 
    input [11:0] Address,
    input [7:0] Data,			
    output reg [7:0] crx_oreg,
    output reg [7:0] cry_oreg,
    output reg [7:0] ctl_oreg,
    output reg ram_weA,
    output reg ram_weB,
    output reg VGABLANKING_L,
    output reg [7:0] ram_diA,
    output reg [11:0] ram_adA,
    output reg [7:0] ram_diB,
    output reg [4:0] vga_state
); 	

reg  [2:0] Command;							    
reg  [7:0] RAM_DATin_A;
reg  [11:0] RAM_ADD_A;
reg  [7:0] RAM_DATin_B;
reg  [7:0] CRX;
reg  [7:0] CRY;
reg  [7:0] CTL;
reg  [4:0] CurrentState;					
reg  [4:0] NextState;						

parameter InitialisingState = 5'h00;				
parameter GET_CTL = 5'h01;				
parameter GET_CRY = 5'h02;				
parameter GET_CRX = 5'h03;				
parameter NOP = 3'b001; 
parameter DATA_0 = 8'b00000000; 
parameter ADDRESS_0 = 12'b000000000000; 
parameter CRX_0 = 8'b00101000;
parameter CRY_0 = 8'b00010100;
parameter CTL_0 = 8'b11110011;

always @(posedge Clock or negedge Reset_L)
begin
    if (Reset_L == 0) 							
        CurrentState <= InitialisingState;
    else
    begin								
        CurrentState <= NextState;		
        crx_oreg <= CRX;
        cry_oreg <= CRY;
        ctl_oreg <= CTL;
        ram_weA <= Command[2];			
        ram_weB <= Command[1];			
        VGABLANKING_L <= Command[0];	
        ram_diA <= RAM_DATin_A;		
        ram_adA <= RAM_ADD_A;
        ram_diB <= RAM_DATin_B;		
        vga_state <= CurrentState;		
    end
end	

always @(*)
begin
    NextState = InitialisingState;		

    Command = NOP;							    
    RAM_DATin_A = DATA_0;
    RAM_ADD_A = ADDRESS_0;
    RAM_DATin_B = DATA_0;
    CRX = CRX_0;
    CRY = CRY_0;
    CTL = CTL_0;			

    if (CurrentState == InitialisingState)
    begin
        CTL = CTL; 
        CRY = CRY; 
        CRX = CRX; 
        if ((Address == 12'b110010001110) && (CPU_WANNA_DO == 1))
            NextState = GET_CTL;	
        else if ((Address == 12'b110010001100) && (CPU_WANNA_DO == 1))
            NextState = GET_CRY;	
        else if ((Address == 12'b110010001010) && (CPU_WANNA_DO == 1))
            NextState = GET_CRX;	
        else
            NextState = InitialisingState;	
    end	
    else if (CurrentState == GET_CTL)
    begin
        CTL = Data; 
        CRY = CRY; 
        CRX = CRX; 
        NextState = InitialisingState; 
    end 
    else if (CurrentState == GET_CRY)
    begin
        CTL = CTL; 
        CRY = Data; 
        CRX = CRX; 
        NextState = InitialisingState; 
    end 
    else if (CurrentState == GET_CRX)
    begin
        CTL = CTL; 
        CRY = CRY; 
        CRX = Data; 
        NextState = InitialisingState; 
    end 
    else
    begin	
        CTL = CTL; 
        CRY = CRY; 
        CRX = CRX; 
        NextState = InitialisingState;	
    end	
end

endmodule