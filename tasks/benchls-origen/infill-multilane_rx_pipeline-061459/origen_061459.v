module origen_061459
        #(
            parameter   LANE_NUM = 2
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [LANE_NUM*8-1:0]    in_rxdatahs,
            input   wire    [LANE_NUM-1:0]      in_rxvalidhs,
            input   wire    [LANE_NUM-1:0]      in_rxactivehs,
            input   wire    [LANE_NUM-1:0]      in_rxsynchs,
            
            output  wire                        out_first,
            output  wire                        out_last,
            output  wire    [LANE_NUM*8-1:0]    out_data,
            output  wire                        out_valid
        );
    
    reg     [LANE_NUM*8-1:0]    st0_rxdatahs;
    reg     [LANE_NUM-1:0]      st0_rxvalidhs;
    reg     [LANE_NUM-1:0]      st0_rxactivehs;
    reg     [LANE_NUM-1:0]      st0_rxsynchs;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_rxdatahs   <= {(LANE_NUM*8){1'b0}};
            st0_rxvalidhs  <= {LANE_NUM{1'b0}};
            st0_rxactivehs <= {LANE_NUM{1'b0}};
            st0_rxsynchs   <= {LANE_NUM{1'b0}};
        end
        else begin
            st0_rxdatahs   <= in_rxdatahs;
            st0_rxvalidhs  <= in_rxvalidhs;
            st0_rxactivehs <= in_rxactivehs;
            st0_rxsynchs   <= in_rxsynchs;
        end
    end
    
    reg                     st1_busy;
    reg                     st1_first;
    reg                     st1_last;
    reg     [LANE_NUM*8-1:0] st1_data;
    reg                     st1_valid;
    
    [MASKED]
    
    assign out_first = st1_first;
    assign out_last  = st1_last;
    assign out_data  = st1_data;
    assign out_valid = st1_valid & st1_busy;

endmodule