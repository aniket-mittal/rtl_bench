module origen_147297 (
    input wire [7:0] count,
    input wire clk,
    input wire calculate,
    output reg [3:0] centenas,
    output reg [3:0] decenas,
    output reg [3:0] unidades,
    output reg C,
    output reg De,
    output reg U
);

reg [7:0] digitT;
reg [1:0] state;

always @(posedge clk) begin
    if (!calculate) begin
        centenas <= 4'b0000;
        decenas <= 4'b0000;
        unidades <= 4'b0000;
        C <= 1'b0;
        De <= 1'b0;
        U <= 1'b0;
        state <= 2'b00;
    end else begin
        case (state)
            2'b00: begin
                digitT <= count;
                state <= 2'b01;
            end
            2'b01: begin
                centenas <= digitT / 100;
                C <= (digitT >= 100) ? 1'b1 : 1'b0;
                digitT <= digitT % 100;
                state <= 2'b10;
            end
            2'b10: begin
                decenas <= digitT / 10;
                De <= (digitT >= 10) ? 1'b1 : 1'b0;
                digitT <= digitT % 10;
                state <= 2'b11;
            end
            2'b11: begin
                unidades <= digitT;
                U <= (digitT > 0) ? 1'b1 : 1'b0;
                state <= 2'b00;
            end
        endcase
    end
end

endmodule