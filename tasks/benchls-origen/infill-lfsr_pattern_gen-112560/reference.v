module origen_112560 (
    input wire clock,
    input wire reset,
    output reg [7:0] pattern
);

reg [2:0] generateBits;
wire getResponse;

assign getResponse = ~(generateBits[0] ^ generateBits[1]);

always @(posedge clock or posedge reset) begin
    if (reset) begin
        generateBits <= 3'b000;
    end else begin
        generateBits <= {generateBits[1:0], getResponse};
    end
end

always @(*) begin
    case (generateBits)
        3'b000: pattern = 8'b11110000;
        3'b001: pattern = 8'b11100001;
        3'b011: pattern = 8'b11000011;
        3'b111: pattern = 8'b10000111;
        3'b110: pattern = 8'b00001111;
        3'b100: pattern = 8'b00011110;
        default: pattern = 8'b00000000;
    endcase
end

endmodule

