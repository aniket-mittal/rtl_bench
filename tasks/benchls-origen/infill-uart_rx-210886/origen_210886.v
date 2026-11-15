module origen_210886 (
    input  wire        clk,
    input  wire        rst,
    input  wire        rx_in,
    output reg  [7:0]  data_out,
    output reg         data_avail,
    output reg [15:0]  end_counter,
    output reg         data_error
);

reg [15:0] wait_counter;
reg        running;

[MASKED]

endmodule