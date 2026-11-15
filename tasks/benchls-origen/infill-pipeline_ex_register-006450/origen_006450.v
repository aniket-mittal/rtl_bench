module origen_006450 (
    input wire clk, clrn,
    input wire dwreg, dm2reg, dwmem, djal, D_WZ, D_BRANCH,
    input wire [4:0] daluc,
    input wire [1:0] D_BDEPEND, D_ADEPEND,
    input wire [31:0] da, db, dimm, dpc4,
    input wire [4:0] drn,
    output reg ewreg, em2reg, ewmem, ejal, E_WZ, DE_BRANCH,
    output reg [4:0] ealuc,
    output reg [1:0] E_BDEPEND, E_ADEPEND,
    output reg [31:0] ea, eb, eimm, epc4,
    output reg [4:0] ern
);

    [MASKED]

endmodule