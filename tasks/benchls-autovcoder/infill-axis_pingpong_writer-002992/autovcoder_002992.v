module autovcoder_002992 #(
    parameter DATA_WIDTH   = 32,
    parameter STROBE_WIDTH = DATA_WIDTH / 8,
    parameter USE_KEEP     = 0
) (
    input rst,

    //AXI Stream Input
    input                       i_axi_clk,
    output                      o_axi_ready,
    input  [  DATA_WIDTH - 1:0] i_axi_data,
    input  [STROBE_WIDTH - 1:0] i_axi_keep,
    input                       i_axi_last,
    input                       i_axi_valid,

    //Ping Pong FIFO Write Controller
    output                        o_ppfifo_clk,
    input      [             1:0] i_ppfifo_rdy,
    output reg [             1:0] o_ppfifo_act,
    input      [            23:0] i_ppfifo_size,
    output reg                    o_ppfifo_stb,
    output reg [DATA_WIDTH - 1:0] o_ppfifo_data
);
  //local parameters
  localparam IDLE = 0;
  localparam READY = 1;
  localparam RELEASE = 2;
  //registes/wires
  wire        clk;  //Convenience Signal
  reg  [ 3:0] state;
  reg  [23:0] r_count;
  //submodules
  //asynchronous logic

  //This is a little strange to just connect the output clock with the input clock but if this is done
  //Users do not need to figure out how to hook up the clocks
  assign o_ppfifo_clk = i_axi_clk;
  assign clk          = i_axi_clk;
  assign o_axi_ready  = (o_ppfifo_act > 0) && (r_count < i_ppfifo_size);
  //synchronous logic

  [MASKED]

endmodule

