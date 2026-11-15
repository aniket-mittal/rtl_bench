module autovcoder_141656 (
    input wire clk,
    input wire rst,
    input wire start,
    input wire [7:0] numerator,
    input wire [7:0] denominator,
    output reg [7:0] quotient,
    output reg [7:0] remainder,
    output reg done
);
    reg [7:0] temp_numerator;
    reg [7:0] temp_denominator;
    reg [3:0] count;
    reg state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            quotient <= 8'b0;
            remainder <= 8'b0;
            done <= 0;
            count <= 4'b0;
            state <= 0;
        end else if (start) begin
            temp_numerator <= numerator;
            temp_denominator <= denominator;
            quotient <= 8'b0;
            remainder <= 8'b0;
            count <= 4'b0;
            done <= 0;
            state <= 1;
        end else if (state) begin
            if (count < 8) begin
                remainder <= {remainder[6:0], temp_numerator[7]}; // Shift in numerator
                temp_numerator <= {temp_numerator[6:0], 1'b0}; // Shift left numerator
                if (remainder >= temp_denominator) begin
                    remainder <= remainder - temp_denominator;
                    quotient[count] <= 1;
                end
                count <= count + 1;
            end else begin
                done <= 1;
                state <= 0;
            end
        end
    end
endmodule