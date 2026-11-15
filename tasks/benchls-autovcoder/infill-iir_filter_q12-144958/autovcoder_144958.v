module autovcoder_144958 (  
    input clk,  
    input reset,  
    input signed [15:0] x_in,  
    output reg signed [15:0] y_out  
);  
    // Coefficients for the IIR filter  
    parameter signed [15:0] b0 = 16'h0A00;  
    parameter signed [15:0] b1 = 16'h1C00;  
    parameter signed [15:0] b2 = 16'h0A00;  
    parameter signed [15:0] b3 = 16'h0200;  
    parameter signed [15:0] b4 = 16'h0100;  
    parameter signed [15:0] a1 = 16'hF000;  
    parameter signed [15:0] a2 = 16'hD000;  
    parameter signed [15:0] a3 = 16'h0A00;  
    parameter signed [15:0] a4 = 16'h0050;  

    reg signed [15:0] x [0:4];  
    reg signed [15:0] y [0:4];  

    [MASKED]  
endmodule