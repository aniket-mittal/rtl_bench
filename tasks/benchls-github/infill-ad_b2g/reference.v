module ad_b2g #(

  parameter DATA_WIDTH = 8
) (
  input       [DATA_WIDTH-1:0]    din,
  output      [DATA_WIDTH-1:0]    dout
);

  function [DATA_WIDTH-1:0] b2g;
    input [DATA_WIDTH-1:0] b;
    integer i;
    begin
      b2g[DATA_WIDTH-1] = b[DATA_WIDTH-1];
      for (i = DATA_WIDTH-1; i > 0; i = i -1) begin
        b2g[i-1] = b[i] ^ b[i-1];
      end
    end
  endfunction

  assign dout = b2g(din);

endmodule