// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_057978 dut (
    .LINEA(in_vec[32:17]),
    .LINEB(in_vec[16:1]),
    .ADD(in_vec[0:0]),
    .LINEOUT(out_vec[16:1]),
    .ADDs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1d51204ec;
    stim[1] = 33'h101c2cc8f;
    stim[2] = 33'h178a05bb2;
    stim[3] = 33'h1fd7ced91;
    stim[4] = 33'h1f9b8bb13;
    stim[5] = 33'h007642b30;
    stim[6] = 33'h16cd47cf7;
    stim[7] = 33'h110d04bcf;
    stim[8] = 33'h18fe698b8;
    stim[9] = 33'h07bf87066;
    stim[10] = 33'h04a5c0448;
    stim[11] = 33'h1c73f32da;
    stim[12] = 33'h0eaeb9991;
    stim[13] = 33'h091202f54;
    stim[14] = 33'h0c75de240;
    stim[15] = 33'h14b43d41b;
    stim[16] = 33'h10a439612;
    stim[17] = 33'h1c9c70390;
    stim[18] = 33'h039e4efed;
    stim[19] = 33'h1b16d1a06;
    stim[20] = 33'h10a83ecae;
    stim[21] = 33'h075145d5c;
    stim[22] = 33'h0aeac02b0;
    stim[23] = 33'h070a3441c;
    stim[24] = 33'h0cfe48b0a;
    stim[25] = 33'h0a6164c1c;
    stim[26] = 33'h0a07e36e9;
    stim[27] = 33'h1138dcf28;
    stim[28] = 33'h1e60d10d4;
    stim[29] = 33'h19aa5ea14;
    stim[30] = 33'h106a45772;
    stim[31] = 33'h109b09b23;
    stim[32] = 33'h1b2eccb83;
    stim[33] = 33'h14c7a9c78;
    stim[34] = 33'h0b3348cf7;
    stim[35] = 33'h037b66f86;
    stim[36] = 33'h05a95e9cc;
    stim[37] = 33'h1b3865647;
    stim[38] = 33'h0b946aeb5;
    stim[39] = 33'h18cb7e534;
    stim[40] = 33'h16bc10a2f;
    stim[41] = 33'h0feba8273;
    stim[42] = 33'h0cd37529c;
    stim[43] = 33'h0b30ec9e0;
    stim[44] = 33'h1f5fd1933;
    stim[45] = 33'h0291ce485;
    stim[46] = 33'h185eabb84;
    stim[47] = 33'h1ac58a605;
    stim[48] = 33'h1473b3efa;
    stim[49] = 33'h06fd65cfb;
    stim[50] = 33'h06fde1f05;
    stim[51] = 33'h101092fa5;
    stim[52] = 33'h056166456;
    stim[53] = 33'h0121ccb67;
    stim[54] = 33'h18807e478;
    stim[55] = 33'h007bfdc54;
    stim[56] = 33'h1939b3bbc;
    stim[57] = 33'h09a1dcb23;
    stim[58] = 33'h116c39ca9;
    stim[59] = 33'h15699f3f9;
    stim[60] = 33'h175cd2cba;
    stim[61] = 33'h1c96e8ae4;
    stim[62] = 33'h136cdd893;
    stim[63] = 33'h0555b7548;
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
      expv[0] = 17'h1d026;
      expv[1] = 17'h1ce51;
      expv[2] = 17'h11cee;
      expv[3] = 17'h0eb0d;
      expv[4] = 17'h0b4cb;
      expv[5] = 17'h1dc34;
      expv[6] = 17'h1e9cb;
      expv[7] = 17'h15c9f;
      expv[8] = 17'h0f72e;
      expv[9] = 17'h00b92;
      expv[10] = 17'h04614;
      expv[11] = 17'h09464;
      expv[12] = 17'h0847b;
      expv[13] = 17'h061cc;
      expv[14] = 17'h0e51c;
      expv[15] = 17'h11f5d;
      expv[16] = 17'h17430;
      expv[17] = 17'h0c636;
      expv[18] = 17'h129d1;
      expv[19] = 17'h09766;
      expv[20] = 17'h11dd4;
      expv[21] = 17'h017b8;
      expv[22] = 17'h0abfc;
      expv[23] = 17'h12c86;
      expv[24] = 17'h044da;
      expv[25] = 17'h059fa;
      expv[26] = 17'h0d767;
      expv[27] = 17'h14464;
      expv[28] = 17'h0d538;
      expv[29] = 17'h1b090;
      expv[30] = 17'h0af32;
      expv[31] = 17'h1a4d3;
      expv[32] = 17'h07e6f;
      expv[33] = 17'h0b002;
      expv[34] = 17'h1402b;
      expv[35] = 17'h1c830;
      expv[36] = 17'h070c8;
      expv[37] = 17'h009cd;
      expv[38] = 17'h167fb;
      expv[39] = 17'h1a782;
      expv[40] = 17'h075ef;
      expv[41] = 17'h1812d;
      expv[42] = 17'h17a9a;
      expv[43] = 17'h1e92e;
      expv[44] = 17'h10f2f;
      expv[45] = 17'h10da1;
      expv[46] = 17'h0ca66;
      expv[47] = 17'h0525d;
      expv[48] = 17'h00840;
      expv[49] = 17'h0ccd1;
      expv[50] = 17'h08ee3;
      expv[51] = 17'h030ad;
      expv[52] = 17'h1f1c0;
      expv[53] = 17'h0dd83;
      expv[54] = 17'h1a38e;
      expv[55] = 17'h02b6a;
      expv[56] = 17'h057de;
      expv[57] = 17'h0653f;
      expv[58] = 17'h0b36b;
      expv[59] = 17'h14a91;
      expv[60] = 17'h04912;
      expv[61] = 17'h13e8a;
      expv[62] = 17'h10f5f;
      expv[63] = 17'h0e012;
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
