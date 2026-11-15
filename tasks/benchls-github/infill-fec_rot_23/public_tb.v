// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fec_rot_23 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h26119846;
    stim[1] = 32'h6797dedf;
    stim[2] = 32'h5c7565ef;
    stim[3] = 32'hb52bd1a8;
    stim[4] = 32'h42a79a5a;
    stim[5] = 32'h1a283736;
    stim[6] = 32'h1627da1e;
    stim[7] = 32'h8a80bcf5;
    stim[8] = 32'hb7280fb5;
    stim[9] = 32'hc9bf14b6;
    stim[10] = 32'h0cf6d084;
    stim[11] = 32'h758f7b46;
    stim[12] = 32'h5a12ffb3;
    stim[13] = 32'heb3997b6;
    stim[14] = 32'h6cd85546;
    stim[15] = 32'h7b6a1266;
    stim[16] = 32'h4535100d;
    stim[17] = 32'h69b03db1;
    stim[18] = 32'hf660d9b0;
    stim[19] = 32'h168d308b;
    stim[20] = 32'h59cbe8e2;
    stim[21] = 32'hb4eaf098;
    stim[22] = 32'h3570dac1;
    stim[23] = 32'h4ec9cb5a;
    stim[24] = 32'h68bd0559;
    stim[25] = 32'hc84b9ab6;
    stim[26] = 32'h6d6203f8;
    stim[27] = 32'h578288cf;
    stim[28] = 32'ha57f4b27;
    stim[29] = 32'h0ff39826;
    stim[30] = 32'hc40932a6;
    stim[31] = 32'h15d8b981;
    stim[32] = 32'h48c5a5b5;
    stim[33] = 32'hb9d0f2d4;
    stim[34] = 32'hff4b408b;
    stim[35] = 32'hbeef4c86;
    stim[36] = 32'h5c82d3e5;
    stim[37] = 32'hf2fde675;
    stim[38] = 32'h030d2cfe;
    stim[39] = 32'h762fd249;
    stim[40] = 32'h12cbd075;
    stim[41] = 32'hd604a150;
    stim[42] = 32'hdd9b9481;
    stim[43] = 32'h4d98e06d;
    stim[44] = 32'hb83f194b;
    stim[45] = 32'h3de3befb;
    stim[46] = 32'h1fd85838;
    stim[47] = 32'h22bbea9f;
    stim[48] = 32'hb39928d0;
    stim[49] = 32'h6b935ea1;
    stim[50] = 32'h1602abe5;
    stim[51] = 32'h8f5637ee;
    stim[52] = 32'h347f5154;
    stim[53] = 32'hbe8ceb7f;
    stim[54] = 32'hef08d326;
    stim[55] = 32'hdf9f10d1;
    stim[56] = 32'h60ca427e;
    stim[57] = 32'hcf1d21d2;
    stim[58] = 32'haa1ca9b5;
    stim[59] = 32'h4e0c60af;
    stim[60] = 32'h679d0f02;
    stim[61] = 32'hf0196101;
    stim[62] = 32'hf1b50c2f;
    stim[63] = 32'h040baec5;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h48666799;
      expv[1] = 32'h411f7586;
      expv[2] = 32'hbb1599ea;
      expv[3] = 32'h8e8f5471;
      expv[4] = 32'h6cfe625b;
      expv[5] = 32'h0da0dff0;
      expv[6] = 32'h351f6b14;
      expv[7] = 32'h3a02e354;
      expv[8] = 32'h06602802;
      expv[9] = 32'he3dc4cf1;
      expv[10] = 32'h2f3b42f7;
      expv[11] = 32'h009de3ad;
      expv[12] = 32'hd3cbf310;
      expv[13] = 32'h3646420d;
      expv[14] = 32'hc5415ea9;
      expv[15] = 32'h664845c7;
      expv[16] = 32'h2e3449e3;
      expv[17] = 32'h9060ff71;
      expv[18] = 32'h174378b6;
      expv[19] = 32'h7d14c315;
      expv[20] = 32'hdc2fae50;
      expv[21] = 32'h700bd77d;
      expv[22] = 32'h49436fe0;
      expv[23] = 32'h39c7257f;
      expv[24] = 32'h5e341a82;
      expv[25] = 32'hb22e7640;
      expv[26] = 32'h9868068f;
      expv[27] = 32'he8ea2e8b;
      expv[28] = 32'hcc3d3e52;
      expv[29] = 32'h120e61f6;
      expv[30] = 32'h9b84d6c5;
      expv[31] = 32'ha3c2e1a1;
      expv[32] = 32'h46f69dfb;
      expv[33] = 32'hffc3db94;
      expv[34] = 32'hc64d1bf7;
      expv[35] = 32'h37dd247b;
      expv[36] = 32'h346b45a7;
      expv[37] = 32'he1178083;
      expv[38] = 32'h8d14b7f1;
      expv[39] = 32'hda5f4133;
      expv[40] = 32'h452f41a4;
      expv[41] = 32'hf1b2980d;
      expv[42] = 32'h6d6e4adc;
      expv[43] = 32'h9b838cdb;
      expv[44] = 32'h0dfc7244;
      expv[45] = 32'h9acef886;
      expv[46] = 32'h35e162b4;
      expv[47] = 32'h91efaaa4;
      expv[48] = 32'h62a4b626;
      expv[49] = 32'hbe0d7206;
      expv[50] = 32'hc7eaab6b;
      expv[51] = 32'hdbf8c88d;
      expv[52] = 32'hbe3d462e;
      expv[53] = 32'h15f3ba82;
      expv[54] = 32'ha5a35454;
      expv[55] = 32'h609c5bb3;
      expv[56] = 32'h5769075a;
      expv[57] = 32'h3c549f49;
      expv[58] = 32'h8c72b7f4;
      expv[59] = 32'he9518c37;
      expv[60] = 32'hb7f43544;
      expv[61] = 32'h60059907;
      expv[62] = 32'h1ad42e5c;
      expv[63] = 32'haa8ebec1;
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
