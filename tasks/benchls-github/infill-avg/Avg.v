module Avg#(
    parameter BITWIDTH = 8,
    parameter LENGTH = 4
    )
    (
    input [BITWIDTH * LENGTH - 1 : 0] data,
    output reg signed [BITWIDTH - 1 : 0] result
    );
    
    wire signed [BITWIDTH - 1:0] dataArray[0:LENGTH - 1];
    genvar i;
    generate      
        for(i = 0; i < LENGTH; i = i + 1) begin
            assign dataArray[i] = data[i * BITWIDTH + BITWIDTH - 1: i * BITWIDTH];
        end
    endgenerate
    
    integer j, sum;
    [MASKED]
    
endmodule