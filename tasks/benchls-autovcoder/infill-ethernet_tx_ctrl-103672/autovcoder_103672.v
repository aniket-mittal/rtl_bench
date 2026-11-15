module autovcoder_103672 (
    clk_125,
    rstn,
    rprst,
    enable,
    run,
    ipg_cnt,
    tx_cycles,
    loop,
    tx_empty,
    tx_rdy,
    tx_val,
    tx_end,
    credit_available,
    tx_cr_read,
    tx_d_read,
    done,
    sm

);

  input clk_125;
  input rstn;
  input enable;
  input run;
  input [15:0] ipg_cnt;
  input [15:0] tx_cycles;
  input loop;
  input tx_empty;
  input tx_rdy;
  input tx_val;
  input tx_end;
  input credit_available;

  output rprst;
  output tx_cr_read, tx_d_read;
  output done;
  output [2:0] sm;

  reg rprst;
  reg tx_cr_read, tx_d_read;
  reg [15:0] ipg;
  reg [15:0] cycles;
  reg tx_end_p;

  reg [2:0] sm;
  parameter IDLE = 3'b000, CREDIT = 3'b010, SEND = 3'b011, RESET = 3'b101, DONE = 3'b110;

  assign done = (sm == DONE);

  [MASKED]

endmodule

