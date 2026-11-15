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

  always @(posedge clk) begin
    if (rst) begin
      thread <= 1'b0;
      addr   <= {WIDTH{1'B0}};
      free   <= 1'b1;
    end else begin
      if (new_en) begin
        thread <= new_thread;
        addr   <= new_addr;
        free   <= 1'b0;
      end
      if (except && except_thread == thread) free <= 1'b1;
    end
  end


endmodule

