module origen_165360 (
    input clock,
    input reset,
    input din_valid,
    output din_ready,
    input [63:0] din_rs1,
    input din_insn20,
    input din_insn21,
    input din_insn23,
    output dout_valid,
    input dout_ready,
    output [63:0] dout_rd
);

    reg [3:0] state;
    reg [63:0] data;
    reg [63:0] next;
    reg cmode;

    assign din_ready = (state == 15);
    assign dout_valid = (state == 0);
    assign dout_rd = data;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            state <= 15;
            cmode <= 0;
        end
        else begin
            if (din_valid && din_ready) begin
                state <= {din_insn21, din_insn20};
                data <= din_rs1;
                cmode <= din_insn23;
            end
            else if (dout_valid && dout_ready) begin
                state <= 15;
            end
            else begin
                state <= state - 1;
                data <= next;
            end

            case (cmode)
                1'b0: begin
                    next = {data[62:0], 1'b0} ^ (data[63] ? 64'h04c11db7 : 64'h0);
                end
                1'b1: begin
                    next = {data[62:0], 1'b0} ^ (data[63] ? 64'h42f0e1eb : 64'h0);
                end
            endcase
        end
    end

endmodule