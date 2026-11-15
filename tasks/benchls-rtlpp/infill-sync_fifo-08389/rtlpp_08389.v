module rtlpp_08389(
    data_out,
    empty,
    full,
    data_in,
    push,
    pop,
    reset,
    clk
);
    
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
    
    reg [WIDTH-1:0] reg_file [DEPTH-1:0];
    reg [7:0] wraddr, rdaddr;
    reg [7:0] num_elems;

    [MASKED]
endmodule