module rtlpp_06790(
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

    output [WIDTH-1:0] data_out;
    output empty;
    output full;

    input [WIDTH-1:0] data_in;
    input push;
    input pop;
    input reset;
    input clk;

    reg [WIDTH-1:0] data_out;        
    reg empty, full;                    
    reg [$clog2(DEPTH)-1:0] wraddr, rdaddr; // updated as DEPTH goes to address width log2
    reg [WIDTH-1:0] reg_file [0:DEPTH-1];   // corrected to define as 2D array
    reg [$clog2(DEPTH+1)-1:0] num_elems;     // number of elements in FIFO

    always @(posedge reset) begin
        data_out <= 0;
        empty <= 1;
        full <= 0;
        wraddr <= 0;
        rdaddr <= 0;
        num_elems <= 0;
    end

    always @(posedge clk) begin
        if (push && ~full && ~pop) begin
            reg_file[wraddr] <= data_in;
            wraddr <= (wraddr + 1) % DEPTH;
            num_elems <= num_elems + 1;

            if (num_elems == 0) empty <= 0;
            if (num_elems == DEPTH-1) full <= 1;
        end
        else if (pop && ~empty && ~push) begin
            data_out <= reg_file[rdaddr];
            rdaddr <= (rdaddr + 1) % DEPTH;
            num_elems <= num_elems - 1;

            if (num_elems == DEPTH) full <= 0;
            if (num_elems == 1) empty <= 1;
        end
    end
endmodule