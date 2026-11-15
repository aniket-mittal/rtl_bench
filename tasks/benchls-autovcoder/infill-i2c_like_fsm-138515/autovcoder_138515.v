module autovcoder_138515 (  
    input clk,  
    input rst,  
    input start,  
    input write,  
    input [7:0] data_in,  
    output reg busy,  
    output reg [7:0] data_out,  
    output reg ack  
);  
    reg [2:0] state;  
    parameter IDLE = 3'b000,  
              START = 3'b001,  
              WRITE = 3'b010,  
              READ = 3'b011,  
              STOP = 3'b100;  
              
    [MASKED]  
endmodule