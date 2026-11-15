module autovcoder_117666 (
    clk,
    rst,
    except,
    except_thread,
    new_addr,
    new_thread,
    new_en,
    chk_addr0,
    chk_match0,
    chk_addr1,
    chk_match1,
    free
);

  localparam WIDTH = 11;

  input clk;
  input rst;
  input except;
  input except_thread;
  input [WIDTH-1:0] new_addr;
  input new_thread;
  input new_en;
  input [WIDTH-1:0] chk_addr0;
  output chk_match0;
  input [WIDTH-1:0] chk_addr1;
  output chk_match1;
  output reg free;

  reg [WIDTH-1:0] addr;
  reg thread;

  assign chk_match0 = chk_addr0 == addr && ~free;
  assign chk_match1 = chk_addr1 == addr && ~free;

  [MASKED]


endmodule

