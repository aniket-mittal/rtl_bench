module origen_206361(
    input reset,
    input [31:0] data_A,
    input [31:0] data_B,
    input [31:0] data_D_prime,
    input [9:0] PC_1,
    input [31:0] const_unit,
    input [1:0] MA_MB,
    input [1:0] HA_HB,
    output reg [31:0] bus_A,
    output reg [31:0] bus_B
);

    reg [1:0] mux_A_sel;
    reg [1:0] mux_B_sel;

    [MASKED]

endmodule