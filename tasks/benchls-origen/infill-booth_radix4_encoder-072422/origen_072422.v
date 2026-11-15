module origen_072422 (
    input [53:0] A,
    input [2:0] code,
    output reg [53:0] product,
    output reg sn,
    output reg [1:0] h
);

    parameter SRC_WIDTH = 54;

    [MASKED]

    always @(*) begin
        case (code)
            3'b000: sn = 1'b0;
            3'b001: sn = 1'b0;
            3'b010: sn = 1'b0;
            3'b011: sn = 1'b0;
            3'b100: sn = 1'b1;
            3'b101: sn = 1'b1;
            3'b110: sn = 1'b1;
            3'b111: sn = 1'b0;
            default: sn = 1'bx;
        endcase
    end

    always @(*) begin
        case (code)
            3'b000: h = 2'b00;
            3'b001: h = 2'b01;
            3'b010: h = 2'b01;
            3'b011: h = 2'b10;
            3'b100: h = 2'b10;
            3'b101: h = 2'b01;
            3'b110: h = 2'b01;
            3'b111: h = 2'b00;
            default: h = 2'bxx;
        endcase
    end

endmodule