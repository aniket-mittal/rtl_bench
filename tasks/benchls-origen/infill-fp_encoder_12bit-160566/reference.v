module origen_160566(
    input  [11:0] D,
    output       S,
    output [2:0] E,
    output [3:0] F
);

    reg [11:0] out;
    reg [2:0] exponent;
    wire [11:0] abs_D = (D[11]) ? -D : D;

    always @(*) begin
        case (abs_D[11:4])
            8'b10000000: begin
                out = {1'b0, abs_D[10:7], 4'b1110};
                exponent = 7;
            end
            8'b01000000: begin
                out = {1'b0, abs_D[9:6], 4'b0000};
                exponent = 6;
            end
            8'b00100000: begin
                out = {1'b0, abs_D[8:5], 4'b0000};
                exponent = 5;
            end
            8'b00010000: begin
                out = {1'b0, abs_D[7:4], 4'b0000};
                exponent = 4;
            end
            8'b00001000: begin
                out = {1'b0, abs_D[6:3], 4'b0000};
                exponent = 3;
            end
            8'b00000100: begin
                out = {1'b0, abs_D[5:2], 4'b0000};
                exponent = 2;
            end
            8'b00000010: begin
                out = {1'b0, abs_D[4:1], 4'b0000};
                exponent = 1;
            end
            default: begin
                out = {1'b0, abs_D[3:0], 4'b0000};
                exponent = 0;
            end
        endcase
    end

    assign S = D[11];
    assign E = exponent;
    assign F = (out[5]) ? (out[3:0] + 1'b1) : out[3:0];

endmodule