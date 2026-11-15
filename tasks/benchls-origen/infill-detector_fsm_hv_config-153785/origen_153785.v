module origen_153785(
    input clk,
    input rst_n,
    input acquisition,
    input hv_config_en,
    input hv_config_rep_receive,
    input hv_config_done,
    input chipsat,
    input sc_req,
    input sc_done,
    input end_readout,
    output reg idle,
    output reg acq,
    output reg conv,
    output reg read,
    output reg sc,
    output reg hv_wr,
    output reg error
);

reg [2:0] current_state, next_state;
localparam IDLE = 3'b000, ACQ = 3'b001, CONV = 3'b010, READ = 3'b011, SC = 3'b100, HV_CFG_WR = 3'b101, HV_CFG_RD = 3'b110;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        current_state <= IDLE;
        error <= 1'b0;
    end
    else begin
        current_state <= next_state;
    end
end

[MASKED]

endmodule