module ad_g2b #(

  parameter DATA_WIDTH = 8
) (
  input       [DATA_WIDTH-1:0]    din,
  output      [DATA_WIDTH-1:0]    dout
);

  function [DATA_WIDTH-1:0] g2b;
    input [DATA_WIDTH-1:0] g;
    integer i;
    begin
      g2b[DATA_WIDTH-1] = g[DATA_WIDTH-1];
      for (i = DATA_WIDTH-1; i > 0; i = i -1) begin
        g2b[i-1] = g2b[i] ^ g[i-1];
      end
    end
  endfunction

  assign dout = g2b(din);

endmodule