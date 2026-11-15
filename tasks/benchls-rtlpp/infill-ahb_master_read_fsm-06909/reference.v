module rtlpp_06909( 
    input      wire         HCLK,
    input      wire         HRESETn,
    
    input      wire         READ,
    output     reg   [15:0] DATAOUT,
    
    output     reg   [31:0] HADDR,
    output     reg   [1:0]  HTRANS,
    output     reg          HWRITE,
    output     wire  [2:0]  HSIZE,
    output     wire  [2:0]  HBURST,
    output     wire  [3:0]  HPROT,
    output     reg   [31:0] HWDATA,
    
    input      wire  [15:0] HRDATA,
    input      wire         HREADY,
    input      wire  [1:0]  HRESP,
    
    output           [1:0]  RESP_err,
    output     reg          AHB_BUSY,
    output     reg          VALID
);

reg [2:0] ahb_fsm_current_state;
parameter [2:0] Idle_1 = 3'b000, Read_FIC_0 = 3'b001, Read_FIC_1 = 3'b010, Read_FIC_2 = 3'b011, Read_FIC_3 = 3'b100;

parameter [31:0] ADDR = 32'h20008000;

assign RESP_err = HRESP;
assign HBURST = 3'b000;
assign HPROT  = 4'b0011;
assign HSIZE  = 3'b001;

always @(posedge HCLK or negedge HRESETn) begin
    if(HRESETn == 1'b0) begin
        HADDR <= 32'h00000000;
        HTRANS <= 2'b00;  
        HWRITE <= 1'b1;
        VALID <= 1'b0;
        HWDATA <= 32'h00000000;
        DATAOUT <= 16'h0000;
        ahb_fsm_current_state <= Idle_1;
        AHB_BUSY <= 1'b0;
    end else begin
        case (ahb_fsm_current_state)
            Idle_1: begin
                VALID <= 1'b0;
                if (READ == 1'b1) begin
                    ahb_fsm_current_state <= Read_FIC_0;
                    HADDR <= ADDR;   
                    HWRITE <= 1'b0;                    						
                    AHB_BUSY <= 1'b1;
                end else begin
                    ahb_fsm_current_state <= Idle_1;
                end
            end

            Read_FIC_0: begin
                HTRANS <= 2'b10;
                HWRITE <= 1'b1;
                ahb_fsm_current_state <= Read_FIC_1;
            end

            Read_FIC_1: begin
                if (HREADY == 1'b0) begin
                    ahb_fsm_current_state <= Read_FIC_1;
                end else begin
                    HADDR <= 32'h00000000;  
                    HTRANS <= 2'b00;
                    ahb_fsm_current_state <= Read_FIC_2;
                end
            end
            
            Read_FIC_2: begin
                if (HREADY == 1'b0) begin
                    ahb_fsm_current_state <= Read_FIC_2;
                    AHB_BUSY <= 1'b1;
                end else begin
                    DATAOUT <= HRDATA;	  
                    VALID <= 1'b1;                       
                    ahb_fsm_current_state <= Read_FIC_3;
                    AHB_BUSY <= 1'b0;
                end       
            end     

            Read_FIC_3: begin
                ahb_fsm_current_state <= Idle_1;
            end
        endcase
    end     
end

endmodule