// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09016 dut (
    .clk_i(clk),
    .rstn_i(in_vec[98:98]),
    .pwm0_i(in_vec[97:84]),
    .pwm1_i(in_vec[83:70]),
    .sys_addr(in_vec[69:38]),
    .sys_wdata(in_vec[37:6]),
    .sys_sel(in_vec[5:2]),
    .sys_wen(in_vec[1:1]),
    .sys_ren(in_vec[0:0]),
    .dac_a_o(out_vec[129:106]),
    .dac_b_o(out_vec[105:82]),
    .dac_c_o(out_vec[81:58]),
    .dac_d_o(out_vec[57:34]),
    .sys_rdata(out_vec[33:2]),
    .sys_err(out_vec[1:1]),
    .sys_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h4fb4edfe729805a52c14d3a61;
    stim[1] = 99'h7d890765b65620808dc3e017e;
    stim[2] = 99'h2684e1eea1335ca380c77f6ee;
    stim[3] = 99'h39efb866ea851326c7ff82ec2;
    stim[4] = 99'h03e78133389e14a3476da0ae6;
    stim[5] = 99'h3b8cabb1b08c91d5772b20fa7;
    stim[6] = 99'h2e6e63c764f92c9e7875aefd8;
    stim[7] = 99'h08d1929c301140f2924d10d78;
    stim[8] = 99'h1f68d41ad596545d6680ae276;
    stim[9] = 99'h38241f785ee510733205fbb64;
    stim[10] = 99'h39f548c320acaf77232fa0cd4;
    stim[11] = 99'h31bef9decf6334275d00eb1d1;
    stim[12] = 99'h3f2e261d3f7bf8a41fbe5fa84;
    stim[13] = 99'h2247d325dee349b3eaafce411;
    stim[14] = 99'h057f97441bc3a282ebc880929;
    stim[15] = 99'h056f8fe0c70f41eaea3b45fcc;
    stim[16] = 99'h1429b997860411ad3e16b17c5;
    stim[17] = 99'h1aa4f33ee59369d8c9a8cf4d0;
    stim[18] = 99'h014bad40b84fc97405403b42d;
    stim[19] = 99'h1ccdce150dcd3f4f674bb5c3d;
    stim[20] = 99'h05afbe5232ce789a35d58cc60;
    stim[21] = 99'h1e39f1aee1ca1dcac7aca4440;
    stim[22] = 99'h1a8e8f1eb11152ad0fdf85acb;
    stim[23] = 99'h2551209072c0226f2f7a06ecc;
    stim[24] = 99'h0a4dd12496cb08889128a9e0c;
    stim[25] = 99'h2de7b5ead212377d3dcfdabea;
    stim[26] = 99'h0b03c62d1f4b7d8ae890b0839;
    stim[27] = 99'h2fa2d0c52dcf5f8e7f0c6c2b7;
    stim[28] = 99'h077b1c02f406ec29b622da514;
    stim[29] = 99'h3fec9e22e1a43a29fa648d444;
    stim[30] = 99'h37228080c6a4f084b2ef7a642;
    stim[31] = 99'h2a51b55950dd3009a928af235;
    stim[32] = 99'h0276a417e0d3874eb4418e668;
    stim[33] = 99'h218a1c1ed5be16879a3b3fb4e;
    stim[34] = 99'h3022ca2681c5ea6778019a442;
    stim[35] = 99'h0bba88283833ec981dc97964b;
    stim[36] = 99'h1a7011655e1aac0a42fdecc27;
    stim[37] = 99'h072fbcc57652bfaf68e0e7507;
    stim[38] = 99'h1c8d6b82351a85e31e5f99fe9;
    stim[39] = 99'h5e315313d92f19e85e4704492;
    stim[40] = 99'h2a9f2926d87de47fc020bfea6;
    stim[41] = 99'h0d3a25d662ed5ae16145d22c5;
    stim[42] = 99'h2127728d0ed4e88182ef37024;
    stim[43] = 99'h2f2e65754406c37cb396ada74;
    stim[44] = 99'h2e8dffdb78635db89ce7b196b;
    stim[45] = 99'h4d791dbda12b2c7c665582ad7;
    stim[46] = 99'h30e1c566f4017d1935192679f;
    stim[47] = 99'h2bac7ffa48110590e8f4f03a8;
    stim[48] = 99'h2ecde2b5ab619d6d45aafd183;
    stim[49] = 99'h0b09cadf717c35a3c9f0dc185;
    stim[50] = 99'h3cde53d6e2e5a01e0a3bd49ea;
    stim[51] = 99'h19d8d78043f74ad93401a5312;
    stim[52] = 99'h14147b3ed64afc143ecea0426;
    stim[53] = 99'h06d274375d894516514f6dd8d;
    stim[54] = 99'h27fc9a5c174e36263a0cadfa9;
    stim[55] = 99'h1d01375b96adffa02b44248d8;
    stim[56] = 99'h20079ca8aa7e2e78afabc9daf;
    stim[57] = 99'h0710c80e2537abace3e7a8534;
    stim[58] = 99'h337e177d111389256d516caa6;
    stim[59] = 99'h215394a8b3b20bae7047b2053;
    stim[60] = 99'h0fd0117872d2f0777166e67f5;
    stim[61] = 99'h2e2d38052e35f1b7f1e7ee1e4;
    stim[62] = 99'h0ec5c813ce36c38a8a5de96e8;
    stim[63] = 99'h0b34711d10869e1c852ef865d;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 130'hxxxxxxxxxxxxxxxxxxxxxxxxx00000001;
      expv[2] = 130'h2f9dfddb5fffxxxxxxxxxxxxx00000001;
      expv[3] = 130'h000000000000000000000000000000000;
      expv[4] = 130'h000000000000000000000000000000000;
      expv[5] = 130'h000000000000000000000000000000000;
      expv[6] = 130'h000000000000000000000000000000000;
      expv[7] = 130'h000000000000000000000000000000000;
      expv[8] = 130'h000000000000000000000000000000000;
      expv[9] = 130'h000000000000000000000000000000000;
      expv[10] = 130'h000000000000000000000000000000000;
      expv[11] = 130'h000000000000000000000000000000000;
      expv[12] = 130'h000000000000000000000000000000000;
      expv[13] = 130'h000000000000000000000000000000000;
      expv[14] = 130'h000000000000000000000000000000000;
      expv[15] = 130'h000000000000000000000000000000000;
      expv[16] = 130'h000000000000000000000000000000000;
      expv[17] = 130'h000000000000000000000000000000000;
      expv[18] = 130'h000000000000000000000000000000000;
      expv[19] = 130'h000000000000000000000000000000000;
      expv[20] = 130'h000000000000000000000000000000000;
      expv[21] = 130'h000000000000000000000000000000000;
      expv[22] = 130'h000000000000000000000000000000000;
      expv[23] = 130'h000000000000000000000000000000000;
      expv[24] = 130'h000000000000000000000000000000000;
      expv[25] = 130'h000000000000000000000000000000000;
      expv[26] = 130'h000000000000000000000000000000000;
      expv[27] = 130'h000000000000000000000000000000000;
      expv[28] = 130'h000000000000000000000000000000000;
      expv[29] = 130'h000000000000000000000000000000000;
      expv[30] = 130'h000000000000000000000000000000000;
      expv[31] = 130'h000000000000000000000000000000000;
      expv[32] = 130'h000000000000000000000000000000000;
      expv[33] = 130'h000000000000000000000000000000000;
      expv[34] = 130'h000000000000000000000000000000000;
      expv[35] = 130'h000000000000000000000000000000000;
      expv[36] = 130'h000000000000000000000000000000000;
      expv[37] = 130'h000000000000000000000000000000000;
      expv[38] = 130'h000000000000000000000000000000000;
      expv[39] = 130'h000000000000000000000000000000000;
      expv[40] = 130'h000000000000000000000000000000001;
      expv[41] = 130'h000000000000000000000000000000000;
      expv[42] = 130'h000000000000000000000000000000000;
      expv[43] = 130'h000000000000000000000000000000000;
      expv[44] = 130'h000000000000000000000000000000000;
      expv[45] = 130'h000000000000000000000000000000000;
      expv[46] = 130'h000000000000000000000000000000001;
      expv[47] = 130'h000000000000000000000000000000000;
      expv[48] = 130'h000000000000000000000000000000000;
      expv[49] = 130'h000000000000000000000000000000000;
      expv[50] = 130'h000000000000000000000000000000000;
      expv[51] = 130'h000000000000000000000000000000000;
      expv[52] = 130'h000000000000000000000000000000000;
      expv[53] = 130'h000000000000000000000000000000000;
      expv[54] = 130'h000000000000000000000000000000000;
      expv[55] = 130'h000000000000000000000000000000000;
      expv[56] = 130'h000000000000000000000000000000000;
      expv[57] = 130'h000000000000000000000000000000000;
      expv[58] = 130'h000000000000000000000000000000000;
      expv[59] = 130'h000000000000000000000000000000000;
      expv[60] = 130'h000000000000000000000000000000000;
      expv[61] = 130'h000000000000000000000000000000000;
      expv[62] = 130'h000000000000000000000000000000000;
      expv[63] = 130'h000000000000000000000000000000000;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
