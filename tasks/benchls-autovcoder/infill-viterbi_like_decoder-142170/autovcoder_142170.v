module autovcoder_142170(  
    input clk,  
    input rst,  
    input [1:0] encoded_bits,  
    output reg [1:0] decoded_bits  
);  
    reg [1:0] state;  
    reg [1:0] next_state;  
  
    always @(posedge clk or posedge rst) begin  
        if (rst)  
            state <= 2'b00;  
        else  
            state <= next_state;  
    end  
  
    [MASKED]  
  
    always @(posedge clk) begin  
        decoded_bits <= state;  
    end  
endmodule