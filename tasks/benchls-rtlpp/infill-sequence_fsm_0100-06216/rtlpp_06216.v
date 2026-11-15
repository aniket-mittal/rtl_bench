module rtlpp_06216(
    input CLK,
    input [3:0] I,
    output reg Y
);

    reg Y1 = 0;
    
    parameter 
    s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b010,
    s3 = 3'b011,
    s4 = 3'b100;
    
    reg [2:0] current_state = s0;
    
    [MASKED]
endmodule