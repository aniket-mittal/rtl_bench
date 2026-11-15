module autovcoder_130164 (  
    input clk,  
    input rst,  
    input start,  
    input [7:0] dividend,  
    input [7:0] divisor,  
    output reg [7:0] quotient,  
    output reg [7:0] remainder,  
    output reg done  
);  

    reg [7:0] temp_dividend;  
    reg [7:0] temp_quotient;  
    reg [3:0] count;  
    reg [7:0] subtract;  

    always @(posedge clk or posedge rst) begin  
        if (rst) begin  
            quotient <= 8'b0;  
            remainder <= 8'b0;  
            temp_dividend <= 8'b0;  
            temp_quotient <= 8'b0;  
            count <= 4'b0;  
            done <= 0;  
        end else if (start) begin  
            temp_dividend <= dividend;  
            temp_quotient <= 8'b0;  
            count <= 4'b1000; // Start with 8 bits  
            done <= 0;  
        end else if (count > 0) begin  
            temp_quotient <= temp_quotient << 1;  
            temp_quotient[0] <= 1;  
            subtract = temp_dividend - divisor;  

            if (subtract[7] == 0) begin  
                temp_dividend <= subtract;  
                quotient <= temp_quotient;  
            end else begin  
                quotient <= temp_quotient >> 1;  
            end  

            count <= count - 1;  
        end else begin  
            remainder <= temp_dividend;  
            done <= 1;  
        end  
    end  
endmodule