module rtlpp_05033(data_out, empty, full, data_in, push, pop, reset, clk);

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
    reg [DEPTH-1:0] wraddr, rdaddr;
    reg [DEPTH-1:0] num_elems;

    initial begin
        data_out = {WIDTH{1'b0}};
        empty = 1'b1;
        full = 1'b0;
        wraddr = {DEPTH{1'b0}};
        rdaddr = {DEPTH{1'b0}};
        num_elems = {DEPTH{1'b0}};
    end

    always @(posedge reset) begin
        data_out = {WIDTH{1'b0}};
        empty = 1'b1;
        full = 1'b0;
        wraddr = {DEPTH{1'b0}};
        rdaddr = {DEPTH{1'b0}};
        num_elems = {DEPTH{1'b0}};
    end

    always @(posedge clk) begin
        if (push && (~full) && (~pop)) begin
            reg_file[wraddr] = data_in;
            wraddr = wraddr + 1;
            num_elems = num_elems + 1;

            if (empty) begin
                empty = 1'b0;
            end

            if ((wraddr == rdaddr) && (~empty) && (num_elems == DEPTH)) begin
                full = 1'b1;
            end else begin
                full = 1'b0;
            end
        end else if (pop && (~empty) && (~push)) begin
            data_out = reg_file[rdaddr];
            rdaddr = rdaddr + 1;
            num_elems = num_elems - 1;

            if (full) begin
                full = 1'b0;
            end

            if (wraddr == rdaddr) begin
                empty = 1'b1;
            end else begin
                empty = 1'b0;
            end
        end
    end

endmodule