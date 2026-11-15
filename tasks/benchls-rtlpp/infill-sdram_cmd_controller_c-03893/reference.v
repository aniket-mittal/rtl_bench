module rtlpp_03893(
        CLK,
        RESET_N,
        CMD,
        ADDR,
        REF_ACK,
        INIT_ACK,
        CM_ACK,
        NOP,
        READA,
        WRITEA,
        REFRESH,
        PRECHARGE,
        LOAD_MODE,
        SADDR,
        REF_REQ,
        INIT_REQ,
        CMD_ACK
        );

`define ASIZE 16
`define REF_PER 16'hFFFF
`define INIT_PER 16'h0FFF
        
input                           CLK;                    
input                           RESET_N;                
input   [2:0]                   CMD;                    
input   [`ASIZE-1:0]            ADDR;                   
input                           REF_ACK;                
input                           INIT_ACK;                
input                           CM_ACK;                 
output                          NOP;                    
output                          READA;                  
output                          WRITEA;                 
output                          REFRESH;                
output                          PRECHARGE;              
output                          LOAD_MODE;              
output  [`ASIZE-1:0]            SADDR;                  
output                          REF_REQ;                
output                          INIT_REQ;               
output                          CMD_ACK;                


            
reg                             NOP;
reg                             READA;
reg                             WRITEA;
reg                             REFRESH;
reg                             PRECHARGE;
reg                             LOAD_MODE;
reg     [`ASIZE-1:0]            SADDR;
reg                             REF_REQ;
reg                             INIT_REQ;
reg                             CMD_ACK;


reg     [15:0]                  timer;
reg     [15:0]                  init_timer;


always @(posedge CLK or negedge RESET_N)
begin
        if (RESET_N == 0) 
        begin
                NOP             <= 0;
                READA           <= 0;
                WRITEA          <= 0;
                SADDR           <= 0;
        end
        
        else
        begin
        
                SADDR <= ADDR;                                  
                                                                
                                                             
                if (CMD == 3'b000)                              
                        NOP <= 1;
                else
                        NOP <= 0;
                        
                if (CMD == 3'b001)                              
                        READA <= 1;
                else
                        READA <= 0;
                 
                if (CMD == 3'b010)                              
                        WRITEA <= 1;
                else
                        WRITEA <= 0;
                        
        end
end



always @(posedge CLK or negedge RESET_N)
begin
        if (RESET_N == 0)
                CMD_ACK <= 0;
        else
                if ((CM_ACK == 1) & (CMD_ACK == 0))
                        CMD_ACK <= 1;
                else
                        CMD_ACK <= 0;
end



always @(posedge CLK or negedge RESET_N) begin
        if (RESET_N == 0) 
        begin
                timer           <= 0;
                REF_REQ         <= 0;
        end        
        else 
        begin
                if (REF_ACK == 1)
                begin
                        timer <= `REF_PER;
                        REF_REQ <= 0;
                end
                else if (INIT_REQ == 1)
                begin
                        timer <= `REF_PER + 200;
                        REF_REQ <= 0;                    
                end
                else
                        timer <= timer - 1'b1;

                if (timer == 0)
                        REF_REQ <= 1;

        end
end


always @(posedge CLK or negedge RESET_N) begin
        if (RESET_N == 0) 
        begin
                init_timer      <= 0;
                REFRESH         <= 0;
                PRECHARGE       <= 0; 
                LOAD_MODE       <= 0;
                INIT_REQ        <= 0;
        end        
        else 
        begin
                if (init_timer < (`INIT_PER + 201))
                        init_timer <= init_timer + 1;
                    
                if (init_timer < `INIT_PER)
                begin
                        REFRESH <= 0;
                        PRECHARGE <= 0;
                        LOAD_MODE <= 0;
                        INIT_REQ <= 1;
                end
                else if(init_timer == (`INIT_PER + 20))
                begin
                        REFRESH <= 0;
                        PRECHARGE <= 1;
                        LOAD_MODE <= 0;
                        INIT_REQ <= 0;
                end
                else if((init_timer == (`INIT_PER + 40)) || (init_timer == (`INIT_PER + 60)) || (init_timer == (`INIT_PER + 80)) || (init_timer == (`INIT_PER + 100)) || 
                       (init_timer == (`INIT_PER + 120)) || (init_timer == (`INIT_PER + 140)) || (init_timer == (`INIT_PER + 160)) || (init_timer == (`INIT_PER + 180)))
                begin
                        REFRESH <= 1;
                        PRECHARGE <= 0;
                        LOAD_MODE <= 0;
                        INIT_REQ <= 0;
                end
                else if(init_timer == (`INIT_PER + 200))
                begin
                        REFRESH <= 0;
                        PRECHARGE <= 0;
                        LOAD_MODE <= 1;
                        INIT_REQ <= 0;                
                end
                else
                begin
                        REFRESH <= 0;
                        PRECHARGE <= 0;
                        LOAD_MODE <= 0;
                        INIT_REQ <= 0;                                    
                end
        end
end

endmodule