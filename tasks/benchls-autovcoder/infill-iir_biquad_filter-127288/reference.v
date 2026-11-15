module autovcoder_127288 (  
    input clk,  
    input rst_n,  
    input [15:0] x_in,  
    output reg [15:0] y_out  
);  
    // Filter coefficients (example values)  
    parameter [15:0] a0 = 16'h0001;  
    parameter [15:0] a1 = 16'h0002;  
    parameter [15:0] a2 = 16'h0001;  
    parameter [15:0] b1 = 16'hFFFE;  
    parameter [15:0] b2 = 16'hFFFD;  
    parameter [15:0] b3 = 16'hFFFC;  
    parameter [15:0] b4 = 16'hFFFB;  

    reg [15:0] x_reg [0:4]; // input samples  
    reg [15:0] y_reg [0:3]; // output samples  

    always @(posedge clk or negedge rst_n) begin  
        if (!rst_n) begin  
            y_out <= 16'b0;  
            x_reg[0] <= 16'b0;  
            x_reg[1] <= 16'b0;  
            x_reg[2] <= 16'b0;  
            x_reg[3] <= 16'b0;  
            x_reg[4] <= 16'b0;  
            y_reg[0] <= 16'b0;  
            y_reg[1] <= 16'b0;  
            y_reg[2] <= 16'b0;  
            y_reg[3] <= 16'b0;  
        end else begin  
            // Shift the previous input samples  
            x_reg[4] <= x_reg[3];  
            x_reg[3] <= x_reg[2];  
            x_reg[2] <= x_reg[1];  
            x_reg[1] <= x_reg[0];  
            x_reg[0] <= x_in;  
      
            // Shift the previous output samples  
            y_reg[3] <= y_reg[2];  
            y_reg[2] <= y_reg[1];  
            y_reg[1] <= y_reg[0];  
            y_reg[0] <= y_out;  
      
            // Compute current output  
            y_out <= a0 * x_reg[0] + a1 * x_reg[1] + a2 * x_reg[2]  
                   - b1 * y_reg[1] - b2 * y_reg[2] - b3 * y_reg[3];  
        end  
    end  
endmodule