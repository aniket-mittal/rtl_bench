module origen_185202(
    input clk,
    input rst,
    input enable_leer,
    output reg CS_l,
    output reg RD_l,
    output reg WR_l,
    output reg A_D_l,
    output reg [5:0] cont_lectura,
    output reg en_tri
);

reg [5:0] cont;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        cont <= 6'b000000;
        CS_l <= 1'b1;
        RD_l <= 1'b1;
        WR_l <= 1'b1;
        A_D_l <= 1'b1;
        en_tri <= 1'b0;
    end
    else if (enable_leer) begin
        cont_lectura <= cont;
        case (cont)
            6'd1, 6'd11: begin
                CS_l <= 1'b1;
                RD_l <= 1'b1;
                WR_l <= 1'b1;
                A_D_l <= 1'b1;
                en_tri <= 1'b0;
            end
            6'd2, 6'd10: begin
                CS_l <= 1'b0;
                RD_l <= 1'b1;
                WR_l <= 1'b1;
                A_D_l <= 1'b1;
                en_tri <= 1'b0;
            end
            6'd3, 6'd4, 6'd5, 6'd6, 6'd8, 6'd9: begin
                CS_l <= 1'b0;
                RD_l <= 1'b1;
                WR_l <= 1'b0;
                A_D_l <= 1'b1;
                en_tri <= 1'b0;
            end
            6'd7: begin
                CS_l <= 1'b0;
                RD_l <= 1'b1;
                WR_l <= 1'b0;
                A_D_l <= 1'b1;
                en_tri <= 1'b0;
            end
            6'd13: begin
                CS_l <= 1'b1;
                RD_l <= 1'b1;
                WR_l <= 1'b1;
                A_D_l <= 1'b1;
                en_tri <= 1'b0;
            end
            6'd24, 6'd32: begin
                CS_l <= 1'b0;
                RD_l <= 1'b1;
                WR_l <= 1'b1;
                A_D_l <= 1'b0;
                en_tri <= 1'b0;
            end
            6'd25, 6'd26, 6'd27, 6'd28, 6'd29, 6'd30, 6'd31: begin
                CS_l <= 1'b0;
                RD_l <= 1'b0;
                WR_l <= 1'b1;
                A_D_l <= 1'b0;
                en_tri <= 1'b0;
            end
            default: begin
                CS_l <= 1'b1;
                RD_l <= 1'b1;
                WR_l <= 1'b1;
                A_D_l <= 1'b1;
                en_tri <= 1'b0;
            end
        endcase
        if (cont == 6'd42) begin
            cont <= 6'b000000;
        end
        else begin
            cont <= cont + 1;
        end
    end
end

endmodule