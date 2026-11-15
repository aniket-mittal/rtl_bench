module origen_006051 (
    input wire clk,
    input wire data,
    input wire reset,
    input wire load,
    output wire out
);

reg [3:0] tmp;

[MASKED]

assign out = tmp[3];

endmodule

module testbench;
    reg clk, data, reset, load;
    wire out;

    siso_shift_register uut (
        .clk(clk),
        .data(data),
        .reset(reset),
        .load(load),
        .out(out)
    );

    initial begin
        clk = 0;
        data = 0;
        reset = 1;
        load = 0;
        #15 reset = 0;
        
        #10 load = 1;
        #10 data = 1;
        #10 data = 0;
        #10 data = 1;
        #10 data = 1;
        #10 load = 0;
        
        #100 ;
    end

    always #5 clk = ~clk;

    initial begin
        $dumpfile("siso_shift_register.vcd");
        $dumpvars(0, testbench);
    end
endmodule