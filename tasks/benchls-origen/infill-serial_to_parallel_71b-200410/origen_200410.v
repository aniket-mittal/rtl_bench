module origen_200410(
    input clk,
    input reset,
    input deserial_on,
    input serial_data_in,
    output reg [70:0] parallel_data_out
);

    localparam S_IDLE = 2'b00;
    localparam S_WORKING = 2'b01;
    localparam S_HOLDING = 2'b10;

    reg [7:0] count;
    reg [1:0] deserial_state;
    reg [7:0] wait_count;

    [MASKED]

endmodule