module rtlpp_00767(data_out, empty, full, data_in, push, pop, reset, clk);

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

    always @(posedge reset)
    begin
        data_out <= 8'd0;
        empty <= 1'b1;
        full <= 1'b0;
        wraddr <= 8'd0;
        rdaddr <= 8'd0;
        num_elems <= 8'd0;
    end

    [MASKED]

endmodule