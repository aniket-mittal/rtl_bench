module origen_198389 (
    input  wire [31:0] tval2_i, tval1_i, data_bi, icconf_i,
    input  wire [12:0] addr_bi,
    input  wire        ins_i, we_bi, en_i, rst_i, clk_i,
    input  wire [1:0]  ictmr_i,
    output reg  [31:0] data_bo,
    output reg  [31:0] icov_o, icbne_o, icconf_o
);

    reg [31:0] icbuf [15:0];
    reg [4:0]  fst_idx_reg, idx_reg;
    reg [31:0] icconf_reg;
    reg        icbne_reg, icov_reg;

    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            fst_idx_reg <= 5'b0;
            idx_reg <= 5'b0;
            icbne_reg <= 1'b0;
            icov_reg <= 1'b0;
            icconf_reg <= 32'b0;
            for (int i = 0; i < 16; i++) begin
                icbuf[i] <= 32'b0;
            end
        end else begin
            if (ins_i && ictmr_i != 2'b00 && !icov_reg) begin
                case (ictmr_i)
                    2'b01, 2'b10: icbuf[idx_reg] <= tval1_i;
                    2'b11: icbuf[idx_reg] <= {tval2_i, tval1_i};
                endcase
                idx_reg <= idx_reg + 1'b1;
                icbne_reg <= 1'b1;
                icov_reg <= (fst_idx_reg == idx_reg);
            end

            if (en_i && we_bi) begin
                icconf_reg[addr_bi] <= data_bi;
            end

            if (en_i) begin
                if (addr_bi == 13'b0) begin
                    data_bo <= icconf_i;
                end else if (addr_bi == 13'b100 && icbne_reg) begin
                    data_bo <= icbuf[fst_idx_reg];
                    fst_idx_reg <= fst_idx_reg + 1'b1;
                    icov_reg <= 1'b0;
                end
            end
        end
    end

    assign icov_o = {31'b0, icov_reg};
    assign icbne_o = {31'b0, icbne_reg};
    assign icconf_o = icconf_reg;

endmodule