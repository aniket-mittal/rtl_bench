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

    always @(posedge clock or negedge reset) begin
        if (!reset) begin
            if_mc_en <= 0;
            if_id_instruc <= 0;
            pc <= 0;
        end
        else begin
            if_mc_en <= 1;

            if (ex_if_stall) begin
                if_id_instruc <= if_id_instruc;
                if_id_nextpc <= if_id_nextpc;
            end
            else begin
                if_id_instruc <= mc_if_data;

                if (id_if_selpcsource) begin
                    case (id_if_selpctype)
                        2'b00: if_id_nextpc <= id_if_pcimd2ext;
                        2'b01: if_id_nextpc <= id_if_rega;
                        2'b10: if_id_nextpc <= id_if_pcindex;
                        2'b11: if_id_nextpc <= 32'h00000040;
                    endcase
                end
                else begin
                    if_id_nextpc <= pc + 4;
                end

                pc <= if_id_nextpc;
            end
        end
    end

    always @(*) begin
        if_mc_addr = pc;
    end

endmodule