module origen_124040 (
    input wire clk,
    input wire reset,
    input wire [1:0] op,
    input wire [7:0] a,
    input wire [7:0] b,
    output reg [7:0] result,
    output reg valid
);

reg [7:0] temp_result;
reg temp_valid;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        result <= 8'b0;
        valid <= 1'b0;
    end else begin
        result <= temp_result;
        valid <= temp_valid;
    end
end

always @(*) begin
    case (op)
        2'b00: begin
            temp_result = a + b;
            temp_valid = 1'b1;
        end
        2'b01: begin
            temp_result = a - b;
            temp_valid = 1'b1;
        end
        2'b10: begin
            temp_result = a * b;
            temp_valid = 1'b1;
        end
        2'b11: begin
            if (b != 8'b0) begin
                temp_result = a / b;
                temp_valid = 1'b1;
            end else begin
                temp_result = 8'b0;
                temp_valid = 1'b0;
            end
        end
        default: begin
            temp_result = result;
            temp_valid = 1'b0;
        end
    endcase
end

endmodule