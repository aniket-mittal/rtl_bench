`timescale 1ns / 1ps

module origen_138544(input[1:0] rot, output reg[0:15] block);

wire[0:15] j0 = 16'b0100010011000000;
wire[0:15] j1 = 16'b1000111000000000;
wire[0:15] j2 = 16'b0110010001000000;
wire[0:15] j3 = 16'b0000111000100000;

[MASKED]

endmodule

module J_sel_tb;

reg [1:0] rot;
wire [0:15] block;

// Instantiate the Unit Under Test (UUT)
J_sel uut (
    .rot(rot),
    .block(block)
);

initial begin
    // Initialize Inputs
    rot = 0;

    // Wait 100 ns for global reset to finish
    #100;

    // Test for rot = 0
    rot = 2'b00;
    #10;
    $display("rot = %b, block = %b", rot, block);

    // Test for rot = 1
    rot = 2'b01;
    #10;
    $display("rot = %b, block = %b", rot, block);

    // Test for rot = 2
    rot = 2'b10;
    #10;
    $display("rot = %b, block = %b", rot, block);

    // Test for rot = 3
    rot = 2'b11;
    #10;
    $display("rot = %b, block = %b", rot, block);

    ;
end

endmodule