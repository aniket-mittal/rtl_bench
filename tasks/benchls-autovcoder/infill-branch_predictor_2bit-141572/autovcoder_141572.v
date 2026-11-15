module autovcoder_141572(  
    input clk,  
    input reset,  
    input branch_taken,  
    output reg prediction  
);  
    reg [1:0] state; // 2-bit state representation  

    // State encoding  
    localparam ST_STRONG_TAKEN = 2'b11,  
               ST_WEAK_TAKEN = 2'b10,  
               ST_WEAK_NOT_TAKEN = 2'b01,  
               ST_STRONG_NOT_TAKEN = 2'b00;  

    [MASKED]  
endmodule