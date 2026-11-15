module origen_134729 (
    input wire clk,
    input wire [1:0] ctlwb_out,
    input wire [2:0] ctlm_out,
    input wire [31:0] adder_out,
    input wire aluzero,
    input wire [31:0] aluout,
    input wire [31:0] readdat2,
    input wire [4:0] muxout,
    output reg wb_ctlout,
    output reg m_ctlout,
    output reg [31:0] add_result,
    output reg zero,
    output reg [31:0] alu_result,
    output reg [31:0] rdata2out,
    output reg [4:0] five_bit_muxout
);

[MASKED]

endmodule