module autovcoder_009836 (
    input  [7:0] bin_in,
    input        sampling,
    input        clk,
    input        rst,
    output       flag,
    output [9:0] bcd_out
);

  reg [17:0] bcd_out_r;
  reg [17:0] tmp_bcd_out_r;
  reg [ 5:0] counter;


  assign bcd_out = (counter == 5'd15) ? bcd_out_r[17:8] : 'b0;
  assign flag = (counter == 5'd15) ? 1'b1 : 'b0;

  [MASKED]


endmodule

