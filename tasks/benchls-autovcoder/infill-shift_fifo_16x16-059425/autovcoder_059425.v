module autovcoder_059425 (
    clk,
    rst_n,
    write_req,
    fifo_write_data,
    read_req,
    fifo_read_data,
    left_sig
);

  input clk;
  input rst_n;

  input write_req;
  input [15:0] fifo_write_data;

  input read_req;
  output [15:0] fifo_read_data;

  output [4:0] left_sig;

  /*********************************************/

  parameter FIFO_DEEP = 5'd16;

  reg [15:0] shift[FIFO_DEEP:0];  //17个

  reg [4:0] count;
  reg [15:0] data_out;

  /*********************************************/

  [MASKED]

  assign fifo_read_data = data_out;
  assign left_sig = FIFO_DEEP - count;


endmodule

