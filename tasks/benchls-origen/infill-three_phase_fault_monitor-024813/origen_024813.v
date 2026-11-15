module origen_024813 (
    input wire clk,
    input wire reset,
    input wire dir,
    input wire SA_in,
    input wire SB_in,
    input wire SC_in,
    output reg fault
);

    reg [2:0] SA_out, SB_out, SC_out;
    reg [31:0] clk_counter;
    reg clk_reg;
    reg [2:0] fault_counter;
    reg [2:0] default_counter;

    [MASKED]

endmodule