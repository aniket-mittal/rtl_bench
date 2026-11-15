module origen_034805(
    input zero,
    input [5:0] op,
    input [5:0] func,
    output reg alusrcb,
    output reg writereg,
    output reg branch,
    output reg jump,
    output reg memtoreg,
    output reg regdes,
    output reg writemem,
    output reg [2:0] aluc
);

    // Instruction type decoding
    wire r_type = (op == 6'b000000);
    wire i_type_lw = (op == 6'b100011);
    wire i_type_sw = (op == 6'b101011);
    wire i_type_beq = (op == 6'b000100);
    wire j_type = (op == 6'b000010);

    // R-type instruction decoding
    wire r_add = r_type && (func == 6'b100000);
    wire r_sub = r_type && (func == 6'b100010);
    wire r_and = r_type && (func == 6'b100100);
    wire r_or  = r_type && (func == 6'b100101);
    wire r_slt = r_type && (func == 6'b101010);

    [MASKED]

endmodule