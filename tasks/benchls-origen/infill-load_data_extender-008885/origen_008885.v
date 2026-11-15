module origen_008885 (
    input [31:0] m_addr,
    input [31:0] d_f_mem,
    input [36:0] inst_decode,
    output reg [31:0] mem_out
);

    wire i_lb  = inst_decode[0];
    wire i_lh  = inst_decode[1];
    wire i_lw  = inst_decode[2];
    wire i_lbu = inst_decode[3];
    wire i_lhu = inst_decode[4];

    [MASKED]

endmodule