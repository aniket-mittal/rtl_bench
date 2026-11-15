module origen_176761(
    input clk,
    input ingplaca,
    input [3:0] teclado,
    output reg [23:0] placa,
    output reg [23:0] placafake
);

    reg [3:0] d1, d2, d3, d4, d5, d6;

    always @(posedge clk) begin
        if (!ingplaca) begin
            d1 <= 4'b0000;
            d2 <= 4'b0000;
            d3 <= 4'b0000;
            d4 <= 4'b0000;
            d5 <= 4'b0000;
            d6 <= 4'b0000;
            placa <= 24'b000000000000000000000000;
            placafake <= 24'b000000000000000000000000;
        end
        else begin
            if (teclado != 4'b0000) begin
                if (d1 == 4'b0000) begin
                    d1 <= teclado;
                    placafake[23:20] <= teclado;
                end
                else if (d2 == 4'b0000) begin
                    d2 <= teclado;
                    placafake[19:16] <= teclado;
                end
                else if (d3 == 4'b0000) begin
                    d3 <= teclado;
                    placafake[15:12] <= teclado;
                end
                else if (d4 == 4'b0000) begin
                    d4 <= teclado;
                    placafake[11:8] <= teclado;
                end
                else if (d5 == 4'b0000) begin
                    d5 <= teclado;
                    placafake[7:4] <= teclado;
                end
                else if (d6 == 4'b0000) begin
                    d6 <= teclado;
                    placafake[3:0] <= teclado;
                    placa <= {d1, d2, d3, d4, d5, d6};
                end
            end
        end
    end

endmodule