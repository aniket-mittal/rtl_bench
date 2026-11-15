module rtlpp_00791(
    input wire clk,
    input wire reset,
    input wire [1:0] select,
    input wire [3:0] in0,
    input wire [3:0] in1,
    input wire [3:0] in2,
    input wire [3:0] in3,
    input wire in0_valid,
    input wire in1_valid,
    input wire in2_valid,
    input wire in3_valid,
    output reg [3:0] out_b,
    output reg out_valid_b
);

    reg [3:0] out_1_mux, out_2_mux;
    reg valid_1_mux, valid_2_mux;

    [MASKED]
    
endmodule