// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_222985 dut (
    .D(in_vec[23:8]),
    .S(in_vec[7:4]),
    .VPWR(in_vec[3:3]),
    .VGND(in_vec[2:2]),
    .VPB(in_vec[1:1]),
    .VNB(in_vec[0:0]),
    .Z(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hdbf6eb;
    stim[1] = 24'hbaae6d;
    stim[2] = 24'h3cee71;
    stim[3] = 24'h023ac0;
    stim[4] = 24'h4f8a02;
    stim[5] = 24'h39693f;
    stim[6] = 24'h5ef959;
    stim[7] = 24'h6cbd6e;
    stim[8] = 24'h3fd42a;
    stim[9] = 24'ha22445;
    stim[10] = 24'h0b6eeb;
    stim[11] = 24'h243a74;
    stim[12] = 24'hc15933;
    stim[13] = 24'h9cb5f9;
    stim[14] = 24'h1965e4;
    stim[15] = 24'h14addc;
    stim[16] = 24'h8d6b04;
    stim[17] = 24'h66c251;
    stim[18] = 24'hf45136;
    stim[19] = 24'h05c5bf;
    stim[20] = 24'h62a3b6;
    stim[21] = 24'hb1f236;
    stim[22] = 24'h87d3ea;
    stim[23] = 24'h811112;
    stim[24] = 24'h7f4722;
    stim[25] = 24'h17d147;
    stim[26] = 24'hbb93e3;
    stim[27] = 24'h71d65d;
    stim[28] = 24'h988e2b;
    stim[29] = 24'h479b85;
    stim[30] = 24'hdb0e0f;
    stim[31] = 24'h4ea6b1;
    stim[32] = 24'h04fceb;
    stim[33] = 24'hb5386d;
    stim[34] = 24'h7354ee;
    stim[35] = 24'h6d5d89;
    stim[36] = 24'h8b53c0;
    stim[37] = 24'hac318a;
    stim[38] = 24'h17eaa1;
    stim[39] = 24'h517f33;
    stim[40] = 24'hf7f839;
    stim[41] = 24'hf3078f;
    stim[42] = 24'hbfb0a9;
    stim[43] = 24'h884dcc;
    stim[44] = 24'h92855a;
    stim[45] = 24'hbcc4b5;
    stim[46] = 24'h7b1b7b;
    stim[47] = 24'hf30320;
    stim[48] = 24'hd2e6f6;
    stim[49] = 24'hd3e173;
    stim[50] = 24'hdc2948;
    stim[51] = 24'h76a849;
    stim[52] = 24'hf3f5b1;
    stim[53] = 24'h79bd90;
    stim[54] = 24'h71b6de;
    stim[55] = 24'h2791d3;
    stim[56] = 24'h54d8e9;
    stim[57] = 24'h3b22fc;
    stim[58] = 24'h6514b8;
    stim[59] = 24'h4258b9;
    stim[60] = 24'hae31e4;
    stim[61] = 24'h6fa41c;
    stim[62] = 24'h1eaa6d;
    stim[63] = 24'hf1cee3;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
