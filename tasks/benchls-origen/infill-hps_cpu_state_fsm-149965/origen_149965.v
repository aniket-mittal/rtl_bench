`define ST_STOPPED   2'b00
`define ST_STARTING  2'b01
`define ST_STOPPING  2'b10
`define ST_STARTED   2'b11

module origen_149965(
    input clk,
    input hps_cmd,
    input cpu_halt,
    output reg[1:0] state,
    output reg alive
);

    [MASKED]

endmodule