module autovcoder_140804 (  
    input clk,  
    input rst,  
    input [7:0] dividend,  
    input [7:0] divisor,  
    output reg [7:0] quotient,  
    output reg [7:0] remainder,  
    output reg valid  
);  
    reg [7:0] temp_dividend;  
    reg [7:0] temp_divisor;  
    reg [3:0] count;  

    always @(posedge clk or posedge rst) begin  
        if (rst) begin  
            quotient <= 8'b0;  
            remainder <= 8'b0;  
            valid <= 0;  
            count <= 0;  
        end else begin  
            if (count == 0) begin  
                if (divisor == 0) begin  
                    quotient <= 8'b0;  
                    remainder <= 8'b0;  
                    valid <= 1;  
                end else begin  
                    temp_dividend <= dividend;  
                    temp_divisor <= divisor;  
                    quotient <= 8'b0;  
                    remainder <= 8'b0;  
                    valid <= 0;  
                    count <= 8;  
                end  
            end else begin  
                if (temp_dividend >= temp_divisor) begin  
                    temp_dividend <= temp_dividend - temp_divisor;  
                    quotient <= quotient + 1;  
                end else begin  
                    remainder <= temp_dividend;  
                end  
                count <= count - 1;  
                if (count == 1) begin  
                    valid <= 1;  
                end  
            end  
        end  
    end  
endmodule