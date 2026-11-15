module origen_221088(
    input s_axis_aclk,
    input s_axis_aresetn,
    input [31:0] s_axis_tdata,
    input s_axis_tlast,
    input s_axis_tvalid,
    output reg DOUT,
    output reg s_axis_tready
);

reg [23:0] ws_shiftreg;
reg [2:0] bitcount;
reg [2:0] subbitcount;
reg [7:0] subbittimer;
reg [7:0] subbittimer_top;
reg subbitclk_enable;
reg transfer;
reg [1:0] state;
reg [2:0] bit_shiftreg;

localparam IDLE = 2'b00;
localparam LOAD = 2'b01;
localparam SHIFT = 2'b10;

always @(posedge s_axis_aclk or negedge s_axis_aresetn) begin
    if(!s_axis_aresetn) begin
        DOUT <= 1'b0;
        s_axis_tready <= 1'b0;
        ws_shiftreg <= 24'b0;
        bitcount <= 3'b0;
        subbitcount <= 3'b0;
        subbittimer <= 8'b0;
        subbittimer_top <= 8'b0;
        subbitclk_enable <= 1'b0;
        transfer <= 1'b0;
        state <= IDLE;
        bit_shiftreg <= 3'b0;
    end
    else begin
        case(state)
            IDLE: begin
                if(s_axis_tvalid && s_axis_tlast) begin
                    transfer <= 1'b1;
                    state <= LOAD;
                end
                else begin
                    transfer <= 1'b0;
                    s_axis_tready <= 1'b1;
                end
                DOUT <= 1'b0;
            end
            LOAD: begin
                ws_shiftreg <= s_axis_tdata[23:0];
                bitcount <= 3'b111;
                subbitcount <= 3'b111;
                subbittimer_top <= 8'h4C;
                subbittimer <= subbittimer_top;
                subbitclk_enable <= 1'b1;
                s_axis_tready <= 1'b0;
                bit_shiftreg <= 3'b111;
                state <= SHIFT;
            end
            SHIFT: begin
                if(subbitcount == 3'b000 && bitcount == 3'b000) begin
                    subbitclk_enable <= 1'b0;
                    state <= IDLE;
                end
                else begin
                    if(subbitcount == 3'b000) begin
                        bitcount <= bitcount - 1'b1;
                        subbitcount <= 3'b111;
                        ws_shiftreg <= {ws_shiftreg[22:0], 1'b0};
                        subbittimer_top <= 8'h15;
                        bit_shiftreg <= {bit_shiftreg[1:0], ws_shiftreg[23]};
                    end
                    else begin
                        subbitcount <= subbitcount - 1'b1;
                    end
                    if(subbittimer == 8'b0) begin
                        subbittimer <= subbittimer_top;
                        DOUT <= bit_shiftreg[2];
                    end
                    else begin
                        subbittimer <= subbittimer - 1'b1;
                    end
                end
            end
        endcase
    end
end

endmodule