module autovcoder_125943 (  
    input clk,  
    input rst,  
    input [31:0] in_a,  
    input [31:0] in_b,  
    input [31:0] in_c,  
    input [31:0] in_d,  
    output reg [31:0] out_a,  
    output reg [31:0] out_b,  
    output reg [31:0] out_c,  
    output reg [31:0] out_d  
);  

    reg [31:0] a, b, c, d;  
    wire [31:0] rot_d, rot_b;  

    assign rot_d = {d[15:0], d[31:16]};  
    assign rot_b = {b[19:0], b[31:20]};  

    [MASKED]  
endmodule