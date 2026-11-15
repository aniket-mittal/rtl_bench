module origen_162416(
    input clk,
    input reset,
    input umbralMF,
    input umbralVC,
    input umbralD,
    input Fifo_empties,
    input Fifo_errors,
    input init,
    output reg init_out,
    output reg idle_out,
    output reg active_out,
    output reg error_out,
    output reg [7:0] umbralMF_out,
    output reg [7:0] umbralVC_out,
    output reg [7:0] umbralD_out,
    output reg [2:0] state,
    output reg [2:0] next_state
);

parameter RESET = 3'b000;
parameter INIT = 3'b001;
parameter IDLE = 3'b010;
parameter ACTIVE = 3'b011;
parameter ERROR = 3'b100;

[MASKED]

endmodule