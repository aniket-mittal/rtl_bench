module origen_135702 (
    input wire clk,
    input wire reset,
    input wire [3:0] in1,
    input wire [3:0] in2,
    input wire [1:0] op,
    output reg [3:0] out1,
    output reg [3:0] out2,
    output reg [3:0] out3,
    output reg [3:0] out4
);

reg [1:0] prev_op;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        out1 <= 4'b0000;
        out2 <= 4'b0000;
        out3 <= 4'b0000;
        out4 <= 4'b0000;
        prev_op <= 2'b11; // Initialize to an invalid value
    end else if (op != prev_op) begin
        case (op)
            2'b00: begin // AND operation
                out1 <= in1[0] & in2[0];
                out2 <= in1[1] & in2[1];
                out3 <= in1[2] & in2[2];
                out4 <= in1[3] & in2[3];
            end
            2'b01: begin // OR operation
                out1 <= in1[0] | in2[0];
                out2 <= in1[1] | in2[1];
                out3 <= in1[2] | in2[2];
                out4 <= in1[3] | in2[3];
            end
            2'b10: begin // XOR operation
                out1 <= in1[0] ^ in2[0];
                out2 <= in1[1] ^ in2[1];
                out3 <= in1[2] ^ in2[2];
                out4 <= in1[3] ^ in2[3];
            end
            2'b11: begin // NOT operation
                out1 <= ~in1[0];
                out2 <= ~in1[1];
                out3 <= ~in1[2];
                out4 <= ~in1[3];
            end
        endcase
        prev_op <= op;
    end
end

endmodule