// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01002 dut (
    .clk(clk),
    .a(in_vec[23:16]),
    .b(in_vec[15:8]),
    .c(in_vec[7:0]),
    .max(out_vec[23:16]),
    .mid(out_vec[15:8]),
    .min(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h03844a;
    stim[1] = 24'hd51d9d;
    stim[2] = 24'h6c03a1;
    stim[3] = 24'h15c20b;
    stim[4] = 24'h8806d4;
    stim[5] = 24'h86dca1;
    stim[6] = 24'hca84b3;
    stim[7] = 24'h9243ce;
    stim[8] = 24'hc004e1;
    stim[9] = 24'hdbafd5;
    stim[10] = 24'h82743e;
    stim[11] = 24'h52afb3;
    stim[12] = 24'h5167b1;
    stim[13] = 24'hd647ba;
    stim[14] = 24'hf1330f;
    stim[15] = 24'he07ed9;
    stim[16] = 24'h220bbf;
    stim[17] = 24'h3e2e08;
    stim[18] = 24'h9a287b;
    stim[19] = 24'ha7d305;
    stim[20] = 24'h22da51;
    stim[21] = 24'he1e5b9;
    stim[22] = 24'hc25ddd;
    stim[23] = 24'h3912f7;
    stim[24] = 24'h6aaac2;
    stim[25] = 24'h6a5507;
    stim[26] = 24'hb5589f;
    stim[27] = 24'hafdf82;
    stim[28] = 24'he55314;
    stim[29] = 24'h26e92b;
    stim[30] = 24'hd1c538;
    stim[31] = 24'h48cb7f;
    stim[32] = 24'he591ca;
    stim[33] = 24'h950417;
    stim[34] = 24'hb29878;
    stim[35] = 24'h0de2f6;
    stim[36] = 24'h3d197c;
    stim[37] = 24'h9b1616;
    stim[38] = 24'hce3d13;
    stim[39] = 24'hfc1c05;
    stim[40] = 24'hfb30b3;
    stim[41] = 24'hefe3cd;
    stim[42] = 24'h3dfe05;
    stim[43] = 24'h1be361;
    stim[44] = 24'hc31f37;
    stim[45] = 24'h0f0973;
    stim[46] = 24'h29a611;
    stim[47] = 24'he4ce4a;
    stim[48] = 24'heffd94;
    stim[49] = 24'h5da7ab;
    stim[50] = 24'hfd8381;
    stim[51] = 24'h36d69f;
    stim[52] = 24'hbc2049;
    stim[53] = 24'h81b9eb;
    stim[54] = 24'he44d5b;
    stim[55] = 24'h54ed88;
    stim[56] = 24'hd9b3dd;
    stim[57] = 24'h9219fd;
    stim[58] = 24'h951b72;
    stim[59] = 24'ha23510;
    stim[60] = 24'h823831;
    stim[61] = 24'hc1ed5f;
    stim[62] = 24'h8ea263;
    stim[63] = 24'he3015d;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'h844a03;
      expv[2] = 24'hd59d1d;
      expv[3] = 24'ha16c03;
      expv[4] = 24'hc2150b;
      expv[5] = 24'hd48806;
      expv[6] = 24'hdca186;
      expv[7] = 24'hcab384;
      expv[8] = 24'hce9243;
      expv[9] = 24'he1c004;
      expv[10] = 24'hdbd5af;
      expv[11] = 24'h82743e;
      expv[12] = 24'hb3af52;
      expv[13] = 24'hb16751;
      expv[14] = 24'hd6ba47;
      expv[15] = 24'hf1330f;
      expv[16] = 24'he0d97e;
      expv[17] = 24'hbf220b;
      expv[18] = 24'h3e2e08;
      expv[19] = 24'h9a7b28;
      expv[20] = 24'hd3a705;
      expv[21] = 24'hda5122;
      expv[22] = 24'he5e1b9;
      expv[23] = 24'hddc25d;
      expv[24] = 24'hf73912;
      expv[25] = 24'hc2aa6a;
      expv[26] = 24'h6a5507;
      expv[27] = 24'hb59f58;
      expv[28] = 24'hdfaf82;
      expv[29] = 24'he55314;
      expv[30] = 24'he92b26;
      expv[31] = 24'hd1c538;
      expv[32] = 24'hcb7f48;
      expv[33] = 24'he5ca91;
      expv[34] = 24'h951704;
      expv[35] = 24'hb29878;
      expv[36] = 24'hf6e20d;
      expv[37] = 24'h7c3d19;
      expv[38] = 24'h9b1616;
      expv[39] = 24'hce3d13;
      expv[40] = 24'hfc1c05;
      expv[41] = 24'hfbb330;
      expv[42] = 24'hefe3cd;
      expv[43] = 24'hfe3d05;
      expv[44] = 24'he3611b;
      expv[45] = 24'hc3371f;
      expv[46] = 24'h730f09;
      expv[47] = 24'ha62911;
      expv[48] = 24'he4ce4a;
      expv[49] = 24'hfdef94;
      expv[50] = 24'haba75d;
      expv[51] = 24'hfd8381;
      expv[52] = 24'hd69f36;
      expv[53] = 24'hbc4920;
      expv[54] = 24'hebb981;
      expv[55] = 24'he45b4d;
      expv[56] = 24'hed8854;
      expv[57] = 24'hddd9b3;
      expv[58] = 24'hfd9219;
      expv[59] = 24'h95721b;
      expv[60] = 24'ha23510;
      expv[61] = 24'h823831;
      expv[62] = 24'hedc15f;
      expv[63] = 24'ha28e63;
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
