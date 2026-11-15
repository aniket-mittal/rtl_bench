module rtlpp_05121(data_out, empty, full, data_in, push, pop, reset, clk);
    
    parameter DEPTH = 8;            
    parameter WIDTH = 8;
        
    output reg [WIDTH-1:0] data_out;    
    output reg empty;    
    output reg full;
    
    input [WIDTH-1:0] data_in;    
    input push;    
    input pop;    
    input reset;    
    input clk;
    
    reg [DEPTH-1:0] wraddr, rdaddr;
    reg [WIDTH-1:0] reg_file [0:DEPTH-1];
    reg [DEPTH-1:0] num_elems;
    
    // Synchronous reset
    [MASKED]
    
endmodule