module origen_007315(
    input wire clk,
    input wire [15:0] A,
    input wire [15:0] B,
    input wire [2:0] select,
    output reg z_flag,
    output reg [15:0] out,
    output reg finish
);

    always @(*) begin
        case(select)
            3'b000: begin // Addition
                out = A + B;
                z_flag = (out == 16'b0);
                finish = 1'b0;
            end
            3'b001: begin // Subtraction
                out = A - B;
                z_flag = (out == 16'b0);
                finish = 1'b0;
            end
            3'b010: begin // Multiplication
                out = A * B;
                finish = 1'b0;
            end
            3'b011: begin // Pass-through A
                out = A;
                finish = 1'b0;
            end
            3'b100: begin // Pass-through B
                out = B;
                finish = 1'b0;
            end
            3'b101: begin // Zero
                out = 16'b0;
                finish = 1'b0;
            end
            3'b110: begin // Finish
                out = 16'b0;
                finish = 1'b1;
            end
            default: begin
                out = 16'b0;
                finish = 1'b0;
            end
        endcase
    end

endmodule