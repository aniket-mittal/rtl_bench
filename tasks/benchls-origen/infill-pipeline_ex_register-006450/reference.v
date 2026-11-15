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

    always @(posedge clk or negedge clrn) begin
        if (!clrn) begin
            ewreg <= 0;
            em2reg <= 0;
            ewmem <= 0;
            ejal <= 0;
            E_WZ <= 0;
            DE_BRANCH <= 0;
            ealuc <= 5'b0;
            E_BDEPEND <= 2'b0;
            E_ADEPEND <= 2'b0;
            ea <= 32'b0;
            eb <= 32'b0;
            eimm <= 32'b0;
            epc4 <= 32'b0;
            ern <= 5'b0;
        end else begin
            ewreg <= dwreg;
            em2reg <= dm2reg;
            ewmem <= dwmem;
            ejal <= djal;
            E_WZ <= D_WZ;
            DE_BRANCH <= D_BRANCH;
            ealuc <= daluc;
            E_BDEPEND <= D_BDEPEND;
            E_ADEPEND <= D_ADEPEND;
            ea <= da;
            eb <= db;
            eimm <= dimm;
            epc4 <= dpc4;
            ern <= drn;
        end
    end

endmodule