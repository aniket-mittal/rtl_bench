module rtlpp_06203(data_out, empty, full, data_in, push, pop, reset, clk);

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
    reg [DEPTH-1:0] wraddr, rdaddr;
    reg [WIDTH-1:0] reg_file [DEPTH-1:0];  // Corrected the dimensions to [0:DEPTH-1] for number of registers and [0:WIDTH-1] for width of each register
    reg [DEPTH-1:0] num_elems;
    
    always @(posedge reset)
    begin
        data_out = 8'd0;
        empty = 1'd1;  // FIFO should be empty on reset
        full = 1'd0;
        wraddr = 8'd0;
        rdaddr = 8'd0;
        num_elems = 8'd0;
    end
    
    always @(posedge clk)
    begin
        if (push && (~full) && (~pop)) 
        begin
            reg_file[wraddr] = data_in;
            wraddr = wraddr + 1;
            num_elems = num_elems + 1;
            
            if (empty == 1'd1)
                empty = 1'd0;
                
            if (num_elems + 1 == DEPTH)
                full = 1'd1;
            else
                full = 1'd0;
        end
        else if (pop && (~empty) && (~push)) 
        begin
            data_out = reg_file[rdaddr];
            rdaddr = rdaddr + 1;
            num_elems = num_elems - 1;
            
            if (full == 1'd1)
                full = 1'd0;
                
            if (num_elems == 0)
                empty = 1'd1;
            else
                empty = 1'd0;
        end
    end
    
endmodule