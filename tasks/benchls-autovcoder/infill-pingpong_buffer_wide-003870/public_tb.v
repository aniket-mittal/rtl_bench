// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_003870 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h6670b951a;
    stim[1] = 35'h58a74fbae;
    stim[2] = 35'h0fddffaf9;
    stim[3] = 35'h073326eb5;
    stim[4] = 35'h370ddf0be;
    stim[5] = 35'h0751b3870;
    stim[6] = 35'h2a7008f10;
    stim[7] = 35'h2d1f19c91;
    stim[8] = 35'h0e96d3601;
    stim[9] = 35'h005151e8b;
    stim[10] = 35'h29503f3f3;
    stim[11] = 35'h1e85bb51e;
    stim[12] = 35'h197c91bc3;
    stim[13] = 35'h24da2be08;
    stim[14] = 35'h0e98cf2c9;
    stim[15] = 35'h221e5d6f5;
    stim[16] = 35'h21bab2fbf;
    stim[17] = 35'h3f1ea106a;
    stim[18] = 35'h34e6c9195;
    stim[19] = 35'h11efd0d83;
    stim[20] = 35'h08779bcb9;
    stim[21] = 35'h0879e7ba7;
    stim[22] = 35'h37368233c;
    stim[23] = 35'h122f5782c;
    stim[24] = 35'h2a5d0f632;
    stim[25] = 35'h03a09b364;
    stim[26] = 35'h3da5aa02f;
    stim[27] = 35'h2e8e7ad6e;
    stim[28] = 35'h1ea35230f;
    stim[29] = 35'h06a4407b7;
    stim[30] = 35'h1ca80163e;
    stim[31] = 35'h08a56cbfa;
    stim[32] = 35'h2ff85673e;
    stim[33] = 35'h19028d297;
    stim[34] = 35'h0b34412ed;
    stim[35] = 35'h066ac708c;
    stim[36] = 35'h04825bdae;
    stim[37] = 35'h127d1af68;
    stim[38] = 35'h006cd04fd;
    stim[39] = 35'h2ce60b52f;
    stim[40] = 35'h1d4721a8a;
    stim[41] = 35'h275ab17b4;
    stim[42] = 35'h370027b2f;
    stim[43] = 35'h18c06a121;
    stim[44] = 35'h074ed0fbf;
    stim[45] = 35'h12ab4c6c7;
    stim[46] = 35'h0c4572971;
    stim[47] = 35'h2884750d8;
    stim[48] = 35'h2d32c3cba;
    stim[49] = 35'h350b0bc85;
    stim[50] = 35'h162ec8dfe;
    stim[51] = 35'h2780b8bf9;
    stim[52] = 35'h2d50406f6;
    stim[53] = 35'h2090d57b8;
    stim[54] = 35'h20f6b8dc9;
    stim[55] = 35'h0086535a0;
    stim[56] = 35'h0b0e67d3a;
    stim[57] = 35'h19571bad1;
    stim[58] = 35'h3fa4f3864;
    stim[59] = 35'h112adad9c;
    stim[60] = 35'h0d6727f10;
    stim[61] = 35'h3cf5738a1;
    stim[62] = 35'h253359899;
    stim[63] = 35'h3b83995df;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h18a74fbac;
      expv[3] = 35'h4fddffaf8;
      expv[4] = 35'h473326eb4;
      expv[5] = 35'h770ddf0bf;
      expv[6] = 35'h770ddf0bf;
      expv[7] = 35'h770ddf0be;
      expv[8] = 35'h6d1f19c90;
      expv[9] = 35'h4e96d3600;
      expv[10] = 35'h405151e8a;
      expv[11] = 35'h69503f3f3;
      expv[12] = 35'h29503f3f3;
      expv[13] = 35'h5e85bb51f;
      expv[14] = 35'h5e85bb51e;
      expv[15] = 35'h4e98cf2c8;
      expv[16] = 35'h621e5d6f4;
      expv[17] = 35'h61bab2fbf;
      expv[18] = 35'h21bab2fbf;
      expv[19] = 35'h7f1ea106a;
      expv[20] = 35'h51efd0d82;
      expv[21] = 35'h48779bcb8;
      expv[22] = 35'h4879e7ba7;
      expv[23] = 35'h4879e7ba7;
      expv[24] = 35'h4879e7ba7;
      expv[25] = 35'h0879e7ba7;
      expv[26] = 35'h0879e7ba7;
      expv[27] = 35'h6a5d0f633;
      expv[28] = 35'h2a5d0f633;
      expv[29] = 35'h6e8e7ad6e;
      expv[30] = 35'h46a4407b7;
      expv[31] = 35'h06a4407b7;
      expv[32] = 35'h06a4407b7;
      expv[33] = 35'h06a4407b7;
      expv[34] = 35'h5ca80163e;
      expv[35] = 35'h4b34412ec;
      expv[36] = 35'h466ac708c;
      expv[37] = 35'h44825bdaf;
      expv[38] = 35'h44825bdae;
      expv[39] = 35'h406cd04fc;
      expv[40] = 35'h6ce60b52f;
      expv[41] = 35'h2ce60b52f;
      expv[42] = 35'h2ce60b52f;
      expv[43] = 35'h5d4721a8a;
      expv[44] = 35'h58c06a120;
      expv[45] = 35'h474ed0fbe;
      expv[46] = 35'h52ab4c6c6;
      expv[47] = 35'h4c4572970;
      expv[48] = 35'h6884750d8;
      expv[49] = 35'h6d32c3cba;
      expv[50] = 35'h750b0bc84;
      expv[51] = 35'h562ec8dfe;
      expv[52] = 35'h6780b8bf8;
      expv[53] = 35'h6d50406f7;
      expv[54] = 35'h6d50406f6;
      expv[55] = 35'h60f6b8dc8;
      expv[56] = 35'h4086535a0;
      expv[57] = 35'h4b0e67d3a;
      expv[58] = 35'h59571bad0;
      expv[59] = 35'h7fa4f3864;
      expv[60] = 35'h512adad9c;
      expv[61] = 35'h4d6727f10;
      expv[62] = 35'h7cf5738a0;
      expv[63] = 35'h653359898;
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
