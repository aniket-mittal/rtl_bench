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

    always @(posedge reset or posedge clk) begin
        if (reset) begin
            data_out <= 8'd0;
            empty <= 1'd1;
            full <= 1'd0;
            wraddr <= 8'd0;
            rdaddr <= 8'd0;
            num_elems <= 8'd0;
        end else begin
            if(push && (~full) && (~pop)) begin
                reg_file[wraddr] <= data_in;
                wraddr <= (wraddr + 1) % DEPTH;
                num_elems <= num_elems + 1;
                
                empty <= 1'd0;
                
                if((wraddr == rdaddr) && (~empty) && (num_elems == DEPTH)) begin
                    full <= 1'd1;
                end else begin
                    full <= 1'd0;
                end
            end else if(pop && (~empty) && (~push)) begin
                data_out <= reg_file[rdaddr];
                rdaddr <= (rdaddr + 1) % DEPTH;
                num_elems <= num_elems - 1;
                
                full <= 1'd0;
                
                if (wraddr == rdaddr) begin
                    empty <= 1'd1;
                end else begin
                    empty <= 1'd0;
                end
            end
        end
    end
endmodule