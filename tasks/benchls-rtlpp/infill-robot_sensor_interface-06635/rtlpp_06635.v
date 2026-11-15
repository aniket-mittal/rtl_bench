module rtlpp_06635(
    input               Wr_Strobe,       
                        Rd_Strobe,       
    input       [7:0]   AddrIn,          
    input       [7:0]   DataIn,          
    output reg  [7:0]   DataOut,     

    input       [7:0]   MotCtl,          
    output reg  [7:0]   LocX,            
                        LocY,            
                        BotInfo,         
                        Sensors,         
                        LMDist,          
                        RMDist,         
                                                
    output reg  [7:0]   MapX,            
    output reg  [7:0]   MapY,            
    input       [1:0]   MapVal,           

    input               clk,             
                        reset,           
    output reg          upd_sysregs,     

    input       [7:0]   BotConfig  
);

reg         load_sys_regs,            
            load_dist_regs; 


reg [7:0]   LocX_int,         
            LocY_int,         
            BotInfo_int,      
            Sensors_int,      
            LMDist_int,       
            RMDist_int;       


always @(posedge clk) begin
    case (AddrIn[3:0])
        4'b0000 :    DataOut <= MotCtl;
        4'b0001 :    DataOut <= LocX_int;
        4'b0010 :    DataOut <= LocY_int;
        4'b0011 :    DataOut <= BotInfo_int;
        4'b0100 :    DataOut <= Sensors_int;
        4'b0101 :    DataOut <= LMDist_int;     
        4'b0110 :    DataOut <= RMDist_int;  
        4'b0111 :    DataOut <= BotConfig;
        4'b1000 :    DataOut <= MapX;            
        4'b1001 :    DataOut <= MapY;            
        4'b1010 :    DataOut <= MapVal;          
        4'b1011 :    DataOut <= 8'd0;            
        4'b1100 :    DataOut <= 8'b00000000;
        4'b1101 :    DataOut <= 8'b00000000;
        4'b1110 :    DataOut <= 8'b00000000;        
        4'b1111 :    DataOut <= 8'd0;         
    endcase
end 

[MASKED] 

always @(posedge clk) begin
    if (reset) begin
        LocX <= 0;
        LocY <= 0;
        Sensors <= 0;
        BotInfo <= 0;
    end
    else if (load_sys_regs) begin  
            LocX <= LocX_int;
            LocY <= LocY_int;
            Sensors <= Sensors_int;
            BotInfo <= BotInfo_int;
    end
    else begin 
            LocX <= LocX;
            LocY <= LocY;
            Sensors <= Sensors;
            BotInfo <= BotInfo;
    end     
end 

always @(posedge clk) begin
    if (reset) begin
        LMDist <= 0;
        RMDist <= 0;
    end
    else if (load_dist_regs) begin  
            LMDist <= LMDist_int;
            RMDist <= RMDist_int;
    end
    else begin
            LMDist <= LMDist;
            RMDist <= RMDist;
    end     
end 
endmodule