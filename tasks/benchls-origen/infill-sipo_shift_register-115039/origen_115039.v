// SIPO Module
module origen_115039 (
    input wire clk,
    input wire reset,
    input wire data_in,
    output reg [3:0] data_out
);

[MASKED]

endmodule

// Testbench Module
module sipo_tb;

reg clk;
reg reset;
reg data_in;
wire [3:0] data_out;

// Instantiate the SIPO module
sipo dut (
    .clk(clk),
    .reset(reset),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock generation
always #10 clk = ~clk;

// Testbench stimulus
initial begin
    clk = 0;
    reset = 1;
    data_in = 0;

    // Reset sequence
    #25 reset = 0;

    // Data input sequence
    #20 data_in = 1;
    #20 data_in = 0;
    #20 data_in = 1;
    #20 data_in = 0;

    // End simulation
    #20 ;
end

// Monitor
initial begin
    $monitor("Time=%0t, data_in=%b, data_out=%b", $time, data_in, data_out);
end

endmodule