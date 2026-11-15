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

always @(*) begin
    next_state = current_state;
    idle = 1'b0;
    acq = 1'b0;
    conv = 1'b0;
    read = 1'b0;
    sc = 1'b0;
    hv_wr = 1'b0;
    error = 1'b0;

    case (current_state)
        IDLE: begin
            idle = 1'b1;
            if (acquisition) begin
                next_state = ACQ;
            end
            else if (sc_req) begin
                next_state = SC;
            end
            else if (hv_config_en) begin
                next_state = HV_CFG_WR;
            end
        end
        ACQ: begin
            acq = 1'b1;
            if (!acquisition && chipsat) begin
                next_state = CONV;
            end
        end
        CONV: begin
            conv = 1'b1;
            if (!chipsat) begin
                next_state = READ;
            end
        end
        READ: begin
            read = 1'b1;
            if (end_readout) begin
                next_state = IDLE;
            end
        end
        SC: begin
            sc = 1'b1;
            if (sc_done) begin
                next_state = IDLE;
            end
        end
        HV_CFG_WR: begin
            hv_wr = 1'b1;
            if (hv_config_rep_receive) begin
                next_state = HV_CFG_RD;
            end
        end
        HV_CFG_RD: begin
            if (hv_config_done) begin
                next_state = IDLE;
            end
        end
        default: begin
            error = 1'b1;
        end
    endcase
end

endmodule