module origen_200101(
    input clock,
    input reset,
    input ex_if_stall,
    input id_if_selpcsource,
    input [31:0] id_if_rega,
    input [31:0] id_if_pcimd2ext,
    input [31:0] id_if_pcindex,
    input [1:0] id_if_selpctype,
    input [31:0] mc_if_data,
    output reg [31:0] if_id_nextpc,
    output reg [31:0] if_id_instruc,
    output reg if_mc_en,
    output reg [31:0] if_mc_addr
);

    reg [31:0] pc;

    [MASKED]

    always @(*) begin
        if_mc_addr = pc;
    end

endmodule