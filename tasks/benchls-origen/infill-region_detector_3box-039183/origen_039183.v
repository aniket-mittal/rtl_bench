module origen_039183 (
    input wire clk,
    input wire enable,
    input wire [10:0] gr_x,
    input wire [9:0] gr_y,
    output reg out_five,
    output reg out_ten,
    output reg out_f_teen
);

    // Define parameters for rectangular regions
    parameter REGION1_X1 = 56;
    parameter REGION1_Y1 = 149;
    parameter REGION1_X2 = 145;
    parameter REGION1_Y2 = 228;

    parameter REGION2_X1 = 256;
    parameter REGION2_Y1 = 149;
    parameter REGION2_X2 = 345;
    parameter REGION2_Y2 = 228;

    parameter REGION3_X1 = 456;
    parameter REGION3_Y1 = 149;
    parameter REGION3_X2 = 545;
    parameter REGION3_Y2 = 228;

    [MASKED]

endmodule