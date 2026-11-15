module rtlpp_07707(CLK, RESET, PB, DPB, SCEN, MCEN, CCEN);

input  CLK, RESET;
input  PB;

output DPB;
output SCEN, MCEN, CCEN;

parameter N_dc = 7;

reg [5:0] state;
reg [N_dc-1:0] debounce_count;
reg [3:0] MCEN_count;

assign {DPB, SCEN, MCEN, CCEN} = state[5:2];

localparam
 INI        = 6'b000000,
 W84        = 6'b000001,
 SCEN_st    = 6'b111100,
 WS         = 6'b100000,
 MCEN_st    = 6'b101100,
 CCEN_st    = 6'b100100,
 MCEN_cont  = 6'b101101,
 CCR        = 6'b100001,
 WFCR       = 6'b100010;

always @ (posedge CLK or posedge RESET)
begin
    if (RESET)
    begin
        state <= INI;
        debounce_count <= 0;
        MCEN_count <= 0;
    end
    else
    begin
        case (state)
            INI: 
            begin                   
                debounce_count <= 0;
                MCEN_count <= 0;  
                if (PB)
                begin
                    state <= W84;
                end
            end
            
            W84: 
            begin
                debounce_count <= debounce_count + 1;
                if (!PB)
                begin
                    state <= INI;
                end
                else if (debounce_count[N_dc-5])
                begin
                    state <= SCEN_st;
                end
            end
            
            SCEN_st: 
            begin
                debounce_count <= 0;
                MCEN_count <= MCEN_count + 1;
                state <= WS;
            end
            
            WS:  
            begin
                debounce_count <= debounce_count + 1;
                if (!PB)
                begin
                    state <= CCR;
                end    
                else if (debounce_count[N_dc-1])
                begin
                    state <= MCEN_st;
                end
            end
            
            MCEN_st: 
            begin
                debounce_count <= 0;
                MCEN_count <= MCEN_count + 1;
                state <= CCEN_st;
            end
            
            CCEN_st: 
            begin
                debounce_count <= debounce_count + 1;
                if (!PB)
                begin
                    state <= CCR;
                end
                else if (debounce_count[N_dc-1])
                begin
                    if (MCEN_count == 4'b1000)
                    begin
                        state <= MCEN_cont;
                    end
                    else
                    begin
                        state <= MCEN_st;
                    end
                end
            end
            
            MCEN_cont: 
            begin
                if (!PB)
                begin
                    state <= CCR;
                end
            end
            
            CCR: 
            begin
                debounce_count <= 0;
                MCEN_count <= 0;
                state <= WFCR;
            end
            
            WFCR: 
            begin
                debounce_count <= debounce_count + 1;
                if (PB)
                begin
                    state <= WS;
                end
                else if (debounce_count[N_dc-5])
                begin
                    state <= INI;
                end
            end
        endcase
    end
end

endmodule