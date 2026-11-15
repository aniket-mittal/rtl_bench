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

    [MASKED]

endmodule