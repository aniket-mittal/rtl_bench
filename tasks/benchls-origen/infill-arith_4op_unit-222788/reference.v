module origen_222788(
    input [31:0] A,
    input [31:0] B,
    input [1:0] op,
    output reg [31:0] sum,
    output reg [31:0] diff,
    output reg [31:0] prod,
    output reg [31:0] quot,
    output reg ready
);

always @(*) begin
    ready = 1;
    case (op)
        2'b00: begin
            sum = A + B;
            diff = A - B;
            prod = A * B;
            quot = B == 0 ? 32'hFFFFFFFF : A / B;
        end
        2'b01: begin
            sum = A + B;
            diff = A - B;
            prod = A * B;
            quot = B == 0 ? 32'hFFFFFFFF : A / B;
        end
        2'b10: begin
            sum = A + B;
            diff = A - B;
            prod = A * B;
            quot = B == 0 ? 32'hFFFFFFFF : A / B;
        end
        2'b11: begin
            sum = A + B;
            diff = A - B;
            prod = A * B;
            quot = B == 0 ? 32'hFFFFFFFF : A / B;
            ready = B == 0 ? 0 : 1;
        end
        default: begin
            sum = 32'b0;
            diff = 32'b0;
            prod = 32'b0;
            quot = 32'b0;
            ready = 1;
        end
    endcase
end

endmodule