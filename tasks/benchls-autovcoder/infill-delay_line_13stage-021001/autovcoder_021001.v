module autovcoder_021001 #(
    parameter data_width = 14
) (
    input [data_width-1:0] din,
    input rst,
    clk,
    output wire [data_width-1:0] dout
);

  reg [data_width-1:0] t0, t1, t2, t3, t4, t5, t6;
  reg [data_width-1:0] t7, t8, t9, t10, t11, t12;

  [MASKED]

  assign dout = t12;
endmodule

