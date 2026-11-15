module autovcoder_008153 (
    clk,
    rst,
    ready_sample,
    ce,
    en_comp,
    wr_en,
    rst_dev,
    strobe_writer,
    run,
    state
);

  //state symbols
  parameter IDLE = 4'd0;
  parameter WRITE_FIFO_S = 4'd1;
  parameter STORE_SAMPLE = 4'd2;
  parameter DETECTION = 4'd3;
  parameter WAIT = 4'd4;

  //state register
  output reg [3:0] state;

  //output to data path
  output reg ce;
  output reg rst_dev;
  output reg en_comp;
  output reg wr_en;

  //input to controller
  input clk, rst, strobe_writer, run;
  input ready_sample;

  //local register
  reg rst_counter;

  [MASKED]
endmodule

