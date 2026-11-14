module rtlpp_05043(data_out, empty, full, data_in, push, pop, reset, clk);

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
  
    always @(posedge reset or posedge clk) begin
        if (reset) begin
            data_out = 0;
            empty = 1;
            full = 0;
            wraddr = 0;
            rdaddr = 0;
            num_elems = 0;
        end else begin
            if (push && ~full && ~pop) begin
                reg_file[wraddr] = data_in;
                wraddr = (wraddr + 1) % DEPTH;
                num_elems = num_elems + 1;

                if (empty) empty = 0;
                full = (wraddr == rdaddr && ~empty && num_elems == DEPTH) ? 1 : 0;
            end else if (pop && ~empty && ~push) begin
                data_out = reg_file[rdaddr];
                rdaddr = (rdaddr + 1) % DEPTH;
                num_elems = num_elems - 1;

                if (full) full = 0;
                empty = (wraddr == rdaddr) ? 1 : 0;
            end
        end
    end
  
endmodule