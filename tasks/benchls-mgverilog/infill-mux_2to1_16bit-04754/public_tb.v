// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04754 dut (
    .in_data_0(in_vec[32:17]),
    .in_data_1(in_vec[16:1]),
    .in_sel(in_vec[0:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1db7386f6;
    stim[1] = 33'h147ddf1f5;
    stim[2] = 33'h1ae27e26d;
    stim[3] = 33'h097c0f887;
    stim[4] = 33'h0ddb716c5;
    stim[5] = 33'h09efa44ec;
    stim[6] = 33'h03fe9c951;
    stim[7] = 33'h1f4c661ee;
    stim[8] = 33'h0dc94f5e3;
    stim[9] = 33'h0eeedfd2e;
    stim[10] = 33'h0de7db95e;
    stim[11] = 33'h11faa41b3;
    stim[12] = 33'h11f9b303f;
    stim[13] = 33'h03731d249;
    stim[14] = 33'h0bb81bb89;
    stim[15] = 33'h1e062fcc4;
    stim[16] = 33'h1558925b1;
    stim[17] = 33'h1b37e888e;
    stim[18] = 33'h08b15e9d4;
    stim[19] = 33'h1c54a94fe;
    stim[20] = 33'h19e309533;
    stim[21] = 33'h034699048;
    stim[22] = 33'h03172e645;
    stim[23] = 33'h0082f0af3;
    stim[24] = 33'h15f7bf0d3;
    stim[25] = 33'h15bd1b52f;
    stim[26] = 33'h0b2b13f2c;
    stim[27] = 33'h1e6019bfd;
    stim[28] = 33'h1c9225139;
    stim[29] = 33'h1bf194193;
    stim[30] = 33'h1cd2c53af;
    stim[31] = 33'h18ecd054c;
    stim[32] = 33'h07cb484bd;
    stim[33] = 33'h08e12fb8f;
    stim[34] = 33'h1a5718131;
    stim[35] = 33'h0689606d0;
    stim[36] = 33'h0d595bbff;
    stim[37] = 33'h094e79b16;
    stim[38] = 33'h113475770;
    stim[39] = 33'h0f7c69eea;
    stim[40] = 33'h02eed12d6;
    stim[41] = 33'h01b8ed802;
    stim[42] = 33'h15bf8f099;
    stim[43] = 33'h15b1b5df5;
    stim[44] = 33'h034aafd5b;
    stim[45] = 33'h1000746b9;
    stim[46] = 33'h059676ed9;
    stim[47] = 33'h0b9b03fb6;
    stim[48] = 33'h05a9b2dd2;
    stim[49] = 33'h090219bae;
    stim[50] = 33'h08cf0e3fb;
    stim[51] = 33'h11312b11e;
    stim[52] = 33'h073df53f2;
    stim[53] = 33'h08319fa83;
    stim[54] = 33'h19e823195;
    stim[55] = 33'h1983329d7;
    stim[56] = 33'h0a5f69db8;
    stim[57] = 33'h18715c8bd;
    stim[58] = 33'h0fec56d56;
    stim[59] = 33'h1a5389ee6;
    stim[60] = 33'h0a0705266;
    stim[61] = 33'h0b088652f;
    stim[62] = 33'h1375a0bbf;
    stim[63] = 33'h146f81e48;
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
      expv[0] = 16'hedb9;
      expv[1] = 16'hf8fa;
      expv[2] = 16'hf136;
      expv[3] = 16'h7c43;
      expv[4] = 16'h8b62;
      expv[5] = 16'h4f7d;
      expv[6] = 16'he4a8;
      expv[7] = 16'hfa63;
      expv[8] = 16'h7af1;
      expv[9] = 16'h7776;
      expv[10] = 16'h6f3e;
      expv[11] = 16'h20d9;
      expv[12] = 16'h981f;
      expv[13] = 16'he924;
      expv[14] = 16'hddc4;
      expv[15] = 16'hf031;
      expv[16] = 16'h92d8;
      expv[17] = 16'hd9bf;
      expv[18] = 16'h458a;
      expv[19] = 16'he2a5;
      expv[20] = 16'h4a99;
      expv[21] = 16'h1a34;
      expv[22] = 16'h7322;
      expv[23] = 16'h8579;
      expv[24] = 16'hf869;
      expv[25] = 16'hda97;
      expv[26] = 16'h5958;
      expv[27] = 16'hcdfe;
      expv[28] = 16'h289c;
      expv[29] = 16'ha0c9;
      expv[30] = 16'h29d7;
      expv[31] = 16'hc766;
      expv[32] = 16'h425e;
      expv[33] = 16'h7dc7;
      expv[34] = 16'hc098;
      expv[35] = 16'h344b;
      expv[36] = 16'hddff;
      expv[37] = 16'h4a73;
      expv[38] = 16'h89a3;
      expv[39] = 16'h7be3;
      expv[40] = 16'h1776;
      expv[41] = 16'h0dc7;
      expv[42] = 16'h784c;
      expv[43] = 16'haefa;
      expv[44] = 16'h7ead;
      expv[45] = 16'ha35c;
      expv[46] = 16'hb76c;
      expv[47] = 16'h5cd8;
      expv[48] = 16'h2d4d;
      expv[49] = 16'h4810;
      expv[50] = 16'h71fd;
      expv[51] = 16'h8989;
      expv[52] = 16'h39ef;
      expv[53] = 16'hfd41;
      expv[54] = 16'h18ca;
      expv[55] = 16'h94eb;
      expv[56] = 16'h52fb;
      expv[57] = 16'he45e;
      expv[58] = 16'h7f62;
      expv[59] = 16'hd29c;
      expv[60] = 16'h5038;
      expv[61] = 16'h3297;
      expv[62] = 16'h05df;
      expv[63] = 16'ha37c;
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
