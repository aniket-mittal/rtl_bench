module origen_217797(
    input clk25MHz,
    input up, down, right, left,
    input [3:0] step_2,
    input [2:0] secim1, es1, secim2,
    output reg [2:0] es2
);

parameter kare0 = 3'b000, kare1 = 3'b001, kare2 = 3'b010, kare3 = 3'b011,
          kare4 = 3'b100, kare5 = 3'b101, kare6 = 3'b110, kare7 = 3'b111;

reg [2:0] mover = 1;

always @(posedge clk25MHz) begin
    if (step_2 == 4'b0100) begin
        case ({secim1, es1, secim2})
            9'b000_000_000: begin
                if (up)    es2 <= kare2;
                else if (down)  es2 <= kare4;
                else if (right) es2 <= kare1;
                else if (left)  es2 <= kare3;
                else es2 <= kare0;
                mover <= 1;
            end
            9'b001_001_001: begin
                if (up)    es2 <= kare3;
                else if (down)  es2 <= kare5;
                else if (right) es2 <= kare2;
                else if (left)  es2 <= kare4;
                else es2 <= kare1;
                mover <= 1;
            end
            9'b010_010_010: begin
                if (up)    es2 <= kare4;
                else if (down)  es2 <= kare6;
                else if (right) es2 <= kare3;
                else if (left)  es2 <= kare5;
                else es2 <= kare2;
                mover <= 1;
            end
            9'b011_011_011: begin
                if (up)    es2 <= kare5;
                else if (down)  es2 <= kare7;
                else if (right) es2 <= kare4;
                else if (left)  es2 <= kare6;
                else es2 <= kare3;
                mover <= 1;
            end
            9'b100_100_100: begin
                if (up)    es2 <= kare6;
                else if (down)  es2 <= kare0;
                else if (right) es2 <= kare5;
                else if (left)  es2 <= kare7;
                else es2 <= kare4;
                mover <= 1;
            end
            9'b101_101_101: begin
                if (up)    es2 <= kare7;
                else if (down)  es2 <= kare1;
                else if (right) es2 <= kare6;
                else if (left)  es2 <= kare0;
                else es2 <= kare5;
                mover <= 1;
            end
            9'b110_110_110: begin
                if (up)    es2 <= kare0;
                else if (down)  es2 <= kare2;
                else if (right) es2 <= kare7;
                else if (left)  es2 <= kare1;
                else es2 <= kare6;
                mover <= 1;
            end
            9'b111_111_111: begin
                if (up)    es2 <= kare1;
                else if (down)  es2 <= kare3;
                else if (right) es2 <= kare0;
                else if (left)  es2 <= kare2;
                else es2 <= kare7;
                mover <= 1;
            end
            default: begin
                es2 <= kare0;
                mover <= 1;
            end
        endcase
    end
    else begin
        es2 <= kare0;
        mover <= 1;
    end
end

endmodule