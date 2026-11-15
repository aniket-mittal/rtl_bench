module origen_133680(
    input wire [3:0] num1,
    input wire [3:0] num2,
    input wire [1:0] operation,
    input wire clk,
    input wire reset,
    output reg [3:0] result,
    output reg [3:0] led_display
);

    reg [7:0] temp_result;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            result <= 4'b0000;
            led_display <= 4'b0000;
            temp_result <= 8'b00000000;
        end else begin
            case (operation)
                2'b00: begin // Addition
                    temp_result <= num1 + num2;
                    result <= temp_result[3:0];
                    led_display <= temp_result[3:0];
                end
                2'b01: begin // Subtraction
                    if (num1 >= num2) begin
                        temp_result <= num1 - num2;
                    end else begin
                        temp_result <= 8'b00000000;
                    end
                    result <= temp_result[3:0];
                    led_display <= temp_result[3:0];
                end
                2'b10: begin // Multiplication
                    temp_result <= num1 * num2;
                    result <= temp_result[3:0];
                    led_display <= temp_result[3:0];
                end
                2'b11: begin // Division
                    if (num2 != 4'b0000) begin
                        temp_result <= num1 / num2;
                    end else begin
                        temp_result <= 8'b11111111; // Error condition
                    end
                    result <= temp_result[3:0];
                    led_display <= temp_result[3:0];
                end
            endcase
        end
    end

endmodule