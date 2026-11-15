module rtlpp_09309(CLK, RESET, PB, DPB, SCEN, MCEN, CCEN);

input CLK, RESET;
input PB;

output DPB;
output SCEN, MCEN, CCEN;

parameter N_dc = 5;

reg [5:0] state;
reg [N_dc:0] debounce_count;
reg [19:0] debounce_count2; // Adjusted to properly handle large counts
reg [4:0] MCEN_count;
reg [127:0] state_string; // Adjusted to properly fit the state strings

assign {DPB, SCEN, MCEN, CCEN} = state[5:2];

localparam
 INI = 6'b000000,
 WQ = 6'b000001,
 SCEN_st = 6'b111100,
 WH = 6'b100000,
 MCEN_st = 6'b101100,
 CCEN_st = 6'b100100,
 MCEN_cont = 6'b101101,
 CCR = 6'b100001,
 WFCR = 6'b100010;

always @ (posedge CLK or posedge RESET)
    begin : State_Machine
        if (RESET)
           begin
              state_string  =  "   INI  "; 
              state <= INI;
              debounce_count <= 'bx;
              debounce_count2 <= 'bx; // Added initialization
              MCEN_count <= 5'bx; // Adjusted width to 5 bits
           end
        else 
           begin
               case (state)
                   INI: begin					
                        state_string  = "   INI  ";
                        debounce_count <= 0;
                        debounce_count2 <= 0;
                        MCEN_count <= 0;  
                        if (PB)
                            begin
                                state <= WQ;
                            end
                     end
                  WQ: begin
                        state_string  = "   WQ   ";
                        debounce_count <= debounce_count + 1;
                        debounce_count2 <= 0;
                        if (!PB)
                            begin
                                state <= INI;
                            end
                        else if (debounce_count[N_dc-2])
                            begin 
                                state <= SCEN_st;
                            end
                      end
                   SCEN_st: begin
                        state_string  = "  SCEN  ";
                        debounce_count <= 0;
                        debounce_count2 <= debounce_count2 + 1;
                        if (debounce_count2[19])
                            begin
                                MCEN_count <= MCEN_count + 1;
                                state <= WH;
                            end
                      end
                   WH: begin
                        state_string  = "   WH   ";
                        debounce_count <= debounce_count + 1;
                        debounce_count2 <= 0;
                        if (!PB)
                            begin
                                state <= CCR;
                            end	
                        if (debounce_count[N_dc-1])
                            begin
                                state <= MCEN_st;
                            end
                      end
                   MCEN_st: begin
                        state_string  = " MCEN_st";
                        debounce_count <= 0;
                        debounce_count2 <= debounce_count2 + 1;
                        if (debounce_count2[19])
                            begin
                                state <= CCEN_st;
                                MCEN_count <= MCEN_count + 1;
                            end
                      end
                   CCEN_st: begin
                        state_string  = " CCEN_st";
                        debounce_count <= debounce_count + 1;
                        debounce_count2 <= 0;
                        if (!PB)
                            begin
                                state <= CCR;
                            end
                        else if (debounce_count[N_dc-1])
                            begin
                                if (MCEN_count == 5'b10110)
                                    begin
                                        state <= CCR;
                                    end
                                else
                                    begin
                                        state <= MCEN_st;
                                    end
                            end
                      end
                   MCEN_cont: begin
                        state_string  = "MCEN_con";
                        debounce_count2 <= 0;
                        if (!PB)
                            begin
                                state <= CCR;
                            end
                      end
                   CCR: begin
                        state_string  = "   CCR  ";
                        debounce_count <= 0;
                        debounce_count2 <= 0;
                        MCEN_count <= 0;
                        state <= WFCR;
                      end
                   WFCR: begin
                        state_string  = "  WFCR  ";
                        debounce_count <= debounce_count + 1;
                        if (PB)
                            begin
                                state <= WH;
                                debounce_count <= 0;
                            end
                        else if (!PB)
                            begin
                                state <= INI;
                            end
                      end
                endcase		    
            end
    end 

endmodule