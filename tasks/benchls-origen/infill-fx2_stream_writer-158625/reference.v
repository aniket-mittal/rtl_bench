module origen_158625(
    input reset_n,
    input fx2_flagb,
    input fx2_flagc,
    input fx2_ifclk,
    input tx_trigger,
    output [15:0] fx2_fdata,
    output [1:0] fx2_faddr,
    output fx2_slrd,
    output fx2_slwr,
    output fx2_sloe,
    output fx2_pkt_end
);

reg [15:0] data_out1;
reg [1:0] faddr;
reg state;

localparam STREAM_IN_IDLE = 1'b0;
localparam STREAM_IN_WRITE = 1'b1;

always @(posedge fx2_ifclk or negedge reset_n) begin
    if (!reset_n) begin
        state <= STREAM_IN_IDLE;
        faddr <= 2'b00;
        data_out1 <= 16'h0000;
    end else begin
        case (state)
            STREAM_IN_IDLE: begin
                if (fx2_flagc && tx_trigger) begin
                    state <= STREAM_IN_WRITE;
                    faddr <= 2'b00;
                    data_out1 <= 16'hABCD;  // Example data
                end
            end
            STREAM_IN_WRITE: begin
                if (fx2_flagb) begin
                    state <= STREAM_IN_IDLE;
                    faddr <= faddr + 2'b01;
                    data_out1 <= data_out1 + 16'h0001;
                end
            end
        endcase
    end
end

assign fx2_fdata = data_out1;
assign fx2_faddr = faddr;
assign fx2_slrd = state == STREAM_IN_WRITE ? 1'b0 : 1'b1;
assign fx2_slwr = state == STREAM_IN_WRITE ? 1'b0 : 1'b1;
assign fx2_sloe = state == STREAM_IN_WRITE ? 1'b0 : 1'b1;
assign fx2_pkt_end = (faddr == 2'b11) ? 1'b1 : 1'b0;

endmodule