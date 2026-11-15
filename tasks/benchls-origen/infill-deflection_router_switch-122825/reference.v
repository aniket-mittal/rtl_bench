module origen_122825 #(
    parameter MODE = 0
) (
    input [3:0] ppv_0,
    input [3:0] ppv_1,
    input vld_0,
    input vld_1,
    input winner,
    output reg deflect_0,
    output reg deflect_1,
    output reg swap
);

    wire [3:0] winning_ppv = winner ? ppv_1 : ppv_0;
    wire [3:0] losing_ppv = winner ? ppv_0 : ppv_1;
    wire winning_vld = winner ? vld_1 : vld_0;
    wire losing_vld = winner ? vld_0 : vld_1;

    generate
        case (MODE)
            0: begin
                always @(*) begin
                    swap = (winning_ppv[3:2] == 2'b01) || (winning_ppv[3:2] == 2'b10);
                    deflect_0 = (ppv_0 == ppv_1) && vld_0 && vld_1 && winner;
                    deflect_1 = (ppv_0 == ppv_1) && vld_0 && vld_1 && !winner;
                end
            end

            1: begin
                always @(*) begin
                    swap = (winning_ppv[3:1] == 3'b001) || (winning_ppv[3:1] == 3'b010) || (winning_ppv[3:1] == 3'b100);
                    deflect_0 = ((ppv_0 == ppv_1) && vld_0 && vld_1 && winner) || (ppv_0[3] && vld_0);
                    deflect_1 = ((ppv_0 == ppv_1) && vld_0 && vld_1 && !winner) || (ppv_1[3] && vld_1);
                end
            end

            2: begin
                always @(*) begin
                    swap = (winning_ppv[3:0] == 4'b0001) || (winning_ppv[3:0] == 4'b0010) || 
                           (winning_ppv[3:0] == 4'b0100) || (winning_ppv[3:0] == 4'b1000);
                    deflect_0 = ((ppv_0 == ppv_1) && vld_0 && vld_1 && winner) || (ppv_0[2] && vld_0);
                    deflect_1 = ((ppv_0 == ppv_1) && vld_0 && vld_1 && !winner) || (ppv_1[2] && vld_1);
                end
            end

            default: begin
                always @(*) begin
                    swap = 1'b0;
                    deflect_0 = 1'b0;
                    deflect_1 = 1'b0;
                end
            end
        endcase
    endgenerate

endmodule