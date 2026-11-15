module conditional_data_reverser(
  input [15:0] a,
  input rev,
  output [15:0] z
);

  wire [15:0] rev_out;
  wire [15:0] z_internal;
  
  assign rev_out[0] = a[15];
  assign rev_out[1] = a[14];
  assign rev_out[2] = a[13];
  assign rev_out[3] = a[12];
  assign rev_out[4] = a[11];
  assign rev_out[5] = a[10];
  assign rev_out[6] = a[9];
  assign rev_out[7] = a[8];
  assign rev_out[8] = a[7];
  assign rev_out[9] = a[6];
  assign rev_out[10] = a[5];
  assign rev_out[11] = a[4];
  assign rev_out[12] = a[3];
  assign rev_out[13] = a[2];
  assign rev_out[14] = a[1];
  assign rev_out[15] = a[0];

  assign z_internal = rev ? rev_out : a;
  assign z = z_internal;

endmodule