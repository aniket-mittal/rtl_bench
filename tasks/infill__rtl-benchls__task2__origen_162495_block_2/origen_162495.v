module origen_162495 #(
    parameter CONF_TYPE = 2'b00,
    parameter CONF_ID = 4'b0001,
    parameter CONF_ID_WIDTH = 4,
    parameter CONF_WIDTH = 8
)(
    input clk,
    input rst,
    input [1:0] conf_in_valid,
    input [CONF_WIDTH-1:0] conf_in_data,
    output reg conf_out_valid,
    output reg [CONF_WIDTH-1:0] conf_out_data,
    output reg conf_reset_out
);

reg [1:0] fsm_conf_rec;
localparam INIT = 2'b00, CLEAR_RESET = 2'b01, SET_VALID = 2'b10;

[MASKED]

endmodule