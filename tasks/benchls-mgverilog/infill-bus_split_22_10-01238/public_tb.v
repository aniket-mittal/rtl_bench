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

  mg_01238 dut (
    .i(in_vec[31:0]),
    .o1(out_vec[31:10]),
    .o0(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hb35d8c96;
    stim[1] = 32'hcda4eb9c;
    stim[2] = 32'h456f9e01;
    stim[3] = 32'h0cc0851b;
    stim[4] = 32'h5b917b80;
    stim[5] = 32'ha5bbaddb;
    stim[6] = 32'hf00a7380;
    stim[7] = 32'hfacd7236;
    stim[8] = 32'h160c1845;
    stim[9] = 32'hf5a75f1b;
    stim[10] = 32'h84380a58;
    stim[11] = 32'hb5a29d43;
    stim[12] = 32'hda9e6ee8;
    stim[13] = 32'h87b9e277;
    stim[14] = 32'h13adf142;
    stim[15] = 32'hcf316c3a;
    stim[16] = 32'h52f9c8a3;
    stim[17] = 32'hadf1b252;
    stim[18] = 32'heaf3060f;
    stim[19] = 32'hdf38bd2e;
    stim[20] = 32'h8e30a398;
    stim[21] = 32'h54dd86ab;
    stim[22] = 32'h03abfe21;
    stim[23] = 32'h90362dd1;
    stim[24] = 32'h739d5dac;
    stim[25] = 32'h316789d8;
    stim[26] = 32'h273c171f;
    stim[27] = 32'hdeac95c9;
    stim[28] = 32'hb27a4b49;
    stim[29] = 32'h5d9bbbb1;
    stim[30] = 32'h09bb6dfb;
    stim[31] = 32'hc83bbff7;
    stim[32] = 32'h94971568;
    stim[33] = 32'h077c08e5;
    stim[34] = 32'h823ca75c;
    stim[35] = 32'h7247e3f8;
    stim[36] = 32'hcedc098c;
    stim[37] = 32'h161b6816;
    stim[38] = 32'h85b491d7;
    stim[39] = 32'hcf6c1473;
    stim[40] = 32'h4952f151;
    stim[41] = 32'hd8b9ad24;
    stim[42] = 32'h6bb858bd;
    stim[43] = 32'hce1fd8c8;
    stim[44] = 32'h18cce7a9;
    stim[45] = 32'hd5046ca7;
    stim[46] = 32'h1ae19381;
    stim[47] = 32'hab8dc1ec;
    stim[48] = 32'hae451d59;
    stim[49] = 32'h1926163c;
    stim[50] = 32'h00b07ba2;
    stim[51] = 32'h144064f5;
    stim[52] = 32'h70107b5b;
    stim[53] = 32'h48e3a1c2;
    stim[54] = 32'hc042d40f;
    stim[55] = 32'h2232d580;
    stim[56] = 32'h361f6496;
    stim[57] = 32'h2ad18e01;
    stim[58] = 32'hb7598690;
    stim[59] = 32'h56c894da;
    stim[60] = 32'h27730d4e;
    stim[61] = 32'hf65890ef;
    stim[62] = 32'h59137515;
    stim[63] = 32'h66fd8609;
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
      expv[0] = 32'hb35d8c96;
      expv[1] = 32'hcda4eb9c;
      expv[2] = 32'h456f9e01;
      expv[3] = 32'h0cc0851b;
      expv[4] = 32'h5b917b80;
      expv[5] = 32'ha5bbaddb;
      expv[6] = 32'hf00a7380;
      expv[7] = 32'hfacd7236;
      expv[8] = 32'h160c1845;
      expv[9] = 32'hf5a75f1b;
      expv[10] = 32'h84380a58;
      expv[11] = 32'hb5a29d43;
      expv[12] = 32'hda9e6ee8;
      expv[13] = 32'h87b9e277;
      expv[14] = 32'h13adf142;
      expv[15] = 32'hcf316c3a;
      expv[16] = 32'h52f9c8a3;
      expv[17] = 32'hadf1b252;
      expv[18] = 32'heaf3060f;
      expv[19] = 32'hdf38bd2e;
      expv[20] = 32'h8e30a398;
      expv[21] = 32'h54dd86ab;
      expv[22] = 32'h03abfe21;
      expv[23] = 32'h90362dd1;
      expv[24] = 32'h739d5dac;
      expv[25] = 32'h316789d8;
      expv[26] = 32'h273c171f;
      expv[27] = 32'hdeac95c9;
      expv[28] = 32'hb27a4b49;
      expv[29] = 32'h5d9bbbb1;
      expv[30] = 32'h09bb6dfb;
      expv[31] = 32'hc83bbff7;
      expv[32] = 32'h94971568;
      expv[33] = 32'h077c08e5;
      expv[34] = 32'h823ca75c;
      expv[35] = 32'h7247e3f8;
      expv[36] = 32'hcedc098c;
      expv[37] = 32'h161b6816;
      expv[38] = 32'h85b491d7;
      expv[39] = 32'hcf6c1473;
      expv[40] = 32'h4952f151;
      expv[41] = 32'hd8b9ad24;
      expv[42] = 32'h6bb858bd;
      expv[43] = 32'hce1fd8c8;
      expv[44] = 32'h18cce7a9;
      expv[45] = 32'hd5046ca7;
      expv[46] = 32'h1ae19381;
      expv[47] = 32'hab8dc1ec;
      expv[48] = 32'hae451d59;
      expv[49] = 32'h1926163c;
      expv[50] = 32'h00b07ba2;
      expv[51] = 32'h144064f5;
      expv[52] = 32'h70107b5b;
      expv[53] = 32'h48e3a1c2;
      expv[54] = 32'hc042d40f;
      expv[55] = 32'h2232d580;
      expv[56] = 32'h361f6496;
      expv[57] = 32'h2ad18e01;
      expv[58] = 32'hb7598690;
      expv[59] = 32'h56c894da;
      expv[60] = 32'h27730d4e;
      expv[61] = 32'hf65890ef;
      expv[62] = 32'h59137515;
      expv[63] = 32'h66fd8609;
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
