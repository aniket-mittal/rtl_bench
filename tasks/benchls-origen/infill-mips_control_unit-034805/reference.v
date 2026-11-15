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

    always @(*) begin
        // Default values
        alusrcb = 1'b0;
        writereg = 1'b0;
        branch = 1'b0;
        jump = 1'b0;
        memtoreg = 1'b0;
        regdes = 1'b0;
        writemem = 1'b0;
        aluc = 3'b000;

        // Control signal generation
        if (r_type || i_type_lw) writereg = 1'b1;
        if (i_type_lw || i_type_sw) alusrcb = 1'b1;
        if (i_type_beq && zero) branch = 1'b1;
        if (j_type) jump = 1'b1;
        if (i_type_lw) memtoreg = 1'b1;
        if (i_type_lw) regdes = 1'b1;
        if (i_type_sw) writemem = 1'b1;

        // ALU control
        if (r_sub || r_slt || i_type_beq) aluc[2] = 1'b1;
        if (r_add || r_sub || r_slt || i_type_lw || i_type_sw || i_type_beq) aluc[1] = 1'b1;
        if (r_or || r_slt) aluc[0] = 1'b1;
    end

endmodule